import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/constants/asset_paths.dart';

class SwipePublicity extends StatefulWidget {
  const SwipePublicity({super.key});

  @override
  State<SwipePublicity> createState() => _SwipePublicityState();
}

class _SwipePublicityState extends State<SwipePublicity> {
  SwiperController controller = SwiperController();

  var listimages = [
    AssetPath.image3,
    AssetPath.image4,
    AssetPath.image5,
  ];

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return SizedBox(
      height: Get.width / 2,
      width: Get.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Image.asset(
                listimages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: listimages.length,
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        curve: Curves.easeOutExpo,
        duration: (1500),
        autoplayDelay: 5000,
        controller: controller,
      ),
    );
  }
}
