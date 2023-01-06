import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextFormFieldsController {
  static Widget textFormField({
    IconData? preFixIcon,
    required String hintText,
    required TextEditingController controller,
    required String onChangeValue,
    required String errorText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(preFixIcon),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(width: 1, color: Colors.blue))),
        onChanged: (String value) {
          onChangeValue = value;
        },
        validator: (value) {
          return value!.isEmpty ? errorText : null;
        },
      ),
    );
  }
}
