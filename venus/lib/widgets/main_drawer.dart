import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/about_us_screen.dart';
import 'package:venus/screens/book_form_screen.dart';
import 'package:venus/screens/booking_screen.dart';
import 'package:venus/screens/event_screen.dart';
import 'package:venus/screens/logout_screen.dart';
import 'package:venus/screens/my_tickets_screen.dart';
import 'package:venus/screens/profile_screen.dart';
import 'package:venus/screens/schedule_screen.dart';

import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/utility.dart';

bool  visible = false;


class MainDrawer extends StatefulWidget {
  static bool  _visible = Utility.isLoggedIn;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  Widget buildListTile(String title, VoidCallback tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  Widget buildLoginTile(String title, VoidCallback tapHandler) {
    return Visibility(
      visible: (MainDrawer._visible && title.contains("Login")) ? false :
      (!MainDrawer._visible && title.contains("Login"))? true : MainDrawer._visible,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        onTap: tapHandler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String userName = ""; //GetStorage().read(UserTableKeys.username);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.grey.withOpacity(0.4),
            child: Padding(
              padding:  EdgeInsets.only(top: 4.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_icon.png',
                    width: 70,
                    height: 70,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    Strings.welcomeHeaderTxt,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22),
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),



         /* buildListTile(Strings.scheduleTitle, () {
            Navigator.of(context).pushNamed(ScheduleScreen.routeName);
          }),
          buildListTile(Strings.eventTitle, () {
            Navigator.of(context).pushNamed(EventScreen.routeName);
          }),
          buildListTile(Strings.bookingTitle, () {
            Navigator.of(context).pushNamed(BookFormScreen.routeName);
          }),*/
          buildLoginTile(Strings.dashboardTitle, () {
            Navigator.of(context).pushNamed(DashboardScreen.routeName);
          }),
          buildLoginTile(Strings.profileTitle, () {
            Navigator.of(context).pushNamed(ProfileScreen.routeName);
          }),
          buildLoginTile(Strings.purchasesTitle, () {
            Navigator.of(context).pushNamed(MyTicketsScreen.routeName);
          }),
          buildLoginTile(Strings.calenderTitle, () {
            //  Navigator.of(context).pushNamed(LoginScreen.routeName);
          }),
          buildLoginTile(Strings.vCalenderTitle, () {
            Navigator.of(context).pushNamed(ScheduleScreen.routeName);
          }),
          buildLoginTile(Strings.eventTitle, () {
            Navigator.of(context).pushNamed(EventScreen.routeName);
          }),
          buildLoginTile(Strings.contractPoliciesTitle, () {
            //Navigator.of(context).pushNamed(ScheduleScreen.routeName);
          }),

          buildListTile(Strings.aboutTitle, () {
            Navigator.of(context).pushNamed(AboutScreen.routeName);
          }),
          buildLoginTile(Strings.logoutTitle, () {
           LogoutScreen l = LogoutScreen(context);
           l.showLogout();
          }),
          buildLoginTile(Strings.loginBtn, () {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }),


        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

      if (Utility.isLoggedIn ) {
        setState(() {
          MainDrawer. _visible = true;
        });
      } else {
        setState(() {
          MainDrawer._visible = false;
        });
      }

  }
}
