import 'package:flutter/cupertino.dart';

import '../utils/AppScale.dart';
import '../utils/colour.dart';

class TextNormal extends StatelessWidget{

  final String text;

  const TextNormal(this.text);

  @override
  Widget build(BuildContext context) {
    AppScale _scale = AppScale(context);

    return Text(text,
      style:  TextStyle(
        color: Colour.blackColor,
        fontSize: _scale.navButton,),);
  }

}