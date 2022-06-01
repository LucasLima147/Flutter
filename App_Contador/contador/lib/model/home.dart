class Home {
  //Pra garantir que so foi instanciando uma unica vez
  static final Home instance = Home._(0);

  int _count;

  Home._(this._count);

  int getCount() {
    return _count;
  }

  void setCount(int count) {
    _count = count;
  }
}
