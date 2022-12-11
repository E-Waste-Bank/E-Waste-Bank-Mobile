// To parse this JSON data, do
//
//     final PenjemputanItem = PenjemputanItemFromJson(jsonString);

import 'dart:convert';
// import 'dart:ffi';

List<PenjemputanItem> penjemputanItemFromJson(String str) => List<PenjemputanItem>.from(json.decode(str).map((x) => PenjemputanItem.fromJson(x)));

String penjemputanItemToJson(List<PenjemputanItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PenjemputanItem {
    PenjemputanItem({
        required this.id,
        required this.alamat,
        required this.tanggalJemput,
        required this.waktuJemput,
        required this.waktuSekarang,
        required this.jenisSampah,
        required this.beratSampah,
    });

    int id;
    String alamat;
    String tanggalJemput;
    String waktuJemput;
    String waktuSekarang;
    String jenisSampah;
    int beratSampah;

    factory PenjemputanItem.fromJson(Map<String, dynamic> json) => PenjemputanItem(
        id: json["pk"],
        alamat: json["fields"]["alamat"],
        tanggalJemput: json["fields"]["tanggal_jemput"],
        waktuJemput: json["fields"]["waktu_jemput"],
        waktuSekarang: json["fields"]["waktu_sekarang"],
        jenisSampah: json["fields"]["jenis_sampah"],
        beratSampah: json["fields"]["berat_sampah"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "tanggal_jemput": tanggalJemput,
        "waktu_jemput": waktuJemput,
        "waktu_sekarang": waktuSekarang,
        "jenis_sampah": jenisSampah,
        "berat_sampah": beratSampah,
    };
}
