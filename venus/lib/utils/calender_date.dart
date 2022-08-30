import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CalenderDate with ChangeNotifier, DiagnosticableTreeMixin {
  DateTime? _selectedDay= DateTime.now();

  DateTime? get selectedDay => _selectedDay;

  void updateDate(DateTime dateTime) {
    _selectedDay = dateTime;
    notifyListeners();
  }

  /// Makes `selectedDay` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('selectedDay', selectedDay.toString()));

  }
}