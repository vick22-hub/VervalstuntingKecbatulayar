<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Verval Stunting</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f7f6; padding: 20px; display: flex; justify-content: center; }
        .kotak-login { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 100%; max-width: 400px; text-align: center; }
        input { width: 90%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px; }
        button { width: 95%; padding: 10px; margin: 10px 0; border: none; border-radius: 5px; color: white; cursor: pointer; font-weight: bold; }
        #btnLogin { background-color: #007bff; }
        #btnDaftar { background-color: #28a745; }
        #btnLogout { background-color: #dc3545; display: none; }
        #status { margin-top: 20px; font-weight: bold; color: #333; }
    </style>
</head>
<body>

<div class="kotak-login">
    <h2>Portal Verval Stunting</h2>
    <p>Silakan masuk untuk mengelola data</p>

    <input type="email" id="email" placeholder="Masukkan Email" required>
    <input type="password" id="password" placeholder="Masukkan Password" required>

    <button id="btnLogin">Masuk (Login)</button>
    <button id="btnDaftar">Daftar Akun Baru</button>
    <button id="btnLogout">Keluar (Logout)</button>

    <p id="status">Belum ada pengguna yang masuk.</p>
</div>

<script type="module">
  // 1. Mengimpor modul Firebase
 import { initializeApp } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-app.js";
  import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-auth.js";

  // PASTIKAN FORMATNYA PERSIS SEPERTI INI (ADA TANDA SAMA DENGAN)
  const firebaseConfig = {
  apiKey: "AIzaSyAJyUcVQCqyqhGDlF1juOPab6g_X4E9uMI",
  authDomain: "verval-stunting.firebaseapp.com",
  projectId: "verval-stunting",
  storageBucket: "verval-stunting.firebasestorage.app",
  messagingSenderId: "441009850036",
  appId: "1:441009850036:web:33c7412a8fa8733fce39e1",
  };

  const app = initializeApp(firebaseConfig);
  const auth = getAuth(app);

  const emailInput = document.getElementById('email');
  const passwordInput = document.getElementById('password');
  const btnLogin = document.getElementById('btnLogin');
  const btnDaftar = document.getElementById('btnDaftar');
  const btnLogout = document.getElementById('btnLogout');
  const statusTeks = document.getElementById('status');

  // Cek jika sudah login, langsung pindah ke form verval
  onAuthStateChanged(auth, (user) => {
    if (user) {
      window.location.href = "menu_utama.html"; 
    } else {
      statusTeks.innerText = "Silakan login atau daftar.";
    }
  });

  // Tombol Daftar
  btnDaftar.addEventListener('click', () => {
    createUserWithEmailAndPassword(auth, emailInput.value, passwordInput.value)
      .then((userCredential) => { 
          alert("Pendaftaran Berhasil! Lanjut ke Menu Utama."); 
          window.location.href = "menu_utama.html";
      })
      .catch((error) => { alert("Gagal Daftar: " + error.message); });
  });

  // Tombol Login
  btnLogin.addEventListener('click', () => {
    signInWithEmailAndPassword(auth, emailInput.value, passwordInput.value)
      .then((userCredential) => { 
          alert("Login Berhasil!"); 
          window.location.href = "menu_utama.html";
      })
      .catch((error) => { alert("Gagal Login: Cek kembali email dan password Anda."); });
  });
</script>

</body>
</html>
