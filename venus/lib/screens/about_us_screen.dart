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

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userArgs = GetStorage().read(Strings.userData) as User;
    AppScale _scale = AppScale(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(AppBar(), Strings.aboutTitle),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "this is a dummy description this is a dummy description this is a dummy description abcdhhhh",
              style: TextStyle(fontSize: _scale.profileTxt, color: Colors.black),
              textAlign: TextAlign.center,
            ),
             SizedBox(height: 2.h),
          ]
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
