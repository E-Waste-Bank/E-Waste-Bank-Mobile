# 🍃 E-Waste Bank 🍃
## Mobile (flutter)
> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

## 📱 Tautan APK 📱
Anda dapat mengunduh apk kami di `(soon)`

## 🌏 Alur Pengintegrasian dengan Web Service 🌏
Berikut ini adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.
1. Mengimplementasikan sebuah wrapper class dengan menggunakan library http dan map untuk mendukung penggunaan cookie-based authentication pada aplikasi. 
2. Kemudian, mengimplementasikan REST API pada Django (views.py) yang sudah dibuat sebelumnya dengan menggunakan JsonResponse atau Django JSON Serializer.
3. Selanjutnya, integrasi dilakukan dengan mengimplementasikan desain front-end untuk aplikasi berdasarkan desain web.
4. Kemudian, melakukan integrasi antara front-end dengan back-end dengan menggunakan konsep asynchronous HTTP.

## 👩🏻‍💻 Pengembang Aplikasi 🧑🏻‍💻
- [Hugo Sulaiman Setiawan](https://github.com/hugo-setiawan) (2106707315)
- [Hayfa Najma](https://github.com/HayfaNajma07) (2106653754)
- [Ibni Shaquille Syauqi Ibrahim](https://github.com/IbniShaquille) (2106706735)
- [Raditya Aditama](https://github.com/ratama98) (2106750313)
- [Riona Adani Ghaisani](https://github.com/rionadani) (2106750995)

## 📃 Cerita Aplikasi 📃
Sampah elektronik (*e-waste*) merupakan salah satu efek samping dari Transformasi Digital yang terjadi pada masa kini. Menurut data dari [Global E-Waste Monitor](https://ewastemonitor.info/), terdapat 53 juta ton sampah elektronik yang dihasilkan oleh seluruh negara di dunia pada tahun 2020. Estimasi yang dilakukan oleh badan yang sama juga menyajikan kesimpulan bahwa laju pertumbuhan sampah elektronik akan terus berkembang, bahkan dalam waktu sekitar 8 tahun, yaitu pada tahun 2030, diperkirakan bahwa akan ada 120 juta ton sampah elektronik yang dihasilkan oleh manusia! Jika situasi ini terus berlanjut, dampaknya akan sangat besar, baik bagi manusia, flora, dan fauna. 

Gaya hidup yang serba digital seperti saat ini, membuat kita sangat bergantung dengan berbagai barang elektronik. Kita menjadi sering membeli gadget versi terbaru agar lebih up to date. Namun, hal ini juga membuat kita seringkali membuang gadget yang masih layak pakai. Hal ini tentu sangat tidak baik bagi lingkungan. Oleh karena itu, kami membuat aplikasi yang bernama E-Waste Bank. Aplikasi ini bertujuan untuk memudahkan masyarakat untuk mengumpulkan dan mengelola barang elektronik yang sudah tidak layak pakai. 

Aplikasi ini dapat digunakan oleh masyarakat untuk mendapatkan uang melalui menjual barang elektronik yang sudah tidak layak pakai. Aplikasi ini juga dapat melakukan penjemputan barang elektronik bekas ke lokasi yang ditentukan oleh pengguna. selain itu, pengguna juga mendapatkan edukasi melalui aplikasi ini dengan diadakannya jenis-jenis E-Waste yang ada dan cara mengelola E-Waste yang benar.

## 👥 Daftar Modul 👥
Berikut ini adalah daftar modul yang akan diimplementasikan beserta pengembang dari setiap modul.
- About Us- [Riona Adani Ghaisani](https://github.com/rionadani)
- Halaman Utama - Semua Anggota
- Request Penjemputan - [Ibni Shaquille Syauqi Ibrahim](https://github.com/IbniShaquille)
- Tips and Tricks - [Hayfa Najma](https://github.com/HayfaNajma07)
- Manage Keuangan
  - User - [Hugo Sulaiman Setiawan](https://github.com/hugo-setiawan)
  - Admin - [Raditya Aditama](https://github.com/ratama98)

## 👩🏻‍💻 Persona Aplikasi 👩🏻‍💻
### 👤 Admin 👤
Admin dapat:
- Memiliki akses ke halaman utama dan semua modul
- Memiliki akses untuk mengedit dan menambahkan informasi mengenai E-Waste

### 🔒 User Yang Tidak Login 🔒
User yang tidak login dapat:
- Memiliki akses untuk ke halaman utama
- Memiliki akses untuk fitur Tips and Tricks

### 🔑 User Yang Sudah Login 🔑
User yang sudah login dapat:
- Memiliki akses ke halaman utama.
- Memiliki akses untuk semua fitur yang ada pada aplikasi E-Waste Bank.
