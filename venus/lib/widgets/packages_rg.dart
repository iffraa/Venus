import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/models/event.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';

class PackagesRg extends StatefulWidget {
  final List<EventPackage> ePackages;

  static EventPackage selectedEPackage =
  EventPackage(id: 0, name: "", price: "", noOfUser: "");

   PackagesRg(this.ePackages);

  @override
  State<StatefulWidget> createState() => _PackagesRgState();
}

class _PackagesRgState extends State<PackagesRg> {

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children:
                widget.ePackages.map((data) => RadioListTile<EventPackage>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Colour.tealColor,
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${data.name}", style: TextStyle(color: Colors.black, fontSize: _scale.normalTxt),),
                      Text("${"SAR  " + data.price!}", style: TextStyle(color: Colors.black, fontSize: _scale.normalTxt),),
                    ],
                  ),
                  groupValue: PackagesRg.selectedEPackage,
                  value: data,
                  onChanged: (EventPackage? value) {
                      setState(() {
                        PackagesRg.selectedEPackage = value!;
                      });
                    },
                )).toList(),




          );
        });
  }

}
