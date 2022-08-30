import 'package:flutter/material.dart';
import 'package:venus/models/event.dart';

class PackagesDropdown extends StatefulWidget {
  final List<EventPackage> ePackages;

  //final Function onSelectAction;

  const PackagesDropdown(this.ePackages);

  @override
  State<StatefulWidget> createState() => _PackagesDropdownState();
}

class _PackagesDropdownState extends State<PackagesDropdown> {
  EventPackage selectedEPackage =
      EventPackage(id: 0, name: "", price: "", noOfUser: "");

  @override
  Widget build(BuildContext context) {
    return DropdownButton<EventPackage>(
      items: getItems(),
      value: selectedEPackage,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (EventPackage? newValue) {
        setState(() {
          selectedEPackage = newValue!;
        });
      },
      /*widget.ePackages.map((e) => DropdownMenuItem<EventPackage>(
          child: Text(
             e.name!,
            ),
          value: e,
        )).toList(),*/
    );
  }

  List<DropdownMenuItem<EventPackage>>? getItems() {
    return widget.ePackages
        .map(
          (category) => DropdownMenuItem<EventPackage>(
            child: Text(
              category.name!,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            value: category,
          ),
        )
        .toList();
  }
}
