import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/about_us_screen.dart';
import 'package:venus/screens/book_form_screen.dart';
import 'package:venus/screens/booking_screen.dart';
import 'package:venus/screens/dashboard_screen.dart';
import 'package:venus/screens/event_screen.dart';
import 'package:venus/screens/join_event_screen.dart';
import 'package:venus/screens/login_screen.dart';
import 'package:venus/screens/my_tickets_screen.dart';
import 'package:venus/screens/profile_screen.dart';
import 'package:venus/screens/schedule_screen.dart';
import 'package:venus/utils/MyHttpOverrides.dart';
import 'package:venus/utils/attendee_list_counter.dart';
import 'package:venus/utils/calender_date.dart';
import 'package:venus/utils/colour.dart';
import 'package:venus/utils/participant_counter.dart';

Future<void> main() async {
  HttpOverrides.global =  MyHttpOverrides();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AttendeeListCounter()),
        Provider(create: (context) => CalenderDate()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme: GoogleFonts.latoTextTheme(
                  Theme
                      .of(context)
                      .textTheme,
                ),
                //  tabBarTheme: const TabBarTheme(indicator: UnderlineTabIndicator( // color for indicator (underline)
                //    borderSide: BorderSide(color: Colour.tealColor))),
                unselectedWidgetColor: Colour.blackColor,
                colorScheme: ColorScheme.fromSwatch(
                    primarySwatch: yellow, accentColor: Colour.yellowColor)
                    .copyWith(secondary: Colour.blackColor),
              ).copyWith(),
              home: LoginScreen(),
              builder: EasyLoading.init(),
              routes: {
                ScheduleScreen.routeName: (ctx) => ScheduleScreen(),
                EventScreen.routeName: (ctx) => EventScreen(),
                LoginScreen.routeName: (ctx) => LoginScreen(),
                BookFormScreen.routeName: (ctx) => BookFormScreen(),
                JoinEventScreen.routeName: (ctx) => JoinEventScreen(),
                ProfileScreen.routeName: (ctx) => ProfileScreen(),
                DashboardScreen.routeName: (ctx) => DashboardScreen(),
                AboutScreen.routeName: (ctx) => AboutScreen(),
                MyTicketsScreen.routeName: (ctx) => MyTicketsScreen(),
              }

          );
        }

    );

  }
}

const MaterialColor yellow = const MaterialColor(
  0xff000000,
  const <int, Color>{
    200: const Color(0xff000000),
    300: const Color(0xff000000),
    400: const Color(0xff000000),
    500: const Color(0xff000000),
    600: const Color(0xff000000),
    700: const Color(0xff000000),
  },
);
