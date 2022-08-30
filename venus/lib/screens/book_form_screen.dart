import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/schedule_screen.dart';
import 'package:venus/utils/attendee_list_counter.dart';
import 'package:venus/utils/quantity_widget.dart';
import 'package:venus/widgets/item_add_attendee.dart';
import 'package:venus/widgets/nav_button.dart';
import 'package:venus/widgets/text_normal.dart';
import '../models/attendee.dart';
import '../models/event.dart';
import '../services/network_api.dart';
import '../services/service_url.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/PackagesDropdown.dart';
import '../widgets/attendee_counter.dart';
import '../widgets/base_app_bar.dart';
import '../widgets/form_button.dart';
import '../widgets/input_form_field.dart';
import '../widgets/list_input_field.dart';
import '../widgets/main_drawer.dart';
import '../widgets/packages_rg.dart';
import 'my_tickets_screen.dart';

class BookFormScreen extends StatefulWidget {
  static const routeName = '/bookingForm';
  static List<Attendee> enteredAttendees = [];

  @override
  State<BookFormScreen> createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name = "", participants = "", mobile = "", id, gender, email;
  final box = GetStorage();
  int quantity = 0;
  bool isSaving = false;
  late VenusEvent event;
  EventPackage selectedEPackage =
      EventPackage(id: 1, name: "dummy", price: "s", noOfUser: "333");

  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context)!.settings.arguments as VenusEvent;
    AppScale _scale = AppScale(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(AppBar(), Strings.bookingTitle),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 3.5.h, right: 3.5.h,top: MediaQuery.of(context).size.height * 0.13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 3.h,
                ),

                Text(
                  "Select Package",
                  style: TextStyle(
                    color: Colour.blackColor,
                    fontSize: _scale.subHeading,
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: PackagesRg(event.ePackages),
                ),
                Row(
                  children: [
                    Text(
                      "Participants",
                      style: TextStyle(
                        color: Colour.blackColor,
                        fontSize: _scale.subHeading,
                      ),
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    AttendeeCounter(),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                getList(),
                NavButton("Book Ticket", onBookingAction)
              ],
            ),
          ),
        ],
      ),
    );
  }

  String isListDataEmpty(List<Attendee> atte) {
    String msg = "";

    for (int i = 0; i < atte.length; i++) {
      Attendee attendee = atte[i];
      String name = attendee.name ?? "";
      String id = attendee.contact ?? "";

      if (name.isEmpty) {
        msg = "Please enter name.";
      } else if (id.isEmpty) {
        msg = "Please enter id.";
      }
      else if (id.length < 8) {
        msg = "Please enter 8-12 digit id.";
      }
    }

    return msg;
  }

  void onBookingAction() {
    List<Attendee> atte =
        Provider.of<AttendeeListCounter>(context, listen: false).attendees;

    String validationMsg = isListDataEmpty(atte);
    if (validationMsg.isNotEmpty) {
      Utility.showSubmitAlert(context, validationMsg, "Venus", onFailureAlert);

    } else {
      print("final attendees " + atte.length.toString()!);

      String jsonAttendees = jsonEncode(atte);
      print(jsonAttendees);

      Map<String, dynamic>? params = {
        "attendee": atte,
        UserTableKeys.memberEventId: event.id.toString(),
        UserTableKeys.packageTypeId: PackagesRg.selectedEPackage.id.toString(),
        UserTableKeys.noOfAttendee: atte.length.toString(),
      };

      inviteAttendees(params);
    }
  }

  void inviteAttendees(Map<String, dynamic>? params) async {
    Map<String, String> headers = {
      'Authorization': "Bearer " + box.read("token"),
    };

    print("pck id " + PackagesRg.selectedEPackage.id.toString());
    try {
      EasyLoading.show();
      NetworkAPI().httpSubmitPostReq(
          ServiceUrl.inviteAttendeesUrl, headers, params!, (error, response) {
        print(response);
        String msg = response!['message']!;
        if (!error) {
          Utility.showSubmitAlert(
              context, msg, Strings.reqSubmittedTxt, onSuccessAlert);
        } else {
          Utility.showSubmitAlert(context, msg, "", onFailureAlert);
        }
        EasyLoading.dismiss();
      });
    } catch (e) {
      Utility.showSubmitAlert(context, Strings.noRecordTxt, "", null);
    }
  }

  Widget getList() {
    List<TextEditingController> _controllers = [];
    List<Attendee> atte = context.watch<AttendeeListCounter>().attendees;

    print("attendees " + atte.length.toString());

    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: atte.length,
          itemBuilder: (context, index) {
            _controllers.add(TextEditingController());
            return ItemAddAttendee(atte[index], (index + 1).toString());
          }),
    );
  }

  void onSuccessAlert() {
    Navigator.of(context).pop(); // dismiss dialog
    Navigator.pop(context);
    Navigator.of(context).pushNamed(MyTicketsScreen.routeName);
  }

  void onFailureAlert() {
    Navigator.of(context).pop(); // dismiss dialog
  }
}
