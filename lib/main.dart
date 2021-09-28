import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/navbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Enter Body mass in Kg",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.0))),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: con1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Enter Height in centimeters",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.0))),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: con2,
              ),
            ),
            FloatingActionButton.small(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Text(calc(con1.text, con2.text).toString()+"  "+comp()));
                    });
              },
              tooltip: 'Done',
              child: const Icon(Icons.done),
            ),
          ],
        ));
  }

  double calc(String mass, String height) {
    double mass = double.parse(con1.text);
    double height = double.parse(con2.text) / 100;
    double res = (mass) / (height * height);
    return (res);
  }

  String comp() {
    double t = calc(con1.text, con2.text);
    if (t <= 18.5) {
      return "UNDER-WEIGHT";
    } else if (t > 18.5 && t <= 25) {
      return "NORMAL";
    } else if (t > 25 && t <= 30) {
      return "OVERWEIGHT";
    } else {
      return "OBESE";
    }
  }
}
