import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';

class MapButton extends StatelessWidget {
  final String text;
  final Function onClickAction;

  const MapButton(this.text, this.onClickAction)
  ;

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(side: BorderSide(width: 0.2.h,color: Colour.tealColor),
        // onPrimary: Colors.red,
        primary: Colors.white,
        minimumSize: Size(4.h, 3.5.h),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(1.2.h)),
        ),
      ),
      onPressed: () {
        onClickAction();
      },
      child: Text(text, style:  TextStyle(
          fontSize: _scale.navButton,
          color: Colour.blackColor),),
    );
  }

}
