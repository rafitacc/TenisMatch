// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/screens/calendar/controller.dart';
import 'package:tenis_match/src/widgets/buttonh48.dart';

class DataPickerView extends GetResponsiveView<CalendarController> {
  DataPickerView({super.key});
  @override
  var controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Hero(
              tag: 'calendar',
              child: SizedBox(
                width: 100,
                child: ButtonH48(
                  text: 'Agendar',
                  icon: Icons.calendar_month,
                  isEnabled: true,
                  function: () => _showDatePicker(),
                  //controller.buttonAction(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              controller.formatDate(controller.date.value),
              style: Get.theme.textTheme.titleMedium!,
            ),
            const SizedBox(width: 10),
          ],
        ));
  }

  _showDatePicker() async {
    _showDialog(
      CupertinoDatePicker(
        minimumDate: controller.date.value,
        initialDateTime: controller.date.value,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        showDayOfWeek: true,
        onDateTimeChanged: (DateTime newDate) {
          controller.date.value = newDate;
          controller.isEnabledGetClimate.value = true;
        },
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}

class DatePickerItem extends StatelessWidget {
  const DatePickerItem({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
