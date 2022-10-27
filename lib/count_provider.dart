import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;
  int _selected = 0;
  int get count => _count;
  int get selectedItem => _selected;
  void setCount() {
    _count++;
    notifyListeners();
  }

  void setCounterValue() {
    _count = 0;
    notifyListeners();
  }
  void setIndexrValue(setValue) {
    _selected = setValue;
    notifyListeners();
  }
}
