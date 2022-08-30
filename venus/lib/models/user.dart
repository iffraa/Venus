import 'package:flutter/material.dart';

import '../utils/user_table.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String userName;
  final int roleID;
  final String? mobileNo;
  final String role;
  final String? resort;
  final String? userType;
  final String? profileImg;
  final String? qrImg;

  User(
      {required this.resort,
      required this.id,
      required this.name,
      required this.email,
      required this.userName,
      required this.roleID,
      required this.mobileNo,
      required this.role,
      required this.userType,
      required this.profileImg,
      required this.qrImg});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json[UserTableKeys.id],
      userName: json[UserTableKeys.username],
      resort: json[UserTableKeys.contractStartDate],
      name: '',
      email: '',
      role: '',
      roleID: 0,
      mobileNo: json[UserTableKeys.userMobile],
      userType: json[UserTableKeys.userType],
      profileImg: json[UserTableKeys.profileImg],
      qrImg: json[UserTableKeys.qrImg],
    );
  }

  factory User.fromMap(Map<String, dynamic> json) => User(
        userName: (json[UserTableKeys.username] != null)
            ? json[UserTableKeys.username]
            : "",
        id: json[UserTableKeys.id],
        roleID: (json[UserTableKeys.roleID] != null)
            ? json[UserTableKeys.roleID]
            : 0,
        role:
            (json[UserTableKeys.role] != null) ? json[UserTableKeys.role] : "",
        email: (json[UserTableKeys.email] != null)
            ? json[UserTableKeys.email]
            : "",
        name:
            (json[UserTableKeys.name] != null) ? json[UserTableKeys.name] : "",
        mobileNo: (json[UserTableKeys.userMobile] != null)
            ? json[UserTableKeys.userMobile]
            : "",
        resort: json[UserTableKeys.resort],
        userType: (json[UserTableKeys.userType] != null)
            ? json[UserTableKeys.userType]
            : "",
        profileImg: (json[UserTableKeys.profileImg] != null)
            ? json[UserTableKeys.profileImg]
            : "",
        qrImg: (json[UserTableKeys.qrImg] != null)
            ? json[UserTableKeys.qrImg]
            : "",
      );
}
