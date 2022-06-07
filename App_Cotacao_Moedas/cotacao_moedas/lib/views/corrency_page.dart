import 'package:cotacao_moedas/components/app_bar.dart';
import 'package:cotacao_moedas/controller/currency_controller.dart';
import 'package:cotacao_moedas/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  CurrencyController currencyController = CurrencyController();

  List<Currency> currencies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Currency"),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Moedas disponíveis',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              fontFamily: 'Helvetica',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<Map>(
              future: currencyController.getData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: Text(
                        "Carregando Dados...",
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Erro ao carregar Dados",
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    } else if (!snapshot.hasData ||
                        snapshot.data?["error"] == true) {
                      return const Center(
                        child: Text(
                          "Nenhum dado encontrado!",
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    } else {
                      currencies = currencyController.getCurrencyList(
                          snapshot.data?["results"]["currencies"]);

                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: currencies.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            color: index % 2 == 0
                                ? Colors.black12
                                : Colors.lightBlueAccent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Moeda: ' + currencies[index].getName()),
                                Text('Valor de compra: ' +
                                    currencies[index].getBuyValue().toString()),
                                Text('Valor de venda: ' +
                                    currencies[index]
                                        .getSellValue()
                                        .toString()),
                                Text('Variação: ' +
                                    currencies[index]
                                        .getVariation()
                                        .toString()),
                              ],
                            ),
                          );
                        },
                      );
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
