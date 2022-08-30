
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/join_event_screen.dart';
import '../models/event.dart';
import '../models/purchase.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';

class PurchaseItem extends StatelessWidget {
  Ticket event;

  PurchaseItem(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Padding(
      padding:  EdgeInsets.only( bottom: 1.h,
          left: 2.h,  right: 2.h),
      child: InkWell(
        onTap: () {

        },

        child: Container(
            height: 9.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.noOfAttendees +
                  event.noOfAttendee!,
                  style: TextStyle(
                      //background: Paint()..color = Colors.black38,
                      fontSize: _scale.navButton,
                      color: Colour.blackColor,)
                ),
                SizedBox(height: 0.3.h,),
                Text(Strings.eventNameTitle + " " +
                    (event.memberEvent?.eventTitle)!,
                    style: TextStyle(
                      //background: Paint()..color = Colors.black38,
                      fontSize: _scale.navButton,
                      color: Colour.blackColor,)
                ),
                SizedBox(height: 0.3.h,),

                Text(Strings.eventDate + " " +
                    (event.memberEvent?.dateTime)!,
                    style: TextStyle(
                      //background: Paint()..color = Colors.black38,
                      fontSize: _scale.navButton,
                      color: Colour.blackColor,)
                ),
                SizedBox(height: 1.h,),
                Container(height: 0.2.h,color: Colour.tealColor,)
              ],

            )

        ),
      ),
    );
  }
}
