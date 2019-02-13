import 'package:examen_final_flutter/Model/Question.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {

  final Question question;
  List<String> datos = [];

  SettingsScreen(this.question);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pregunta"),),
      body: Stack(
        children: <Widget>[
          new Container(
              child: new Text(widget.question.difficulty),
          ),
          new ListView.builder(
              itemCount: widget.question.incorrect_answers.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Text(widget.question.incorrect_answers[index]);
              }
          )
        ],
      )
    );
  }
}