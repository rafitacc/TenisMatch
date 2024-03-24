import 'dart:convert';

CalendarModel calendarModelFromJson(String str) =>
    CalendarModel.fromJson(json.decode(str));

String calendarModelToJson(CalendarModel data) => json.encode(data.toJson());

class CalendarModel {
  String nameUser;
  String date;
  String court;
  String rainPercentage;

  CalendarModel({
    required this.nameUser,
    required this.date,
    required this.court,
    required this.rainPercentage,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        nameUser: json["nameUser"],
        date: json["date"],
        court: json["court"],
        rainPercentage: json["rainPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "nameUser": nameUser,
        "date": date,
        "court": court,
        "rainPercentage": rainPercentage,
      };
}
