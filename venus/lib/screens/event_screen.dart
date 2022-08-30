

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/widgets/item_events.dart';

import '../models/event.dart';
import '../services/network_api.dart';
import '../services/service_url.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/item_activities.dart';
import '../widgets/item_schedule.dart';
import '../widgets/main_drawer.dart';

class EventScreen extends StatefulWidget {
  static const routeName = '/events';
  static bool isChecked = false;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final box = GetStorage();
  Future<List<VenusEvent>>? futureEvents;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);
    bool isChecked = false;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(AppBar(), Strings.eventTitle),
        drawer: MainDrawer(),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<VenusEvent>>(
                      future: futureEvents,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          EasyLoading.show();
                          return Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Center(
                              child: Text(
                                "No data found",
                                style: TextStyle(fontSize: _scale.subHeading),
                              ),
                            ),
                          );
                        } else {
                          EasyLoading.dismiss();
                          return getEventList(snapshot);
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  Widget getEventList(AsyncSnapshot  snapshot) {
    return  Container(
      padding: EdgeInsets.only(bottom: 6.h,left: 2.h, right: 2.h),
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: 0
        ),
        itemCount: snapshot!.data.length,
        itemBuilder: (context, index) {
          return EventItem(snapshot.data![index]);
        },
      ),
    );
  }

  Future<List<VenusEvent>>? getEvents() async {
    GetStorage box = GetStorage();
    
    
    Map<String, String> headers = {
      'Authorization': "Bearer " + box.read("token"),
    };

    List<VenusEvent> mealsList = <VenusEvent>[];
    try {
      futureEvents =
          NetworkAPI().httpGetEvents(ServiceUrl.eventsUrl, headers);

    } catch (e) {
      Utility.showSubmitAlert(context, Strings.noRecordTxt,"", null);
    }
    return mealsList;
  }
}
