import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tenis_match/src/models/calendar_model.dart';
import 'package:tenis_match/src/providers/crud_file.dart';
import 'package:tenis_match/src/screens/calendar/blocs.dart';

class CalendarController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var nameUserC = TextEditingController(text: '').obs;
  var horarioC = TextEditingController(text: '').obs;
  var court = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isEnabledButton = false.obs;
  RxBool isEnabledAnimation = true.obs;
  Rx<DateTime> date = DateTime.now().obs;
  var rainPercentage = ''.obs;
  RxBool isEnabledGetClimate = true.obs;

  setCourt(value) {
    court.value = value;
    enabledButton();
  }

  bucleAnimation() {
    Future.delayed(const Duration(seconds: 6), () {
      isEnabledAnimation.value = !isEnabledAnimation.value;
      Future.delayed(const Duration(milliseconds: 500), () {
        isEnabledAnimation.value = !isEnabledAnimation.value;
      });
      bucleAnimation();
    });
  }

  bool availableDate() {
    bool isAvailable = false;
    if (evalueList().length < 3) {
      isAvailable = true;
    } else {
      isAvailable = false;
      disableMessage();
    }
    return isAvailable;
  }

  evalueList() {
    final listReservationCubit =
        Get.context!.read<ListReservationCubit>().state;
    final listNumCourt = listReservationCubit
        .where((item) => item.split('#')[2] == court.value)
        .toList();
    final listNumCourtDate = listNumCourt
        .where((item) => item.split('#')[1] == formatDate(date.value))
        .toList();
    return listNumCourtDate;
  }

  enabledButton() {
    bool isEnabled = false;
    if (nameUserC.value.text.isNotEmpty && court.value != '') {
      isEnabled = true;
    }
    isEnabledButton.value = isEnabled;
  }

  String? validator(String? value) =>
      value == null || value.isEmpty ? 'Este campo no puede estar vacio' : null;

  String formatDate(date) => DateFormat('yyyy-MM-dd').format(date).toString();

  buttonAction() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formkey.currentState!.validate()) return;
    if (availableDate()) {
      isLoading.value = true;
      await saveCreateLocale(calendarModel: calendarValue());
      isLoading.value = false;
      Get.back();
      saveMessage();
    }
  }

  CalendarModel calendarValue() => CalendarModel(
        nameUser: nameUserC.value.text,
        date: formatDate(date.value),
        court: court.value,
        rainPercentage: rainPercentage.value,
      );

  saveMessage() {
    Get.snackbar(
      'Cancha reservada correctamente',
      'Fue reservada la cancha exitosamente\na nombre de: ${nameUserC.value.text}, para la fecha: ${formatDate(date.value)} ',
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 4),
    );
  }

  disableMessage() {
    Get.defaultDialog(
        title: 'Cancha no disponible',
        middleText:
            'Esta cancha no está disponible para la fecha seleccionada, pruebe con otra fecha u otra cancha.',
        onConfirm: () => Get.back());
  }
}
