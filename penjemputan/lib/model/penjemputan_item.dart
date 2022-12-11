// To parse this JSON data, do
//
//     final penjemputan_item = penjemputan_itemFromJson(jsonString);

import 'dart:convert';
// import 'dart:ffi';

List<penjemputan_item> penjemputan_itemFromJson(String str) => List<penjemputan_item>.from(json.decode(str).map((x) => penjemputan_item.fromJson(x)));

String penjemputan_itemToJson(List<penjemputan_item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class penjemputan_item {
    penjemputan_item({
        required this.id,
        required this.alamat,
        required this.tanggal_jemput,
        required this.waktu_jemput,
        required this.waktu_sekarang,
        required this.jenis_sampah,
        required this.berat_sampah,
    });

    int id;
    String alamat;
    String tanggal_jemput;
    String waktu_jemput;
    String waktu_sekarang;
    String jenis_sampah;
    int berat_sampah;

    factory penjemputan_item.fromJson(Map<String, dynamic> json) => penjemputan_item(
        id: json["pk"],
        alamat: json["fields"]["alamat"],
        tanggal_jemput: json["fields"]["tanggal_jemput"],
        waktu_jemput: json["fields"]["waktu_jemput"],
        waktu_sekarang: json["fields"]["waktu_sekarang"],
        jenis_sampah: json["fields"]["jenis_sampah"],
        berat_sampah: json["fields"]["berat_sampah"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "tanggal_jemput": tanggal_jemput,
        "waktu_jemput": waktu_jemput,
        "waktu_sekarang": waktu_sekarang,
        "jenis_sampah": jenis_sampah,
        "berat_sampah": berat_sampah,
    };
}
