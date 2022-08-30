import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:venus/utils/strings.dart';
import '../widgets/alert_button.dart';
import 'colour.dart';

class Utility {
  static bool isLoggedIn = false;

  static showProgressDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: Colour.yellowColor,
          ),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showSubmitAlert(BuildContext context, String msg,String title, onClick) {
    // set up the button
    Widget okButton = AlertButton(Strings.ok,onClick);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //  title: const Text(Strings.thankTxt),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           /* Image.asset(
              'assets/images/green_tick.png',
              width: 75,
              height: 75,
            ),
            SizedBox(
              height: 10,
            ),*/
             Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3.h,
            ),
             Text(
              msg,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showWarningAlert(BuildContext context, String msg) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text(
        "OK",
        style: TextStyle(fontSize: 20, color: Colour.blackColor),
      ),
      onPressed: () {

          Navigator.of(context).pop(); // dismiss dialog

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(Strings.appNameTxt),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /*static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }*/

  static bool isWideWidth(double width) {
    if (width < 480)
      return false;
    else
      return true;
  }

  static String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return null;//Strings.validEmailTxt;
    else
      return null;
  }

  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty)
      return Strings.emptyFieldsTxt;
    else
      return null;
  }

  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty || value.length > 12 || value.length < 8)
      return Strings.validMobileTxt;
    else
      return null;
  }


  static clearData()
  {

  }
}
