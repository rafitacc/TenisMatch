// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputText extends StatefulWidget {
  final String name;
  final String? hintText;
  final TextEditingController textController;
  final bool obscureText;
  final controller;
  final Function? onChanged;

  const InputText({
    super.key,
    required this.name,
    this.hintText,
    required this.textController,
    required this.controller,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late bool obscure;

  @override
  void initState() {
    obscure = widget.obscureText;
    widget.textController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _intro(
      name: widget.name,
      textController: widget.textController,
    );
  }

  TextInputType? keyboard({required String name}) {
    switch (name) {
      case "Dirección de correo electrónico":
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  Widget _intro({
    required String name,
    required TextEditingController textController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: Get.theme.textTheme.titleMedium),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: textController.value.text.isEmpty
                ? null
                : Border.all(
                    width: 3.0,
                    color: Get.theme.colorScheme.primary.withOpacity(0.4)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: TextFormField(
            obscureText: obscure,
            textInputAction: TextInputAction.next,
            // autofocus: true,
            maxLines: 1,
            controller: textController,
            keyboardType: keyboard(name: name),
            onChanged: (value) {
              if (widget.onChanged != null) widget.onChanged!();
              setState(() {});
            },

            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                gapPadding: 8,
                borderSide: BorderSide(
                  color: textController.value.text.isEmpty
                      ? Colors.grey
                      : Get.theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              errorStyle: Get.theme.textTheme.titleMedium!.copyWith(
                color: Get.theme.colorScheme.error,
                fontSize: 13,
              ),
              suffixIcon: widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: SizedBox(
                        child: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                gapPadding: 8,
                borderSide: BorderSide(
                  color: textController.value.text.isNotEmpty
                      ? Get.theme.colorScheme.primary
                      : Get.theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                gapPadding: 8,
                borderSide: BorderSide(
                  color: textController.value.text.isEmpty
                      ? Colors.grey
                      : Get.theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              hintText: widget.hintText,
            ),
            validator: (value) {
              return widget.controller.validator(value);
            },
          ),
        ),
      ],
    );
  }
}
