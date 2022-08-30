import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/book_form_screen.dart';
import 'package:venus/utils/attendee_list_counter.dart';

import '../models/attendee.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import 'list_input_field.dart';

class AttendeeCounter extends StatefulWidget{
 /* final Attendee attendee ;

  const AttendeeCounter(this.attendee);*/

  @override
  State<StatefulWidget> createState() => _AttendeeCounterState();
}

class _AttendeeCounterState extends State<AttendeeCounter> {
  int quantity =0;
  bool isSaving = false;
  @override
  Widget build(BuildContext context) {

    AppScale _scale = AppScale(context);
    return Row(children: [
      IconButton(
          color: Colors.black,
          onPressed: (isSaving || quantity < 1)
              ? () => null
              : () => decrementQuantity(quantity - 1),
          icon: Image.asset('assets/images/minus.png')),
      Text(quantity.toString(),style: TextStyle( fontSize: _scale.normalTxt),),
      IconButton(
        onPressed: (isSaving || quantity >= 10)
            ? null
            : () => addQuantity(quantity + 1),
        icon: Image.asset('assets/images/add.png'),
        //Icon(Icons.add)
      ),
    ]);
  }


  void addQuantity(int newQuantity) async {
    updateQuantity(newQuantity);
    Attendee attendee = Attendee(email: "", name: "", id: "",contact: "");
    BookFormScreen.enteredAttendees.add(attendee);
    Provider.of<AttendeeListCounter>(context, listen: false).increment(attendee);
  }

  void decrementQuantity(int newQuantity) async {
    updateQuantity(newQuantity);
    context.read<AttendeeListCounter>().decrement();
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      isSaving = true;
    });

    setState(() {
      quantity = newQuantity;
      isSaving = false;

     /* BookFormScreen.enteredAttendees.clear();
      for(int i = 0; i < quantity; i++)
      {
        Attendee attendee = Attendee(email: "", name: "", id: "");
        BookFormScreen.enteredAttendees.add(attendee);
      }*/
    });

  }

}