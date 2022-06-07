class Currency {
  late String _name;
  late double _buyValue;
  late double _sellValue;
  late double _variation;

  void setName(name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setBuyValue(buyValue) {
    _buyValue = buyValue;
  }

  double getBuyValue() {
    return _buyValue;
  }

  void setSellValue(sellValue) {
    _sellValue = sellValue;
  }

  double getSellValue() {
    return _sellValue;
  }

  void setVariation(variation) {
    _variation = variation;
  }

  double getVariation() {
    return _variation;
  }
}
