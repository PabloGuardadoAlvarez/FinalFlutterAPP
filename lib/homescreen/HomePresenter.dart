import 'dart:convert';
import 'package:examen_final_flutter/Model/Question.dart';
import 'package:examen_final_flutter/homescreen/HomeView.dart';
import 'package:http/http.dart' as network;

class HomePresenter {
  HomeView _view;

  HomePresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Question> questions = jsonBody['results'].map<Question>((element) {
        String category = element['category'];
        String difficulty = element['difficulty'];
        String question = element['question'];
        String type = element['type'];
        String correct_answer = element['correct_answer'];
        String incorrect_answers = element['incorrect_answers'].toString();
        return Question(category,difficulty,question,type,correct_answer,incorrect_answers);
      }).toList();
      _view.showQuestions(questions);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(Question question) {
    _view.openSettingsScreen(question);
  }
}