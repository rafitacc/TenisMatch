// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tenis_match/src/models/climate_model.dart';
import 'package:tenis_match/src/utils/snackbars.dart';

class ClimateService {
  Future<ClimateModel?> getClimate({
    String lat = '10.4758',
    String long = '-66.8994',
    String date = '',
  }) async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=46f7a7047ef7e63ece2f8559540e672d';

    try {
      final response = await http.post(Uri.parse(url));
      final decodedData = json.decode(response.body);
      final value = ClimateModel.fromJson(decodedData);
      return value;
    } catch (e) {
      SnackBars.snackbar(
        title: "Error",
        message: 'No se pudo cargar los datos del clima: $e',
        duration: 3,
      );
      return null;
    }
  }
}
