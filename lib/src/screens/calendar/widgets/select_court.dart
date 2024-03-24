// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/constants/asset_paths.dart';
import 'package:tenis_match/src/screens/calendar/controller.dart';

class SelectCourtView extends GetResponsiveView<CalendarController> {
  SelectCourtView({super.key});
  @override
  var controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 1), () {
    //   controller.bucleAnimation();
    // });
    return Obx(() => _body());
  }

  Widget _body() {
    return Column(
      children: [
        Text(
          "Selecciona una de las canchas:",
          style: Get.theme.textTheme.titleLarge!,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _selectCourtImage(
              image: AssetPath.image1,
              name: 'A',
            ),
            _selectCourtImage(
              image: AssetPath.image2,
              name: 'B',
            ),
            _selectCourtImage(
              image: AssetPath.image4,
              name: 'C',
            ),
          ],
        ),
      ],
    );
  }

  Widget _selectCourtImage({required String image, required String name}) {
    return GestureDetector(
      onTap: () => controller.setCourt(name),
      child: BounceInUp(
        duration: const Duration(milliseconds: 700),
        animate: controller.isEnabledAnimation.value,
        child: Column(
          children: [
            Container(
              width: controller.court.value == name
                  ? Get.width * 0.3
                  : Get.width * 0.2,
              height: controller.court.value == name
                  ? Get.width * 0.3
                  : Get.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: controller.court.value == name ? 4 : 3.0,
                  color: controller.court.value == name
                      ? Get.theme.colorScheme.secondary
                      : Colors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              name,
              style: Get.theme.textTheme.titleLarge!.copyWith(
                color: controller.court.value == name
                    ? Get.theme.colorScheme.secondary
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
