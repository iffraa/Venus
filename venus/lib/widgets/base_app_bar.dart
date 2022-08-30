import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';
import 'main_drawer.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AppBar appBar;
  final String title;

  BaseAppBar(this.appBar, this.title) : super();

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);
    _scaffoldKey;
    false; // This!

    return AppBar(
      centerTitle: true,
      title: Padding(
        padding:  EdgeInsets.only(top: 2.h),
        child: Text(
          title,
          style:  TextStyle(fontSize: _scale.appBarHeading, color: Colour.blackColor, ),
        ),
      ),
      actions: <Widget>[
       /* SizedBox(
          width: 80,
          height: 80,
          child: IconButton(
            icon: Image.asset('assets/images/app_icon.png'),
            padding: EdgeInsets.only(top: 12,right: 8),
            onPressed: () {
              //   Navigator.of(context).pushNamed(WelcomeScreen.routeName);
            },
          ),
        )*/
      ],
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      // elevation: 0.0,
      leading:
          showBackBtn(title) ? getBackIcon(context) : getDrawerIcon(context),
    );
  }

  bool showBackBtn(String title) {
    if (title.contains('Details')) {
      return true;
    }
    return false;
  }

  IconButton getDrawerIcon(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/app_icon.png'),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }

  IconButton getBackIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
