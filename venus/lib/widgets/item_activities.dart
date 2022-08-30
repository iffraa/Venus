
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/schedule_screen.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/utility.dart';

class ActivityItem extends StatefulWidget {
  String day;
  int listIndex;

  ActivityItem(this.day, this.listIndex);

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return  GestureDetector(
        onTap:(){
          setState((){
         //   ScheduleScreen.selectedIndex = widget.listIndex;
          });
        },
        child:Container(
          margin: EdgeInsets.only(left: 1.h,right: 1.h),
          alignment: Alignment.center,
          width: 15.h,
          decoration: BoxDecoration(
              border: Border.all(
              //  color: ScheduleScreen.selectedIndex == widget.listIndex ? Colour.tealColor : Colour.blackColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding:  EdgeInsets.all(0.4.h),
            child: Text(
              widget.day ,
              style:  TextStyle(
                  fontSize: _scale.normalTxt,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  }
}
