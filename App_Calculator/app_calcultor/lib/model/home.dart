class Home {
  static final Home instance = Home._(0);
  int _result;

  Home._(this._result);

  int getResult() {
    return _result;
  }

  void setResult(int newResult) {
    _result = newResult;
  }
}
