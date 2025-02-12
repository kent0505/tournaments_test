import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Stack(
        children: [
          TextField(
            controller: controller,
            readOnly: readOnly,
            inputFormatters: [LengthLimitingTextInputFormatter(20)],
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'w700',
            ),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 22,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.accent,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: controller.text.isEmpty
                      ? const Color(0xff313344)
                      : AppColors.accent,
                  width: 1,
                ),
              ),
              hintStyle: const TextStyle(
                color: Color(0xff8B8E93),
                fontSize: 20,
                fontFamily: 'w400',
              ),
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: onChanged,
            onTap: onTap,
          ),
          Positioned(
            left: 16,
            top: 6,
            child: Text(
              labelText,
              style: const TextStyle(
                color: Color(0xff8B8E93),
                fontSize: 12,
                fontFamily: 'w400',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
