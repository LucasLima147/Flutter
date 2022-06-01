import 'package:contador/model/home.dart';

class HomeController {
  static final HomeController instance = HomeController._();

  HomeController._();

  void incrementCount() {
    Home.instance.setCount(Home.instance.getCount() + 1);
    print(Home.instance.getCount());
  }

  void decrementCount() {
    Home.instance.setCount(Home.instance.getCount() - 1);
    print(Home.instance.getCount());
  }

  void resetCount() {
    Home.instance.setCount(0);
    print(Home.instance.getCount());
  }
}
