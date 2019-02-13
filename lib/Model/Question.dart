class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correct_answer;
  final List<String>  incorrect_answers;

  Question(this.category,this.type,this.difficulty,this.question,this.correct_answer,this.incorrect_answers);
}