import 'package:examen_final_flutter/Model/Question.dart';

abstract class HomeView {
  openSettingsScreen(Question question);

  showQuestions(List<Question> questions);

  showLoading();

  hideLoading();

  showError();
}