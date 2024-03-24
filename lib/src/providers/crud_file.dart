// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tenis_match/src/models/calendar_model.dart';
import 'package:tenis_match/src/screens/calendar/blocs.dart';
import 'package:tenis_match/src/shared_preferens/user_preferens.dart';

final pref = UserPreferences();
final listReservationCubit = Get.context!.watch<ListReservationCubit>();

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> _localFilePath(value) async {
  final path = await _localPath;
  return File('$path/$value.txt');
  //todo: es necesario estandirizar la  nomenclatura para los archivos.
}

Future<File> writeJson(Map<String, dynamic> data, String name) async {
  final file = await _localFilePath(name);
  String jsonString = jsonEncode(data);
  return await file.writeAsString(jsonString);
}

Future<Map<String, dynamic>> readJson(String name) async {
  final file = await _localFilePath(name);
  final fileExists = await file.exists();
  if (fileExists) {
    try {
      print('Si hay archivo guardado $name');
      final contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      print('No hay archivo guardado $name');
      print(e);
      return {'data': 0};
    }
  } else {
    print('No hay archivo guardado $name');
    return {'data': null};
  }
}

deleteCard({required String name}) {
  Get.defaultDialog(
    title: '¿Deseas cancelar esta reservación?',
    middleText: '¿Estás seguro de querer cancelar la reservación?',
    onCancel: () => Get.back(),
    onConfirm: () {
      Get.back();
      deleteCreateLocale(name: name);
    },
    textCancel: 'cancelar',
  );
}

Future deleteCreateLocale({required String name}) async {
  try {
    final file = await _localFilePath('createLocale-$name');
    final fileExists = await file.exists();
    if (fileExists) {
      file.delete();
      deleteListCreatePreferens(name);
    }
  } on Exception catch (e) {
    print(e);
  }
}

Future saveCreateLocale({required CalendarModel calendarModel}) async {
  final name =
      '${calendarModel.nameUser}#${calendarModel.date}#${calendarModel.court}';
  final calendarJson = calendarModel.toJson();
  Map<String, dynamic> data = calendarJson;
  await writeJson(data, 'createLocale-$name');
  savedListCreatePreferens(name);
}

Future<CalendarModel> readCreateLocale({required name}) async {
  final direction = 'createLocale-$name';
  final value = await readJson(direction);
  return CalendarModel(
    nameUser: value['nameUser'],
    date: value['date'],
    court: value['court'],
    rainPercentage: value['rainPercentage'],
  );
}

savedListCreatePreferens(String name) {
  // deleteListCreatePreferens(name);
  List<String> listPrefs = pref.localCreateDate;
  listPrefs.insert(0, name);
  pref.localCreateDate = listPrefs;
  final listReservationCubit = Get.context!.read<ListReservationCubit>();
  listReservationCubit.add(name);
}

deleteListCreatePreferens(String name) {
  List<String> listPrefs = pref.localCreateDate;
  if (listPrefs.any((element) => element == name)) {
    listPrefs.remove(name);
    pref.localCreateDate = listPrefs;
    final listReservationCubit = Get.context!.read<ListReservationCubit>();
    listReservationCubit.delete(name);
  }
}

readListCreatePreferens() {
  List<String> listPrefs = pref.localCreateDate;
  for (var element in listPrefs) {
    listReservationCubit.add(element);
  }
}
