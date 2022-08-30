import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';

class NavButton extends StatelessWidget {
  final String text;
  final Function onClickAction;

  const NavButton(this.text, this.onClickAction)
  ;

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // onPrimary: Colors.black87,
               primary: Colour.tealColor,
              minimumSize: Size(30.h, 7.h),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.h)),
              ),
            ),
            onPressed: () {
              onClickAction();
            },
            child: Text(text, style:  TextStyle(
                fontSize: _scale.formButton,
                color: Colors.white),),
          ),
        )
    );
  }

}
