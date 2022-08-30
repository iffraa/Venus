import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/book_form_screen.dart';
import 'package:venus/utils/user_table.dart';

import '../models/attendee.dart';
import '../utils/AppScale.dart';
import '../utils/attendee_list_counter.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import 'list_input_field.dart';

class ItemAddAttendee extends StatefulWidget{
  final Attendee attendee ;
  final String noOfattendee ;


  const ItemAddAttendee(this.attendee, this.noOfattendee);

  @override
  State<StatefulWidget> createState() => _ItemAddAttendeeState();
}

class _ItemAddAttendeeState extends State<ItemAddAttendee> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {

    AppScale _scale = AppScale(context);
    return  Column(
      children: <Widget>[
        Container(
          height: 5.2.h,
          decoration: const BoxDecoration(color: Colour.tealColor),
          child: Align(
              child: Text(
                'Participant  ' + widget.noOfattendee ,
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: _scale.subHeading, color: Colors.white),
              )),
        ),
        Column(
          children: [
            ListInputField(
                "Name", TextInputType.name,
                onChanged: (v)=>  onDataChanged(v, UserTableKeys.name)
            ),
            ListInputField(Strings.mobileTxt, TextInputType.number,
                onChanged: (v)=>  onDataChanged(v, UserTableKeys.contactNo)
            ),
            ListInputField("Email", TextInputType.emailAddress,
              onChanged: (v)=>  onDataChanged(v, UserTableKeys.email))
              ],
        ),
        SizedBox(height: 2.h,)
      ],

    );

  }

  void itemChanged(String val)
  {
    print("itemsss " + val);
  }

  onSearchChanged(String query, String field) {
    print("name is  " + query);

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      print("name is changing " + query);
      setState(() {
        field = query;
      });
    });
  }

  onDataChanged(String val, String fieldName) {
    print("id is  " + val);

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      print("id is changing " + val);
      switch (fieldName) {
        case UserTableKeys.contactNo:
          Provider.of<AttendeeListCounter>(context, listen: false).updateContact(widget.attendee, val);
          break;
        case UserTableKeys.name:
          Provider.of<AttendeeListCounter>(context, listen: false).updateName(widget.attendee, val);
          break;
        case UserTableKeys.email:
          Provider.of<AttendeeListCounter>(context, listen: false).updateEmail(widget.attendee, val);
          break;

      }


    });
  }

}