// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/models/climate_model.dart';
import 'package:tenis_match/src/screens/calendar/controller.dart';
import 'package:tenis_match/src/screens/calendar/widgets/data_picker.dart';
import 'package:tenis_match/src/screens/calendar/widgets/select_court.dart';
import 'package:tenis_match/src/services/services.dart';
import 'package:tenis_match/src/widgets/buttonh48.dart';
import 'package:tenis_match/src/widgets/input_text.dart';

class Calendarview extends GetResponsiveView<CalendarController> {
  Calendarview({super.key});
  @override
  var controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(Get.context!).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Reservación',
            style:
                Get.theme.textTheme.titleLarge!.copyWith(color: Colors.white),
          ),
        ),
        body: Obx(() => _body()),
      ),
    );
  }

  Widget _body() {
    return Form(
      key: controller.formkey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 30),
          SelectCourtView(),
          const SizedBox(height: 30),
          InputText(
            name: 'Nombre de quien reserva',
            textController: controller.nameUserC.value,
            controller: controller,
            onChanged: () => controller.enabledButton(),
          ),
          const SizedBox(height: 30),
          DataPickerView(),
          const SizedBox(height: 30),
          _loadClimate(),
          const SizedBox(height: 30),
          ButtonH48(
              text: 'Reservar',
              isLoading: controller.isLoading.value,
              isEnabled: controller.isEnabledButton.value,
              function: () => controller.buttonAction()),
        ],
      ),
    );
  }

  _loadClimate() {
    return controller.isEnabledGetClimate.value
        ? FutureBuilder(
            future: ClimateService().getClimate(),
            builder:
                (BuildContext context, AsyncSnapshot<ClimateModel?> snapshot) {
              if (snapshot.hasData) {
                final rainPercentage = snapshot.data!.list[0].pop;
                Future.delayed(const Duration(milliseconds: 10), () {
                  controller.rainPercentage.value = rainPercentage;
                  controller.isEnabledGetClimate.value = false;
                });
                return _dateClimate();
              } else {
                Future.delayed(const Duration(milliseconds: 10), () {
                  controller.rainPercentage.value = '';
                });
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        : _dateClimate();
  }

  Widget _dateClimate() {
    return controller.rainPercentage.value != ''
        ? Row(
            children: [
              const Icon(Icons.cloud),
              const SizedBox(width: 8),
              Text(
                'porcetanje de lluvia: ${controller.rainPercentage.value}%',
                style: Get.theme.textTheme.titleMedium!.copyWith(),
              ),
            ],
          )
        : const SizedBox();
  }
}
