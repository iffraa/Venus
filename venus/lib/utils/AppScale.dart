import 'package:flutter/cupertino.dart';

class AppScale {
  BuildContext _ctxt;

  AppScale(this._ctxt);

  double get appBarHeading => scaledWidth(0.05);
  double get heading => scaledWidth(0.045);
  double get subHeading => scaledWidth(0.04);
  double get profileTxt => scaledWidth(0.036);
  double get formButton => scaledHeight(0.027);
  double get navButton => scaledHeight(0.02);
  double get smallTxt => scaledHeight(0.018);
  double get smallestTxt => scaledHeight(0.016);
  double get normalTxt => scaledHeight(0.019);

  double scaledWidth(double widthScale) {
    return MediaQuery.of(_ctxt).size.width * widthScale;
  }

  double scaledHeight(double heightScale) {
    return MediaQuery.of(_ctxt).size.height * heightScale;
  }
}
