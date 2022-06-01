import 'dart:html';

import 'package:app_calcultor/components/dialog.dart';
import 'package:app_calcultor/controller/home_controller.dart';
import 'package:app_calcultor/model/home.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 180;
  bool isWarned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("App Numérico"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Número",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          HomeController.instance.getCurrentResult().toString(),
          style: TextStyle(
              fontSize: 70,
              color: HomeController.instance.getCurrentResult() < 0
                  ? Colors.red
                  : Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          HomeController.instance.checkEvenNumber(),
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    HomeController.instance.sum(5);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreen[900],
                ),
                child: const Text(
                  "+ 5",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            const SizedBox(
              width: 5,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    HomeController.instance.subtract(5);
                  });
                  if (HomeController.instance.getCurrentResult() < 0) {
                    if (!isWarned) {
                      isWarned = true;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog(
                              "resultado negativo",
                              "O resultado atualmente está negativo",
                              context));
                    }
                  } else {
                    isWarned = false;
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "- 5",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            const SizedBox(
              width: 5,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    HomeController.instance.multiply(2);
                  });
                  if (HomeController.instance.getCurrentResult() < 0) {
                    if (!isWarned) {
                      isWarned = true;
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog(
                              "resultado negativo",
                              "O resultado atualmente está negativo",
                              context));
                    }
                  } else {
                    isWarned = false;
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent[100],
                ),
                child: const Text(
                  "x 2",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        HomeController.instance.getCurrentResult() != 0
            ? TextButton(
                onPressed: () {
                  setState(() {
                    HomeController.instance.resetResult();
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor:
                        HomeController.instance.getCurrentResult() != 0
                            ? Colors.yellow[800]
                            : Colors.black,
                    fixedSize: Size.fromWidth(width)),
                child: const Text(
                  "Zerar Número",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
            : const SizedBox(
                height: 10,
              ),
      ]),
    );
  }
}
