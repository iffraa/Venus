import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/screens/book_form_screen.dart';
import 'package:venus/widgets/form_button.dart';
import 'package:venus/widgets/item_events.dart';
import 'package:venus/widgets/map_button.dart';
import 'package:venus/widgets/nav_button.dart';
import 'package:venus/widgets/text_normal.dart';

import '../models/event.dart';
import '../utils/AppScale.dart';
import '../utils/attendee_list_counter.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/booking_button.dart';
import '../widgets/item_activities.dart';
import '../widgets/item_schedule.dart';
import '../widgets/main_drawer.dart';

class JoinEventScreen extends StatefulWidget {
  static const routeName = '/joining';
  static bool isChecked = false;

  @override
  State<JoinEventScreen> createState() => _JoinEventScreenState();
}

class _JoinEventScreenState extends State<JoinEventScreen> {
  final box = GetStorage();
  Future<String>? futureTerms;
  late VenusEvent event;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);
    event = ModalRoute.of(context)!.settings.arguments as VenusEvent;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(AppBar(), "Event Detail"),
        drawer: MainDrawer(),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 4.h, bottom: 2.4.h),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    height: 35.h,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        NetworkImage(
                            event.image ?? "" ),
                      ),

                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h, bottom: 2.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              event.eventTitle ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: _scale.heading),
                            ),
                            SizedBox(
                              height: 1.8.h,
                            ),
                           /* Row(
                              children: [
                                Image.asset(
                                  'assets/images/email.png',
                                  width: 2.5.h,
                                  height: 2.5.h,
                                ),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Text(
                                  "Novice",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 3.h,
                                ),
                                Image.asset(
                                  'assets/images/email.png',
                                  width: 2.5.h,
                                  height: 2.5.h,
                                ),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Text(
                                  "15665 Calories",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),*/
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h, bottom: 2.h, right: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 3.h,
                              height: 3.h,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Text("Time: ${event.dateTime!}" ?? "", style: TextStyle(fontSize: _scale.smallTxt, color: Colors.black),)
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 3.h,
                              height: 3.h,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Text("Location: ${event.location!}", style: TextStyle(fontSize: _scale.smallTxt, color: Colors.black),)
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 3.h,
                              height: 3.h,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Text("Participants: 0", style: TextStyle(fontSize: _scale.smallTxt, color: Colors.black),)
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 3.h,
                              height: 3.h,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Text("Duration: ${event.duration!}", style: TextStyle(fontSize: _scale.smallTxt, color: Colors.black),)
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.", style: TextStyle(fontSize: _scale.smallTxt,
                            color: Colors.black),),
                        SizedBox(
                          height: 2.h,
                        ),

                        NavButton("Join", onClickJoin),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ));
  }

  void onMapClick() {}
  void onClickJoin() {
    Provider.of<AttendeeListCounter>(context, listen: false).removeAll();
    Navigator.of(context).pushNamed(BookFormScreen.routeName,arguments: event);

  }
  void onBookingAction() {}

  Widget getHorizontalList(List<VenusEvent> list) {
    return Container(
      padding: EdgeInsets.only(bottom: 6.h, left: 2.h, right: 2.h),
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 0),
        itemCount: list!.length,
        itemBuilder: (context, index) {
          return EventItem(list[index]);
        },
      ),
    );
  }

  Future<String> getTermsAndConditions() async {
    String terms = "";

    //  futureTerms = NetworkAPI().httpGetTerms(ServiceUrl.settingsUrl, null, null);

    return terms;
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
