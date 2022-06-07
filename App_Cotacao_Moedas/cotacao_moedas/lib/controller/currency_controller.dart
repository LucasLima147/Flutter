import 'package:cotacao_moedas/model/currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class CurrencyController {
  static const request = 'https://api.hgbrasil.com/finance?key=9741623a';

  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(request));
    return json.decode(response.body);
  }

  List<Currency> getCurrencyList(Map currencyMap) {
    
    List<Currency> currencyList = [];

    currencyMap.forEach((key, value) {
      if (key != "source") {
        
        Currency currency = Currency();

        currency.setName(currencyMap[key]["name"] ?? "");
        currency.setBuyValue(currencyMap[key]["buy"] ?? 0.0);
        currency.setSellValue(currencyMap[key]["sell"] ?? 0.0);
        currency.setVariation(currencyMap[key]["variation"] ?? 0.0);

        currencyList.add(currency);
      }
    });

    return currencyList;
  }

}