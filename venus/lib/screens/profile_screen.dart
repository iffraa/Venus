import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/utils/strings.dart';

import '../models/user.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userArgs = GetStorage().read(Strings.userData) as User;
    AppScale _scale = AppScale(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(AppBar(), Strings.profileTitle),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              userArgs.name,
              style: TextStyle(fontSize: _scale.heading, color: Colors.black),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 2.h),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 5.h,
              alignment: Alignment.center,
              color: Colour.tealColor,
              child:  Text(
                Strings.personalInfoTxt,
                style: TextStyle(fontSize: _scale.subHeading, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding:  EdgeInsets.all(2.2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 1.h,
                        children: <Widget>[
                           Text(
                            Strings.idTxt,
                            style: TextStyle(
                                fontSize: _scale.profileTxt,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userArgs.id.toString(),
                            style:  TextStyle(fontSize: _scale.profileTxt),
                          )
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Wrap(
                        spacing: 1.h,
                        children: <Widget>[
                           Text(
                            Strings.mobileTxt,
                            style: TextStyle(
                                fontSize: _scale.profileTxt,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userArgs.mobileNo ?? "",
                            style:  TextStyle(fontSize: _scale.profileTxt),
                          )
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Wrap(
                        spacing: 1.h,
                        children: <Widget>[
                           Text(
                            Strings.emailTxt,
                            style: TextStyle(
                                fontSize: _scale.profileTxt,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userArgs.email,
                            style:  TextStyle(fontSize: _scale.profileTxt),
                          )
                        ],
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1.2.h),
                    child:Image.memory(height: 10.h,
                        width: 10.h,
                        base64Decode(userArgs.qrImg ?? ""))
                  ),                ],
              ),
            ),
          ],
        ),
      ),
    );

    /*  return Scaffold(
      //  drawer: MainDrawer(),

        body: Stack(
      children: <Widget>[
       // BaseAppBar(AppBar(), 'assets/images/splash_bg.png',""),
        Center(child: Text("Profile Screen"),)
      ],
    ));*/
  }


}
