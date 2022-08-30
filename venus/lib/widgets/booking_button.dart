import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';

class BookingButton extends StatelessWidget {
  final String text;
  final Function onClickAction;

  const BookingButton(this.text, this.onClickAction)
  ;

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // onPrimary: Colors.black87,
         primary: Colour.tealColor,
        minimumSize: Size(MediaQuery
            .of(context)
            .size
            .width, 5.h),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.2.h)),
        ),
      ),
      onPressed: () {
        onClickAction();
      },
      child: Text(text.toUpperCase(), style:  TextStyle(
          fontSize: _scale.subHeading,
          color: Colors.white),),
    );
  }

}
