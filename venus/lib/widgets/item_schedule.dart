import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/screens/join_event_screen.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';

class SceduleItem extends StatelessWidget {
  Schedule gallery;

  SceduleItem(this.gallery);

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Padding(
      padding:  EdgeInsets.only( bottom: 4.h,
          left: 2.h,  right: 2.h),
      child: InkWell(
        onTap: () {
       //  Navigator.of(context).pushNamed(JoinEventScreen.routeName,arguments: this.gallery);
        },

        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(1.2.h),
              child:Image.network("https:\/\/www.imcacademy.net\/uploads\/version_images\/version_image1627476896ins.jpg",
                fit: BoxFit.fill,
                height:10.h,
                width: 10.h,
              ),
            ),
            SizedBox(width: 1.h), // give it width

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gallery.name ?? "",
                  style: TextStyle(
                      fontSize: _scale.normalTxt,
                      color: Colour.blackColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  gallery.time ?? "",
                  style: TextStyle(
                      fontSize: _scale.smallTxt,
                      color: Colour.blackColor,),
                ),
                Text(
                  gallery.participants ?? "",
                  style: TextStyle(
                    fontSize: _scale.smallestTxt,
                    color: Colour.blackColor,),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
