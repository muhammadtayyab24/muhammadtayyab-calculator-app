import 'dart:math';

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "";

  Widget button(var texxt) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF6e0000),
          onPrimary: Colors.white,
        ),
        onPressed: () {
          setState(() {
            result = result + texxt;
          });
        },
        child: Text(texxt));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Calculator App",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: (Color(0xFF6e0000)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("7"),
              button("8"),
              button("9"),
              button("*"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("4"),
              button("5"),
              button("6"),
              button("/"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("1"),
              button("2"),
              button("3"),
              button("-"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button("0"),
              button("+"),
              ElevatedButton(
                onPressed: clearr,
                child: Text("AC"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFb33d3d),
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: output,
                child: Text("="),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFb33d3d),
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
