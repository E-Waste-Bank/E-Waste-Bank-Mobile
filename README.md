# 🍃 E-Waste Bank 🍃
[![Staging](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/staging.yml/badge.svg)](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/staging.yml) [![Pre-release](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/pre-release.yml/badge.svg)](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/pre-release.yml) [![Release](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/release.yml/badge.svg)](https://github.com/E-Waste-Bank/e_waste_bank_mobile/actions/workflows/release.yml) [![Build status](https://build.appcenter.ms/v0.1/apps/f8e0058f-2ee0-48a6-a041-87b3d1ab2b71/branches/main/badge)](https://appcenter.ms)

## Mobile (flutter)
> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

## 📱 Tautan APK 📱
Anda dapat mengunduh apk kami di `https://install.appcenter.ms/orgs/e-waste-bank/apps/e_waste_bank_mobile/distribution_groups/public`

## 👩🏻‍💻 Pengembang Aplikasi 🧑🏻‍💻
- [Hugo Sulaiman Setiawan](https://github.com/hugo-setiawan) (2106707315)
- [Hayfa Najma](https://github.com/HayfaNajma07) (2106653754)
- [Ibni Shaquille Syauqi Ibrahim](https://github.com/IbniShaquille) (2106706735)
- [Raditya Aditama](https://github.com/ratama98) (2106750313)
- [Riona Adani Ghaisani](https://github.com/rionadani) (2106750995)

---------------------------
## 📃 Cerita Aplikasi 📃
Sampah elektronik (*e-waste*) merupakan salah satu efek samping dari Transformasi Digital yang terjadi pada masa kini. Menurut data dari [Global E-Waste Monitor](https://ewastemonitor.info/), terdapat 53 juta ton sampah elektronik yang dihasilkan oleh seluruh negara di dunia pada tahun 2020. Estimasi yang dilakukan oleh badan yang sama juga menyajikan kesimpulan bahwa laju pertumbuhan sampah elektronik akan terus berkembang, bahkan dalam waktu sekitar 8 tahun, yaitu pada tahun 2030, diperkirakan bahwa akan ada 120 juta ton sampah elektronik yang dihasilkan oleh manusia! Jika situasi ini terus berlanjut, dampaknya akan sangat besar, baik bagi manusia, flora, dan fauna. 

Gaya hidup yang serba digital seperti saat ini, membuat kita sangat bergantung dengan berbagai barang elektronik. Kita menjadi sering membeli gadget versi terbaru agar lebih up to date. Namun, hal ini juga membuat kita seringkali membuang gadget yang masih layak pakai. Hal ini tentu sangat tidak baik bagi lingkungan. Oleh karena itu, kami membuat aplikasi yang bernama E-Waste Bank. Aplikasi ini bertujuan untuk memudahkan masyarakat untuk mengumpulkan dan mengelola barang elektronik yang sudah tidak layak pakai. 

Aplikasi ini dapat digunakan oleh masyarakat untuk mendapatkan uang melalui menjual barang elektronik yang sudah tidak layak pakai. Aplikasi ini juga dapat melakukan penjemputan barang elektronik bekas ke lokasi yang ditentukan oleh pengguna. selain itu, pengguna juga mendapatkan edukasi melalui aplikasi ini dengan diadakannya jenis-jenis E-Waste yang ada dan cara mengelola E-Waste yang benar.

---------------------------
## 🌏 Alur Pengintegrasian dengan Web Service 🌏
Berikut ini adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.
1. Mengimplementasikan sebuah wrapper class dengan menggunakan library http dan map untuk mendukung penggunaan cookie-based authentication pada aplikasi. 
2. Kemudian, mengimplementasikan REST API pada Django (views.py) yang sudah dibuat sebelumnya dengan menggunakan JsonResponse atau Django JSON Serializer.
3. Selanjutnya, integrasi dilakukan dengan mengimplementasikan desain front-end untuk aplikasi berdasarkan desain web.
4. Kemudian, melakukan integrasi antara front-end dengan back-end dengan menggunakan konsep asynchronous HTTP.

---------------------------
## 👥 Daftar Modul dan Alur Pengintegrasian 👥
Berikut ini beberapa fitur yang disediakan pada aplikasi E-Waste Bank:
### 🔎 About Us- [Riona Adani Ghaisani](https://github.com/rionadani)
Fitur ini akan menampilkan

### 🚚 Request Penjemputan - [Ibni Shaquille Syauqi Ibrahim](https://github.com/IbniShaquille)
Fitur ini akan menampilkan

### 💡 Tips and Tricks - [Hayfa Najma](https://github.com/HayfaNajma07)
Fitur ini akan menampilkan informasi tentang tips dan tricks mengenai pengelolaan sampah elektronik yang baik dan informasi lainnya yang terkait dengan sampah elektronik dalam bentuk card. Lalu, untuk role admin dapat menambahkan tips and tricks baru.

### 💰 Manage Keuangan
### 💸 User - [Hugo Sulaiman Setiawan](https://github.com/hugo-setiawan)
Fitur ini akan menampilkan jumlah saldo yang dimiliki user (yang akan diatur lebih lanjut oleh *admin* pada modul Manage Keuangan - Admin). Selain itu, fitur ini juga memungkinkan pengguna untuk me-*request* penarikan uang melalui fitur *Cashout*. *Request* penarikan uang yang dibuat akan disimpan pada server, kemudian *admin* akan menyetujui penarikan tersebut. 
    
### 💸 Admin - [Raditya Aditama](https://github.com/ratama98)

Apabila pengguna yang sedang login merupakan seorang admin, fitur ini akan menampilkan halaman manage keuangan admin di mana admin tersebut dapat melakukan hal-hal berikut: mengakses data keuangan dan data cashout semua user, menyetujui request cashout dari user, dan mengatur keuangan user.

---------------------------
## 👩🏻‍💻 Persona Aplikasi 👩🏻‍💻
### 👤 Admin 👤
- Pada halaman about us, admin dapat melihat tentang aplikasi E-Waste Bank, feedback orang lain mengenai aplikasi, dan dapat memberikan feedback.
- Pada halaman tips and tricks, admin dapat melihat berbagai tips dan tricks dan mencari tips dan tricks, serta menambahkan tips dan tricks baru.
- Pada halaman Request Penjemputan, admin dapat melakukan request penjemputan sampah dan mengisi detail penjemputan sampah yang telah ditentukan. Lalu, admin juga dapat melihat detail penjemputannya, serta memperbarui status request penjemputan dan melakukan penghapusan request.
- Pada halaman Manage Keuangan, admin dapat mengakses data keuangan dan data cashout semua user, menyetujui request cashout dari user, dan mengatur keuangan user.

### 🔒 User Yang Tidak Login 🔒
- Pada halaman about us, user dapat melihat tentang aplikasi E-Waste Bank, feedback orang lain mengenai aplikasi, dan dapat memberikan feedback.
- Pada halaman tips and tricks, user dapat melihat berbagai tips dan tricks dan mencari tips dan tricks.

### 🔑 User Yang Sudah Login 🔑
- Pada halaman about us, user dapat melihat tentang aplikasi E-Waste Bank, feedback orang lain mengenai aplikasi, dan dapat memberikan feedback.
- Pada halaman tips and tricks, user dapat melihat berbagai tips dan tricks dan mencari tips dan tricks.
- Pada halaman Request Penjemputan, user dapat melakukan request penjemputan sampah dan mengisi detail penjemputan sampah yang telah ditentukan. Lalu, user juga dapat melihat detail penjemputannya (tanggal penjemputan, status, berat sampah, dan lain-lain) setelah user melakukan request.
- Pada halaman Manage Keuangan, user dapat membuat penarikan baru.
