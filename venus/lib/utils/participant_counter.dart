import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AttendeeCounter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void decrement() {
    _count --;
    notifyListeners();
  }

  void increment() {
    _count ++;
    notifyListeners();
  }

  void removeAll() {
    _count = 0;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}