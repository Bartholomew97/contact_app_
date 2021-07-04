
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFieldProperties {

  final Color labelColor;
  final Color hintTextColor;
  final String hintText;
  final bool isValidated;

  const CustomTextFieldProperties(
      {this.labelColor = Colors.black,
        this.hintTextColor = Colors.black,
        this.hintText = '',
        this.isValidated = false});
}