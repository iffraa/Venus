import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/widgets/form_button.dart';
import 'package:venus/widgets/item_events.dart';
import 'package:venus/widgets/map_button.dart';
import 'package:venus/widgets/text_normal.dart';

import '../models/event.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/booking_button.dart';
import '../widgets/item_activities.dart';
import '../widgets/item_schedule.dart';
import '../widgets/main_drawer.dart';

class BookingScreen extends StatefulWidget {
  static const routeName = '/booking';
  static bool isChecked = false;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final box = GetStorage();
  Future<String>? futureTerms;

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
        appBar: BaseAppBar(AppBar(), Strings.bookingTitle),
        drawer: MainDrawer(),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 4.h, bottom: 2.4.h),
              alignment: Alignment.topLeft,
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            ("https://zerofat.warsitech.net/uploads/mealpackages/16552971982211.JPG") ??
                                ""),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BookingButton(Strings.bookingTitle, onBookingAction),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Week 5 concert Marshmello Week 5 concert Marshmello",
                          style: TextStyle(
                              fontSize: _scale.heading,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 4.h,
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            TextNormal("11 August 2022")
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 4.h,
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            TextNormal("07:15 PM")
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 4.h,
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            TextNormal("From 150.00 SAR")
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/email.png',
                              width: 4.h,
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            SizedBox(
                                width: 27.h,
                                child:
                                    TextNormal("Riyad Mohammed Abdo Arena SA")),
                            SizedBox(
                              width: 1.h,
                            ),
                            MapButton("Go to Map", onMapClick)
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Colour.tealColor,
                            fontSize: _scale.navButton,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Text(
                          "this is a dummy description this is a dummy description this is a dummy description abcdhhhh",
                          style: TextStyle(
                              color: Colour.blackColor,
                              fontSize: _scale.navButton,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void onMapClick() {}

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
