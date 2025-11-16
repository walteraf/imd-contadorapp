import 'package:flutter/material.dart';

class CounterAppState extends ChangeNotifier {
  int counter = 0;
  List<int> history = [];

  void increment() {
    counter++;
    history.insert(0, counter);
    notifyListeners();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      history.insert(0, counter);
      notifyListeners();
    }
  }

  void addTwo() {
    counter += 2;
    history.insert(0, counter);
    notifyListeners();
  }

  void subtractTwo() {
    if (counter > 0) {
      counter -= 2;
      if (counter < 0) {
        counter = 0; //Para não ficar com o cotnador negativo
      }
      history.insert(0, counter);
      notifyListeners();
    }
  }

  void reset() {
    counter = 0;
    history.insert(0, counter);
    notifyListeners();
  }

  void clearHistory() {
    history.clear();
    notifyListeners();
  }
}
