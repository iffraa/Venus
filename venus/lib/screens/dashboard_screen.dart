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

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final userArgs = GetStorage().read(Strings.userData) as User;
    AppScale _scale = AppScale(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(AppBar(), "My " + Strings.dashboardTitle),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(1.2.h),
              child:Image.network(userArgs.profileImg ?? "",
                fit: BoxFit.fill,
                height:10.h,
                width: 10.h,
              ),
            ),
            Text(
              userArgs.name,
              style: TextStyle(fontSize: _scale.heading, color: Colors.black),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 0.5.h),
            Text(
              userArgs.role + " - " + userArgs.resort!,
              style: TextStyle(fontSize: _scale.subHeading, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),

            Container(
              alignment: Alignment.topLeft,
              padding:  EdgeInsets.all(2.2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(1.2.h),
                        child:Image.memory(height: 13.h,
                            width: 13.h,
                            base64Decode(userArgs.qrImg ?? ""))
                    ),
                  ),
                  SizedBox(height: 3.h,),
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
