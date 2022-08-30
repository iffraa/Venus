import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/utils/participant_counter.dart';

class QuantityButton extends StatefulWidget {
  int cartCount = 0;
  final int initialQuantity;
  final int allowedQuantity;
  final int totalAllowedQuantity;


  // final Future<int>? Function(int) onQuantityChange;
  QuantityButton(
      {Key? key,
      required this.initialQuantity,
      required this.allowedQuantity,
      required this.totalAllowedQuantity,
      }) //,required this.onQuantityChange})
      : super(key: key);

  @override
  _QuantityButtonState createState() =>
      _QuantityButtonState(quantity: initialQuantity);
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity;
  bool isSaving = false;

  _QuantityButtonState({required this.quantity});

  void addQuantity(int newQuantity) async {
    updateQuantity(newQuantity);

    int selectedMeals = Provider.of<AttendeeCounter>(context, listen: false).count;

  //  if (selectedMeals < widget.totalAllowedQuantity) {
      Provider.of<AttendeeCounter>(context, listen: false).increment();
  //  }
  }

  void decrementQuantity(int newQuantity) async {
    updateQuantity(newQuantity);
    context.read<AttendeeCounter>().decrement();
  }

  void updateQuantity(int newQuantity) {
    setState(() {
      isSaving = true;
    });

    setState(() {
      quantity = newQuantity;
      isSaving = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    int count = Provider.of<AttendeeCounter>(context, listen: false).count;

    return Row(children: [
      IconButton(
          color: Colors.black,
          onPressed: (isSaving || quantity < 1)
              ? () => null
              : () => decrementQuantity(quantity - 1),
          icon: Image.asset('assets/images/minus.png')),
      Text(count.toString()),
      IconButton(
        onPressed: (isSaving || quantity >= widget.allowedQuantity)
            ? null
            : () => addQuantity(quantity + 1),
        icon: Image.asset('assets/images/add.png'),
        //Icon(Icons.add)
      ),
    ]);
  }
}
