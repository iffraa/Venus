import '../utils/user_table.dart';

class VenusEvent {
  final int id;
  final String? eventTitle;
  final String? time;
  final String? dateTime;
  final int duration;
  final String? image;
  final String? details;
  final String? status;
  final String? location;
  final List<EventPackage> ePackages;

  VenusEvent(
      {required this.location,
      required this.id,
      required this.dateTime,
      required this.eventTitle,
      required this.time,
      required this.duration,
      required this.image,
      required this.details,
      required this.status,
      required this.ePackages});

  factory VenusEvent.fromMap(Map<String, dynamic> json) => VenusEvent(
        id: json[UserTableKeys.id],
        eventTitle: (json[UserTableKeys.eventTitle] != null)
            ? json[UserTableKeys.eventTitle]
            : "",
        dateTime: (json[UserTableKeys.dateTime] != null)
            ? json[UserTableKeys.dateTime]
            : "",
        time: "",
        duration: (json[UserTableKeys.duration] != null)
            ? json[UserTableKeys.duration]
            : 0,
        image: (json[UserTableKeys.image] != null)
            ? json[UserTableKeys.image]
            : "",
        details: (json[UserTableKeys.details] != null)
            ? json[UserTableKeys.details]
            : "",
        status: (json[UserTableKeys.status] != null)
            ? json[UserTableKeys.status]
            : "",
        location: (json[UserTableKeys.location] != null)
            ? json[UserTableKeys.location]
            : "",
        //ePackages: json[UserTableKeys.packageTypes].cast<EventPackage>(),
    ePackages: List<EventPackage>.from(json[UserTableKeys.packageTypes].map((x) => EventPackage.fromMap(x))),

  );
}

class EventPackage {
  final int id;
  final String? name;
  final String? noOfUser;
  final String? price;

  EventPackage({
    required this.id,
    required this.name,
    required this.price,
    required this.noOfUser,
  });

  factory EventPackage.fromMap(Map<String, dynamic> json) => EventPackage(
        id: json[UserTableKeys.id],
        name:
            (json[UserTableKeys.name] != null) ? json[UserTableKeys.name] : "",
        price: (json[UserTableKeys.price] != null)
            ? json[UserTableKeys.price]
            : "",
        noOfUser: (json[UserTableKeys.noOfUser] != null)
            ? json[UserTableKeys.noOfUser]
            : "",
      );
}
