import '../utils/user_table.dart';

class Attendee{
   String? name;
   String? id;
   String? email;
   String? contact;


  Attendee(
      {required this.email,
        required this.name,
        required this.id,
        required this.contact
      });

   Map toJson() => {
     UserTableKeys.email: this.email,
     UserTableKeys.name: this.name,
     UserTableKeys.id: this.id,
     UserTableKeys.contactNo: this.contact,

   };

   factory Attendee.fromMap(Map<String, dynamic> json) => Attendee(
       id: (json[UserTableKeys.idNo] != null)
           ? json[UserTableKeys.idNo]
           : '',

       name: (json[UserTableKeys.name] != null)
           ? json[UserTableKeys.name]
           : '',
       email: (json[UserTableKeys.email] != null)
           ? json[UserTableKeys.email]
           : '',
     contact: (json[UserTableKeys.contactNo] != null)
         ? json[UserTableKeys.contactNo]
         : '',
      );

}