// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:contador/controller/home_controller.dart';
import 'package:contador/model/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//a logica sempre vem aqui
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Contador'),
        backgroundColor: Color.fromARGB(255, 63, 60, 60),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Valor Atual',
            style: TextStyle(
              fontSize: 50,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      HomeController.instance.decrementCount();
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 63, 60, 60),
                      primary: Colors.grey),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(Home.instance.getCount().toString(),
                  style: TextStyle(
                    fontSize: 70,
                    color: Home.instance.getCount() < 0
                        ? Colors.red
                        : Home.instance.getCount() == 0
                            ? Colors.grey
                            : Colors.green,
                  )),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      HomeController.instance.incrementCount();
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 63, 60, 60),
                      primary: Colors.grey),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (Home.instance.getCount() == 0) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Alerta'),
                      content:
                          const Text('O contador já está zerado seu jegue!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
                HomeController.instance.resetCount();
              });
            },
            child: Text(
              'Zerar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
