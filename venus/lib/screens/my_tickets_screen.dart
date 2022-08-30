

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/purchase.dart';
import 'package:venus/models/schedule.dart';
import 'package:venus/widgets/item_events.dart';
import 'package:venus/widgets/item_purchase.dart';

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

class MyTicketsScreen extends StatefulWidget {
  static const routeName = '/tickets';
  static bool isChecked = false;

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  final box = GetStorage();
  Future<List<Ticket>>? futureEvents;

  @override
  void initState() {
    super.initState();
    getTickets();
  }

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);
    bool isChecked = false;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(AppBar(), Strings.purchasesTitle),
        drawer: MainDrawer(),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.topLeft,
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<Ticket>>(
                      future: futureEvents,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          EasyLoading.show();
                          return Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: Center(
                              child: Text(
                                "",
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
      padding: EdgeInsets.only(bottom: 6.h,),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: snapshot!.data.length,
        itemBuilder: (context, index) {
          return PurchaseItem(snapshot.data![index]);
        },
      ),
    );
  }

  void getTickets() async {
    GetStorage box = GetStorage();

    Map<String, String> headers = {
      'Authorization': "Bearer " + box.read("token"),
    };

    try {
      futureEvents =
          NetworkAPI().httpGetBookedTickets(ServiceUrl.bookedTicketListUrl, headers);

    } catch (e) {
      Utility.showSubmitAlert(context, Strings.noRecordTxt,"", null);
    }
  }
}
