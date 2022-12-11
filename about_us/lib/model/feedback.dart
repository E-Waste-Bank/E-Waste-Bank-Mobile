// To parse this JSON data, do
//
//     final feedbacks = feedbacksFromJson(jsonString);

import 'dart:convert';

List<Feedbacks> feedbacksFromJson(String str) => List<Feedbacks>.from(json.decode(str).map((x) => Feedbacks.fromJson(x)));

String feedbacksToJson(List<Feedbacks> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feedbacks {
    Feedbacks({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Feedbacks.fromJson(Map<String, dynamic> json) => Feedbacks(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.name,
        required this.yourFeedback,
        required this.date,
    });

    String name;
    String yourFeedback;
    DateTime date;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        yourFeedback: json["your_feedback"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "your_feedback": yourFeedback,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
