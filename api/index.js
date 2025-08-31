const express = require("express");
const { execFile } = require("child_process");
const app = express();
app.use(express.json());
const fs = require("fs").promises;

// ===================== SSH =====================
app.post("/add-sshh", (req, res) => {
  const { username, exp, paswd, limitip, id } = req.body;

  if (!username || !paswd || !limitip || !exp) {
    return res.status(400).json({ error: "harap isi dengan benar" });
  }

  execFile("add-sshpi.sh", [username, paswd, limitip, exp, id], async (error, stdout, stderr) => {
    if (error) return res.status(500).json({ error: error.message });
    if (stderr) return res.status(500).json({ error: stderr });

    try {
      console.log(id);
      const jsonString = await fs.readFile(`/etc/akun/${id}`, "utf8");
      const data = JSON.parse(jsonString);
      res.status(200).json({
        status: "200",
        data: data[`ssh-${username}`],
      });
    } catch (err) {
      res.status(500).json({
        status: "500",
        data: "Gagal Membuat Akun",
      });
    }
  });
});

// ===================== VMESS =====================
app.post("/add-vmess", (req, res) => {
  const { username, exp, paswd, limitip, kouta, id } = req.body;

  if (!username || !paswd || !limitip || !exp || !kouta) {
    return res.status(400).json({ error: "harap isi dengan benar" });
  }

  execFile("add-vnesss.sh", [username, limitip, exp, kouta, id], async (error, stdout, stderr) => {
    if (error) return res.status(500).json({ error: error.message });
    if (stderr) return res.status(500).json({ error: stderr });

    try {
      console.log(id);
      const jsonString = await fs.readFile(`/etc/akun/${id}`, "utf8");
      const data = JSON.parse(jsonString);
      res.status(200).json({
        status: "200",
        data: data[`vmess-${username}`],
      });
    } catch (err) {
      res.status(500).json({
        status: "500",
        data: "Gagal Membuat Akun",
      });
    }
  });
});

// ===================== TROJAN =====================
app.post("/add-trojan", (req, res) => {
  const { username, exp, paswd, limitip, kouta, id } = req.body;

  if (!username || !paswd || !limitip || !exp || !kouta) {
    return res.status(400).json({ error: "harap isi dengan benar" });
  }

  execFile("add-trojan.sh", [username, limitip, exp, kouta, id], async (error, stdout, stderr) => {
    if (error) return res.status(500).json({ error: error.message });
    if (stderr) return res.status(500).json({ error: stderr });

    try {
      console.log(id);
      const jsonString = await fs.readFile(`/etc/akun/${id}`, "utf8");
      const data = JSON.parse(jsonString);
      res.status(200).json({
        status: "200",
        data: data[`trojan-${username}`],
      });
    } catch (err) {
      res.status(500).json({
        status: "500",
        data: "Gagal Membuat Akun",
      });
    }
  });
});

// ===================== VLESS =====================
app.post("/add-vless", (req, res) => {
  const { username, exp, paswd, limitip, kouta, id } = req.body;

  if (!username || !paswd || !limitip || !exp || !kouta) {
    return res.status(400).json({ error: "harap isi dengan benar" });
  }

  execFile("add-vless.sh", [username, limitip, exp, kouta, id], async (error, stdout, stderr) => {
    if (error) return res.status(500).json({ error: error.message });
    if (stderr) return res.status(500).json({ error: stderr });

    try {
      console.log(id);
      const jsonString = await fs.readFile(`/etc/akun/${id}`, "utf8");
      const data = JSON.parse(jsonString);
      res.status(200).json({
        status: "200",
        data: data[`vless-${username}`],
      });
    } catch (err) {
      res.status(500).json({
        status: "500",
        data: "Gagal Membuat Akun",
      });
    }
  });
});

// ===================== GET DATA BY ID =====================
app.post("/get-data-by-id", async (req, res) => {
  const id = req.body.id;
  try {
    const jsonString = await fs.readFile(`/etc/akun/${id}`, "utf8");
    const data = JSON.parse(jsonString);
    res.status(200).json({
      status: "200",
      data: data,
    });
  } catch (err) {
    res.status(500).json({
      status: "500",
      data: "Gagal memuat akun",
    });
  }
});

app.listen(3000, () => console.log("Server berjalan di port 3000"));
