import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/AppScale.dart';
import '../utils/strings.dart';
import '../utils/utility.dart';

class ListInputField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  //final FormFieldSetter<String> onChanged;
  Timer? _debounce;
  final Function(String) onChanged;


  ListInputField(this.hintText, this.textInputType,{required this.onChanged})
      ;


  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h),
      child: TextFormField(
        onChanged:(val) => onChanged(val),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Strings.emptyFieldsTxt;
          }
          return null;
        },
        textAlignVertical: TextAlignVertical.center,
        obscureText: hintText.contains(Strings.pwdTxt) ? true : false,
        style:  TextStyle(fontSize: _scale.subHeading),
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.3.h),
            borderSide: BorderSide(
              color: Colors.black54,
              width: 0.2.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(2.3.h),
          ),
          contentPadding:  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 3.8.h),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.3.h),
              borderSide: const BorderSide(color: Colors.grey)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize:_scale.subHeading),
        ),
      ),
    );
  }

  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // do something with query
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
  }
}
