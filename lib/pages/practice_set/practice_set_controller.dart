import 'package:get/get.dart';

class MCQ {
  String questionText;
  QuestionType type = QuestionType.mcq;
  List<String> choices;
  int answer;
  MCQ(
      {required this.questionText,
      required this.choices,
      required this.answer});
}

class ShortQuestion {
  String questionText;
  QuestionType type = QuestionType.shortQuestion;

  String answer;
  ShortQuestion({required this.questionText, required this.answer});
}

class Question {
  String questionText;
  QuestionType type;
  dynamic answer;
  List<String>? options;
  Question(
      {required this.questionText,
      required this.type,
      this.options,
      this.answer});

  // Factory constructor to create a multiple-choice question
  factory Question.mcq(MCQ mcq) {
    if (mcq.answer < 0 || mcq.answer >= mcq.choices.length) {
      throw ArgumentError("Correct index is out of range");
    }
    return Question(
        questionText: mcq.questionText,
        type: QuestionType.mcq,
        options: mcq.choices,
        answer: mcq.answer);
  }

  MCQ asMcq() {
    return MCQ(questionText: questionText, choices: options!, answer: answer);
  }

  ShortQuestion asShortQuestion() {
    return ShortQuestion(questionText: questionText, answer: answer);
  }

  // Factory constructor to create a one-word answer question
  factory Question.shortQuestion(ShortQuestion question) {
    return Question(
        questionText: question.questionText,
        type: QuestionType.shortQuestion,
        answer: question.answer);
  }
}

enum QuestionType { mcq, shortQuestion }

class PracticeSetController extends GetxController {
  List<Question> questionsSet = [
    Question.mcq(MCQ(
        questionText: "What is the capital of Jharkhand?",
        choices: ["Jamshedpur", "Patna", "Ranchi", "Patratu"],
        answer: 2)),
    Question.shortQuestion(
        ShortQuestion(questionText: "What is the 4%2=?", answer: "0")),
    Question.mcq(MCQ(
        questionText: "What is the capital of Bihar?",
        choices: ["Jamshedpur", "Patna", "Ranchi", "Patratu"],
        answer: 1)),
  ];
}
