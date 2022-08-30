import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/screens/schedule_screen.dart';
import '../models/user.dart';
import '../services/network_api.dart';
import '../services/service_url.dart';
import '../utils/AppScale.dart';
import '../utils/colour.dart';
import '../utils/strings.dart';
import '../utils/user_table.dart';
import '../utils/utility.dart';
import '../widgets/form_button.dart';
import '../widgets/input_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String password = "", email = "", mobile = "";
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/images/app_icon.png',
                  width: 40.h,
                  height: 30.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                       InputFormField(
                          Strings.enterEmailTxt, TextInputType.emailAddress,
                          onSaved: (value) => email = value!),
                      InputFormField(Strings.pwdTxt, TextInputType.visiblePassword,
                          onSaved: (value) => password = value!),
                      FormButton(Strings.loginBtn, onLoginAction)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onLoginAction() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login();
    } else
      print(password);
  }

  void login() {

    email = "warsi";
    password= "12345678";

    Map<String, dynamic> loginData = {
      UserTableKeys.userName: email,
      "password": password,
      "user_type":"customer"

    };

    EasyLoading.show();
    NetworkAPI().httpPostRequest(ServiceUrl.loginUrl, null, loginData,
        (status, response) {
      if (response != null) {
        print(response);
        String msg = response!['message'];
        if (status) {
          Map<String, dynamic> data = response!['data']!;
          saveData(data);

          Utility.isLoggedIn = true;
          Navigator.pop(context);
          Navigator.of(context).pushNamed(ScheduleScreen.routeName);
        } else {
          Utility.showSubmitAlert(context, msg, "Venus", onFailureAlert);
        }
      } else {
        Utility.showSubmitAlert(
            context, "Please try again later", "", onFailureAlert);
      }
      EasyLoading.dismiss();
    });
  }

  void saveData(Map<String, dynamic> data) {
    User user = User.fromMap(data['user']);
    GetStorage().write(UserTableKeys.token, data['token'] as String);
    GetStorage().write(Strings.userData, user);
  }

  void onSuccessAlert() {
    Navigator.of(context).pop(); // dismiss dialog
    Navigator.pop(context);
    Navigator.of(context).pushNamed(ScheduleScreen.routeName);
  }

  void onFailureAlert() {
    Navigator.of(context).pop(); // dismiss dialog
  }
}
