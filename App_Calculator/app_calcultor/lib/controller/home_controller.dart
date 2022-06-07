import 'dart:core';

import 'package:app_calcultor/model/home.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  static final HomeController instance = HomeController._();

  HomeController._();

  void sum(int summator) {
    int newResult = getCurrentResult() + summator;
    Home.instance.setResult(newResult);
  }

  void subtract(int subtractor) {
    int newResult = getCurrentResult() - subtractor;
    Home.instance.setResult(newResult);
  }

  void multiply(int multiplier) {
    int newResult = getCurrentResult() * multiplier;
    Home.instance.setResult(newResult);
  }

  void resetResult() {
    Home.instance.setResult(0);
  }

  String checkEvenNumber() {
    String message = "Este número";

    if (getCurrentResult() % 2 == 0) {
      message += " é par";
    } else {
      message += " é impar";
    }

    if (getCurrentResult() < 0) {
      return message + " e negativo.";
    }

    return message;
  }

  int getCurrentResult() {
    return Home.instance.getResult();
  }
}
