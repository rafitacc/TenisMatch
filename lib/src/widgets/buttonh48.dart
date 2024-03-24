import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonH48 extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isLoading;
  final Function function;
  final Color? color;
  final double width;
  final double minimumSize;
  final IconData? icon;
  const ButtonH48({
    super.key,
    required this.text,
    required this.isEnabled,
    this.isLoading = false,
    required this.function,
    this.color,
    this.width = 190,
    this.minimumSize = 190,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading
          ? () {
              function();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        disabledBackgroundColor: Get.theme.colorScheme.shadow,
        minimumSize: Size(minimumSize, 50),
        maximumSize: Size(width, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: isEnabled
                          ? Colors.white
                          : Get.theme.colorScheme.surface,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
      ),
    );
  }
}
