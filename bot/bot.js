// bot.js
const TelegramBot = require("node-telegram-bot-api");
const axios = require("axios");
const { Buffer } = require("buffer");

// Token bot Telegram
const token = process.env.BOT_TOKEN || "6707393645:AAEPFKxU5nUQqU2BqHxlIowu6npiDC2tc7E"; 
const host = "http://localhost";
const port = 3000;
const bot = new TelegramBot(token, { polling: true });
const menu = {
    reply_markup: {
      inline_keyboard: [
        [{ text: "Back to menu", callback_data: "back_menu" }],
      ],
    },
  };
  
const owner = "Zsandz";
const repo = "Kiryu";
const path = "izin-ip-sandz"; // path file di repo
const branch = "main";
  const tokengit = "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";

// Ambil isi file dulu (untuk dapat sha)
const url = `https://api.github.com/repos/${owner}/${repo}/contents/${path}?ref=${branch}`;
// Simpan state input user
const userSessions = {};

function getFutureDate(daysAhead) {
  const now = new Date();
  now.setDate(now.getDate() + daysAhead);

  const thn = now.getFullYear();
  const bln = String(now.getMonth() + 1).padStart(2, "0");
  const tgl = String(now.getDate()).padStart(2, "0");

  return { tgl, bln, thn };
}

async function loading(bot, chatId, text = "Loading", step = 5, interval = 800) {
  let message = await bot.sendMessage(chatId, `${text}: [░░░░░░░░░░] 0%`);

  let progress = 0;
  let loading = setInterval(() => {
    progress += step;
    let bar = "█".repeat(progress / step) + "░".repeat(10 - progress / step);

    bot.editMessageText(`${text}: [${bar}] ${progress}%`, {
      chat_id: chatId,
      message_id: message.message_id
    });

    if (progress >= 100) {
      clearInterval(loading);
      bot.deleteMessage(chatId, message.message_id).catch(err => console.log(err));
    }
  }, interval);
}

async function updateFile(user, ip, daysAhead) {
  try {
    // ambil data file
    const getRes = await axios.get(url, {
      headers: { Authorization: `token ${tokengit}` },
    });
    const fileData = getRes.data;

    const oldContent = Buffer.from(fileData.content, "base64").toString("utf-8");

    // hitung tanggal otomatis
    const { tgl, bln, thn } = getFutureDate(daysAhead);

    // Tambah isi baru
    const newContent = oldContent + `\n### ${user} ${thn}-${bln}-${tgl} ${ip}`;

    // Push update ke GitHub
    const res = await axios.put(
      url,
      {
        message: "Update file txt via Node.js",
        content: Buffer.from(newContent).toString("base64"),
        sha: fileData.sha,
        branch,
      },
      {
        headers: {
          Authorization: `token ${tokengit}`,
          "Content-Type": "application/json",
        },
      }
    );

    console.log("Berhasil:", res.data);
  } catch (err) {
    if (err.response) {
      console.error("Gagal update:", err.response.data);
    } else {
      console.error("Error:", err.message);
    }
  }
}



// ======= MENU UTAMA =======
bot.onText(/\/start/, (msg) => {
  const chatId = msg.chat.id;
  const opts = {
    reply_markup: {
      inline_keyboard: [
        [{ text: "➕ Buat Akun", callback_data: "buat_akun" }],
        [{ text: "📂 Lihat akun saya", callback_data: "lihat_akun" }],
        [{ text: "Sewa Script",
  callback_data: "izinsc" }],
      ],
    },
  };
  bot.sendMessage(chatId, "Selamat datang! Pilih menu:", opts);
});

// ======= HANDLE BUTTON =======
bot.on("callback_query", async (query) => {
  const chatId = query.message.chat.id;
  const messageId = query.message.message_id;

  // Hapus pesan button
  await bot.deleteMessage(chatId, messageId).catch((err) => {
    console.error("Gagal hapus pesan:", err);
  });

  // Buat akun baru
  if (query.data === "buat_akun") {
    const opts = {
      reply_markup: {
        inline_keyboard: [
          [{ text: "SSH", callback_data: "akun_ssh" }],
          [{ text: "VMESS", callback_data: "akun_vmess" }],
          [{ text: "TROJAN", callback_data: "akun_trojan" }],
          [{ text: "VLESS", callback_data: "akun_vless" }],
        ],
      },
    };
    return bot.sendMessage(chatId, "Pilih jenis akun:", opts);
  }
  //back to menu
    if (query.data === "back_menu") {
    const opts = {
    reply_markup: {
      inline_keyboard: [
        [{ text: "➕ Buat Akun", callback_data: "buat_akun" }],
        [{ text: "📂 Lihat akun saya", callback_data: "lihat_akun" }],
        [{ text: "Sewa Script",
  callback_data: "izinsc" }],
      ],
    },
  };
    return bot.sendMessage(chatId, "Selamat datang! Pilih menu:", opts);
  }
  //sewa sc
  if (query.data === "izinsc") {
  const expsc = {
    reply_markup: {
      inline_keyboard: [
        [{ text: "📅 30 DAYS", callback_data: "30d" }],
        [{ text: "📅 60 DAYS", callback_data: "60d" }],
        [{ text: "📅 Lifetime",
  callback_data: "lifetime" }],
      ],
    },
  };
    return bot.sendMessage(chatId, "Silahkan pilih paket", expsc);
  }
  
  if (query.data === "30d") {
    const type = query.data
    userSessions[chatId] = { step: "askip", type, data: {} };
    return bot.sendMessage(chatId, "Masukkan IP Vps Kamu:");
  }
  if (query.data === "60d") {
    const type = query.data
    userSessions[chatId] = { step: "askip", type, data: {} };
    return bot.sendMessage(chatId, "Masukkan IP Vps Kamu:");
  }
  if (query.data === "lifetime") {
    const type = query.data
    userSessions[chatId] = { step: "askip", type, data: {} };
    return bot.sendMessage(chatId, "Masukkan IP Vps Kamu:");
  }

  // Pilih jenis akun
  if (query.data.startsWith("akun_")) {
    const type = query.data.replace("akun_", "");
    userSessions[chatId] = { step: 1, type, data: {} };
    return bot.sendMessage(chatId, "Masukkan username:");
  }

  // Lihat akun
  if (query.data === "lihat_akun") {
    try {
      const res = await axios.post(`${host}:${port}/get-data-by-id`, {
        id: chatId,
      });
      const message = res.data && Object.keys(res.data).length
        ? `📂 Daftar akun kamu:\n\`\`\`\n${JSON.stringify(res.data, null, 2)}\n\`\`\``
        : "❌ Tidak ada akun ditemukan.";
      bot.sendMessage(chatId, message, { parse_mode: "Markdown",
      menu });
    } catch (e) {
      bot.sendMessage(chatId, "❌ Tidak ada akun ditemukan.", menu);
    }
  }
});

// ======= HANDLE INPUT STEP BY STEP =======
bot.on("message", async (msg) => {
  const chatId = msg.chat.id;
  const userid = msg.from.id;
  const text = msg.text.trim(); // hapus spasi depan & belakang

  // Abaikan pesan jika bukan sesi input atau command
  if (!userSessions[chatId] || text.startsWith("/")) return;

  const session = userSessions[chatId];
  const { step, type, data } = session;

  // ======= VALIDASI =======
  const isAlphanumeric = (str) => /^[a-zA-Z0-9]+$/.test(str); 
  const isNumeric = (str) => /^[0-9]+$/.test(str);  
 const isValidIP = (str) => {
  const ipRegex = /^(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)){3}$/;
  return ipRegex.test(str);
};

  if (step === "askip") {
    if (!isValidIP(text)) {
      return bot.sendMessage(chatId, "❌ IP Tidak Valid.");
    }
    data.ip = text;
    session.step = "username";
    return bot.sendMessage(chatId, "Masukan Username:");
    
  }
  
  if (step === "username") {
    
    if (!isAlphanumeric(text)) {
      return bot.sendMessage(chatId, "❌ Username hanya boleh huruf/angka tanpa spasi.");
      }
    if (text.length < 3 || text.length > 12) {
      return bot.sendMessage(chatId, "❌ Username minimal 3 dan maksimal 12 karakter.");
    }
    data.username = text;
    session.step = "username";
    let expsc;
    if (type === "30d") {expsc = 30;}
    if (type === "60d") {expsc = 60;}
    if (type === "lifetime") {expsc = 76337;}
    try {
    updateFile(data.username, data.ip, expsc)
    loading(bot, chatId)
    return  bot.sendMessage(chatId, `berhasil Menambahkan ${data.ip}.`);
    } catch (e) {
      return bot.sendMessage(chatId, "Gagal Menambahkan Ip.")
    }
    delete userSessions[chatId];
  }

  if (step === 1) {
    if (!isAlphanumeric(text)) {
      return bot.sendMessage(chatId, "❌ Username hanya boleh huruf/angka tanpa spasi.");
    }
    if (text.length < 3 || text.length > 12) {
      return bot.sendMessage(chatId, "❌ Username minimal 3 dan maksimal 12 karakter.");
    }
    data.username = text;
    session.step++;
    return bot.sendMessage(chatId, "Masukkan password:");
  }

  if (step === 2) {
    if (!isAlphanumeric(text)) {
      return bot.sendMessage(chatId, "❌ Password hanya boleh huruf/angka tanpa spasi.");
    }
    if (text.length < 4 || text.length > 16) {
      return bot.sendMessage(chatId, "❌ Password minimal 4 dan maksimal 16 karakter.");
    }
    data.paswd = text;
    session.step++;
    return bot.sendMessage(chatId, "Masukkan limit IP (angka):");
  }

  if (step === 3) {
    if (!isNumeric(text)) {
      return bot.sendMessage(chatId, "❌ Limit IP harus berupa angka.");
    }
    data.limitip = text;
    session.step++;
    return bot.sendMessage(chatId, "Masukkan expired (hari, angka):");
  }

  if (step === 4) {
    if (!isNumeric(text)) {
      return bot.sendMessage(chatId, "❌ Expired harus berupa angka (hari).");
    }
    data.exp = text;

    if (type === "ssh") {
      try {
        const res = await axios.post(`${host}:${port}/add-sshh`, {
          username: data.username,
          paswd: data.paswd,
          limitip: data.limitip,
          exp: data.exp,
          id: userid,
        });
        bot.sendMessage(chatId, `✅ Akun SSH berhasil dibuat!\n\`\`\`\n${JSON.stringify(res.data, null, 2)}\n\`\`\``, {
          parse_mode: "Markdown",
        });
      } catch (e) {
        bot.sendMessage(chatId, "❌ Gagal membuat akun.");
      }
      delete userSessions[chatId];
    } else {
      session.step++;
      return bot.sendMessage(chatId, "Masukkan kuota (contoh: 10GB / unlimited):");
    }
  }

  if (step === 5) {
    if (!isNumeric(text)) {
      return bot.sendMessage(chatId, "❌ Kuota harus berupa angka.");
    }
    data.kouta = text;

    let url = ``;
    if (type === "vmess") url = `${host}:${port}/add-vmess`;
    if (type === "trojan") url = `${host}:${port}/add-trojan`;
    if (type === "vless") url = `${host}:${port}/add-vless`;

    try {
      const res = await axios.post(url, {
        username: data.username,
        paswd: data.paswd,
        limitip: data.limitip,
        exp: data.exp,
        kouta: data.kouta,
        id: userid,
      });
      let text = ``;
      const data = res.data;
      if (type === "vmess") {
        text = `<code>———————————————————————————————————————</code>
<code>      XRAY/VMESS</code>
<code>———————————————————————————————————————</code>
<code>Remarks   : ${data.remarks}
Domain    : ${data.domain}
Limit Quota : ${data.user_quota} GB
Port TLS  : 400-900
Port NTLS : 80, 8080, 8081-9999
id        : ${data.key}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>———————————————————————————————————————</code>
<code> VMESS WS TLS</code>
<code>———————————————————————————————————————</code>
<code>${data.link_tls}</code>
<code>———————————————————————————————————————</code>
<code>VMESS WS NO TLS</code>
<code>———————————————————————————————————————</code>
<code>${data.link_ws}</code>
<code>———————————————————————————————————————</code>
<code> VMESS gRPC</code>
<code>———————————————————————————————————————</code>
<code>${data.link_grpc}</code>
<code>———————————————————————————————————————</code>
Berakhir Pada  : ${data.expiry_on}
<code>———————————————————————————————————————</code>`;
      }
      if (type === "trojan") {
        text = `<code>———————————————————————————————————————</code>
        DETAIL Akun Trojan
<code>———————————————————————————————————————</code>
Username         : ${data.remarks}
Quota            : ${data.user_quota} Gb
Limit ip         : ${data.user_ip} Devic
Host            : ${data.host}
Network          : ws/grpc
patch            : /trojan-ws
Uuid Sadowsok    : ${data.key}
<code>———————————————————————————————————————</code>
Link Ws        : <code>${data.link_ws}</code>
<code>———————————————————————————————————————</code>
Link Tls     : <code>${data.link_tls}</code>
<code>———————————————————————————————————————</code>
Link Grpc          : <code>${data.link_grpc}</code>
<code>———————————————————————————————————————</code>
Berakhir Pada  : ${data.expiry_on}
<code>———————————————————————————————————————</code>`;
      }
      if (type === "vless") {
        text = `<code>———————————————————————————————————————</code>
<code>      XRAY/VLESS</code>
<code>———————————————————————————————————————</code>
Remarks     : ${data.remarks} "
Domain      : ${data.domain}"
User Quota  : ${data.user_quota} GB"
User Ip     : ${data.user_ip} IP"
port TLS    : 443-900"
port WS     : 80,8880,8080"
User ID     : ${data.key}"
Encryption  : none"
Path TLS    : /vless "
ServiceName : vless-grpc
<code>———————————————————————————————————————</code>
<code> VLESS WS TLS</code>
<code>———————————————————————————————————————</code>
<code>${data.linktls}</code>
<code>———————————————————————————————————————</code>
<code>VLESS WS NO TLS</code>
<code>———————————————————————————————————————</code>
<code>${data.linkws}</code>
<code>———————————————————————————————————————</code>
<code> VLESS gRPC</code>
<code>———————————————————————————————————————</code>
<code>${data.linkgrcp}</code>
<code>———————————————————————————————————————</code>
Berakhir Pada  : ${data.exp}
<code>———————————————————————————————————————</code>
`;
      }
      bot.sendMessage(chatId, text, {
        parse_mode: "HTML", menu
      });
    } catch (e) {
      bot.sendMessage(chatId, "❌ Gagal membuat akun.", menu);
    }
    delete userSessions[chatId];
  }
});