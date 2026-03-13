import 'package:flutter/material.dart';
import 'package:test_project/core/constants/app_color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.addMore = false,
  });

  final String? label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines;
  final bool addMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor,
                ),
              ),
              if (addMore)
                Text(
                  "Add more",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColor,
                  ),
                ),
            ],
          ),
        if (label != null) SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColor.textBackground,
            hintText: hint,
            hintStyle: TextStyle(color: AppColor.hintColor),
          ),
        ),
      ],
    );
  }
}
