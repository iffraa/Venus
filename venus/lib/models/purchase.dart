import '../utils/user_table.dart';
import 'attendee.dart';
import 'event.dart';

class Ticket {
  int memberEventId;
  int id;
  String? noOfAttendee;
  VenusEvent? memberEvent;
  List<Attendee> attendees;

  Ticket(
      {required this.noOfAttendee,
      required this.memberEventId,
      required this.id,
      required this.memberEvent,
      required this.attendees});

  /*Map toJson() => {
        UserTableKeys.noOfAttendee: this.noOfAttendee,
        UserTableKeys.memberEventId: this.memberEventId,
        UserTableKeys.id: this.id,
    mealPckg: json[UserTableKeys.mealPckgs].cast<MealPackage>(),
        UserTableKeys.attendees: this.attendees,
      };*/
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        id: json[UserTableKeys.id],
        noOfAttendee: json[UserTableKeys.noOfAttendee],
        memberEventId: json[UserTableKeys.memberEventId],
        attendees: List<Attendee>.from(
            json[UserTableKeys.attendees].map((x) => Attendee.fromMap(x))),
        memberEvent: json[UserTableKeys.memberEvent].cast<VenusEvent>());
  }

  factory Ticket.fromMap(Map<String, dynamic> json) => Ticket(
        id: (json[UserTableKeys.idNo] != null) ? json[UserTableKeys.idNo] : 0,
        memberEventId: (json[UserTableKeys.memberEventId] != null)
            ? json[UserTableKeys.memberEventId]
            : 0,
        noOfAttendee: (json[UserTableKeys.noOfAttendee] != null)
            ? json[UserTableKeys.noOfAttendee]
            : '',
    memberEvent: json[UserTableKeys.memberEvent] == null ? null : VenusEvent.fromMap(json[UserTableKeys.memberEvent]),
        attendees: List<Attendee>.from(
            json[UserTableKeys.attendees].map((x) => Attendee.fromMap(x))),
      );
}

//VenusEvent.fromMap(json[UserTableKeys.memberEvent])