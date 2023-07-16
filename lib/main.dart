// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, camel_case_types, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:quizz/quizzer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizz my = Quizz();

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: infull(),
        ),
      ),
    );
  }
}

class infull extends StatefulWidget {
  const infull({super.key});

  @override
  State<infull> createState() => _infullState();
}

int count = 0;

class _infullState extends State<infull> {
  void userpickedans(bool reci) {
    bool correct = my.ans();
    setState(
      () {
        if (count == 13) {
          Alert(context: context, title: "OVER", desc: "starting it overagain")
              .show();
          count = 0;
          iconix.removeRange(0, iconix.length);
        }
        if (correct == true) {
          count++;
          iconix.add(
            Icon(
              Icons.check,
              color: Color.fromARGB(255, 5, 255, 26),
            ),
          );
        } else {
          count++;
          iconix.add(
            Icon(
              Icons.close,
              color: Color.fromARGB(255, 251, 0, 0),
            ),
          );
        }

        my.giver();
      },
    );
  }

  List<Icon> iconix = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 350, left: 20, right: 10),
            child: Text(
              my.testque(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          TextButton(
            child: button(Color.fromARGB(255, 17, 255, 0), "TRUE"),
            onPressed: () {
              userpickedans(true);
            },
          ),
          TextButton(
            child: button(Color.fromARGB(255, 247, 26, 2), "FALSE"),
            onPressed: () {
              userpickedans(false);
            },
          ),
          Row(
            children: iconix,
          ),
        ],
      ),
    );
  }
}

Container button(
  Color colo,
  String cus,
) {
  return Container(
    padding: const EdgeInsets.all(25),
    height: 80,
    width: double.infinity,
    color: colo,
    child: Text(
      "$cus",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
