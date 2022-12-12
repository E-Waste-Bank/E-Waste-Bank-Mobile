// To parse this JSON data, do
//
//     final PenjemputanItem = PenjemputanItemFromJson(jsonString);

import 'dart:convert';
// import 'dart:ffi';

List<PenjemputanItem> penjemputanItemFromJson(String str) => List<PenjemputanItem>.from(json.decode(str).map((x) => PenjemputanItem.fromJson(x)));

String penjemputanItemToJson(List<PenjemputanItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PenjemputanItem {
    PenjemputanItem({
        required this.alamat,
        required this.tanggalJemput,
        required this.waktuJemput,
        required this.jenisSampah,
        required this.beratSampah,
        required this.isDone,
    });

    String alamat;
    String tanggalJemput;
    String waktuJemput;
    String jenisSampah;
    int beratSampah;
    bool isDone;

    factory PenjemputanItem.fromJson(Map<String, dynamic> json) => PenjemputanItem(
        alamat: json["fields"]["alamat"],
        tanggalJemput: json["fields"]["tanggal_jemput"],
        waktuJemput: json["fields"]["waktu_jemput"],
        jenisSampah: json["fields"]["jenis_sampah"],
        beratSampah: json["fields"]["berat_sampah"],
        isDone: json["fields"]["is_finished"],
    );

    Map<String, dynamic> toJson() => {
        "alamat": alamat,
        "tanggal_jemput": tanggalJemput,
        "waktu_jemput": waktuJemput,
        "jenis_sampah": jenisSampah,
        "berat_sampah": beratSampah,
    };
}
