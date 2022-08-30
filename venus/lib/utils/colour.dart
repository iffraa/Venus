import 'dart:ui';

class Colour{
  static const yellowColor =  Color(0xfff9e045);
  static const blackColor =  Color(0xff000000);
  static const tealColor =  Color(0xff28b8b9);

}


class HexColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}