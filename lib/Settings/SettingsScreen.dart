import 'package:examen_final_flutter/Model/Question.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {

  final Question question;

  SettingsScreen(this.question);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
 bool correct = false;
final List<String>  all = [];

check(String notsure, String answer){

  if(notsure.contains(answer)){
    correct = true;
    print("correcto");
  }
  else{
    correct = false;
    print("incorrecto");
  }

}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pregunta"),),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Container(
                child: new Text(widget.question.difficulty, style: new TextStyle(
                  fontSize: 20
                ),),
            ),
          ),
          new ListView.builder(
              itemCount: widget.question.incorrect_answers.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  onTap: check(widget.question.incorrect_answers[index],widget.question.correct_answer),
                  child: Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.black)
                      ),
                      alignment: Alignment(0.0, 0.0),
                    margin: const EdgeInsets.only(top: 130),
                      child: new Text(
                          widget.question.incorrect_answers[index].toString(),style: new TextStyle(
                        fontSize: 15
                      ),)),
                );
              }
          )
        ],
      )
    );
  }
}