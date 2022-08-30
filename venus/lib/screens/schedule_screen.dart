import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/utils/calender_date.dart';
import 'package:venus/widgets/schedule_calender.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/item_activities.dart';
import '../widgets/item_schedule.dart';
import '../widgets/main_drawer.dart';

class ScheduleScreen extends StatefulWidget {
  static const routeName = '/schedule';
  static bool isChecked = false;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final box = GetStorage();
  Future<String>? futureTerms;
  List<bool> _selectedList = [];//List.generate(200, (i) => false); // Pre filled list
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);
    bool isChecked = false;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(AppBar(), Strings.scheduleTitle),
        drawer: MainDrawer(),
        body: Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleCalender(),
                  FutureBuilder<String>(
                      future: futureTerms,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          EasyLoading.dismiss();
                          return Text(
                            snapshot.data!!,
                            style: TextStyle(fontSize: _scale.subHeading),
                          );
                        } else {
                          // EasyLoading.show();
                          return Column(
                            children: <Widget>[
                              Container(
                                  height: 7.h,
                                  child: getHorizontalList(getActivities())),
                              SizedBox(height: 1.5.h), // give it width

                              Container(
                                  height: 60.h,
                                  child: getVerticalList(getListData()))
                            ],
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget getHorizontalList(List<String> list) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 20),
        itemCount: list.length,
        itemBuilder: (context, listIndex) {
          // return ActivityItem(list[listIndex]);
          final activity = list[listIndex];
          return GestureDetector(
            onTap:(){
              setState((){
                selectedIndex = listIndex;
              });
            },
            child:Container(
              margin: EdgeInsets.only(left: 1.h,right: 1.h),
              alignment: Alignment.center,
              width: 15.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedIndex == listIndex ? Colour.tealColor : Colour.blackColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding:  EdgeInsets.all(0.4.h),
                child: Text(
                  activity,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 17,),
                ),
              ),
            ),
          );
        }
    );


  }

  Widget getVerticalList(List<Schedule> list) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: list.length,
      itemBuilder: (context, listIndex) {
        return SceduleItem(list[listIndex]);
      },
    );
  }

  List<String> getActivities() {
    List<String> list = ["All Activities", "Instructors", "Events"];

    return list;
  }

  List<Schedule> getListData() {
    List<Schedule> list = [];

    Schedule s1 = Schedule(participants: "11", name: "Adult Open Gym", time: "12:30 PM");
    list.add(s1);

    Schedule s2 = Schedule(participants: "12", name: "1 Private Lesson", time: "10:30 PM");
    list.add(s2);

    Schedule s3 = Schedule(participants: "15", name: "4 Lap Swim", time: "12:33 PM");
    list.add(s3);

    return list;
  }

  Future<String> getTermsAndConditions() async {
    String terms = "";

    //  futureTerms = NetworkAPI().httpGetTerms(ServiceUrl.settingsUrl, null, null);

    return terms;
  }

  String getSelectedDate()
  {
    return context.watch<CalenderDate>().selectedDay.toString();

  }

  void submitMeals() {
    /*  String jsonUser = jsonEncode(MealSelectionItem.selectedMeals);
    print(jsonUser);
    String id = box.read(UserTableKeys.mealPckgId);

    Map<String, String>? params = {
      "fk_meal_ids": jsonUser,
      UserTableKeys.senderId: userData['user_id'],
      UserTableKeys.deliveryTime: DeliveryRadioGroup.deliveryTime,
      UserTableKeys.mealPckgId: id,
    };
    if (ScheduleScreen.isChecked) {
      createOrder(params);
    } else {
      Utility.showWarningAlert(context, "Please accept terms and conditions.");
    }*/
  }
}

