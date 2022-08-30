import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:venus/models/attendee.dart';

class AttendeeListCounter with ChangeNotifier, DiagnosticableTreeMixin {
  List<Attendee> _attendees = [];

  List<Attendee> get attendees => _attendees;

  void decrement() {
    attendees.removeLast();
    notifyListeners();
  }

  void increment(Attendee attendee) {
    attendees.add(attendee);
    notifyListeners();
  }

  void updateContact(Attendee attendee,String val) {

    for (int i = 0; i < attendees.length; i++) {
      if(attendees.contains(attendee))
        {
          attendee.contact = val;

        }
    }
    notifyListeners();
  }

  void updateName(Attendee attendee,String val) {

    for (int i = 0; i < attendees.length; i++) {
      if(attendees.contains(attendee))
      {
        attendee.name = val;

      }
    }
    notifyListeners();
  }

  void updateEmail(Attendee attendee,String val) {

    for (int i = 0; i < attendees.length; i++) {
      if(attendees.contains(attendee))
      {
        attendee.email = val;

      }
    }
    notifyListeners();
  }

  void removeAll() {
    attendees.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(ListProperty('attendees', attendees));
  }
}
