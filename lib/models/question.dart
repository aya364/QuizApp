import 'package:task_app/utils/styles/app_style.dart';

class QuestionModel {
  final String question;
  final List<Answers> answers;

  QuestionModel({required this.question, required this.answers});
}

class Answers {
  final String answer;
  final bool isCorrect;

  Answers({required this.answer, required this.isCorrect});
}

List<QuestionModel> questions = [
  QuestionModel(
      question:
          "What is the correct way to create a stateful widget in Flutter?",
      answers: [
        
        Answers(
            answer: "StatefulWidget with State",
            isCorrect: false),
        Answers(
            answer:
                "StatefulWidget +  _MyWidgetState extends State<MyWidget>",
            isCorrect: true),
        Answers(
            answer: " State<StatefulWidget>",
            isCorrect: false),
        Answers(
            answer: "StatelessWidget", isCorrect: false),
      ]),
  QuestionModel(
      question:
          "How do you access the current context inside a Flutter widget?",
      answers: [
        Answers(answer: "this.context", isCorrect: false),
        Answers(answer: "BuildContext()", isCorrect: false),
        Answers(
            answer: "context (automatically available in build())",
            isCorrect: true),
        Answers(answer: "Widget.getContext()", isCorrect: false),
      ]),
  QuestionModel(
      question:
          "Which Dart keyword is used to declare a variable that cannot change after assignment?",
      answers: [
        Answers(answer: "static", isCorrect: false),
        Answers(answer: "var", isCorrect: false),
        Answers(answer: "const", isCorrect: false),
        Answers(answer: "final", isCorrect: true),
      ]),
  QuestionModel(question: " What does the async keyword do in Dart?", answers: [
    Answers(
        answer: "Pauses code execution until a Future completes",
        isCorrect: false),
    Answers(
        answer: "Marks function to run in a separate thread",
        isCorrect: false),
    Answers(
        answer: "Allows function to use await for Futures",
        isCorrect: true),
    Answers(
        answer: "Converts synchronous code to asynchronous",
        isCorrect: false),
  ]),
];
