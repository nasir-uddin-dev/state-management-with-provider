import 'package:flutter/foundation.dart';

//Encapsulation. Here, variable and method
class CounterNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}

