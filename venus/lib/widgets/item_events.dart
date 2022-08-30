
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/join_event_screen.dart';
import '../models/event.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';

class EventItem extends StatelessWidget {
  VenusEvent event;

  EventItem(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Padding(
      padding:  EdgeInsets.only( bottom: 4.h,
          left: 2.h,  right: 2.h),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(JoinEventScreen.routeName,
              arguments: event);
        },

        child: Container(
            height: 25.h,
            width: 10.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h),
              image: DecorationImage(
                image: NetworkImage(
                    event.image ?? "" ),
                fit: BoxFit.fill,
              ),

            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                event.eventTitle ?? "",
                style: TextStyle(
                    //background: Paint()..color = Colors.black38,
                    fontSize: _scale.navButton,
                    color: Colour.blackColor,)
              ),
            )),
      ),
    );
  }
}
