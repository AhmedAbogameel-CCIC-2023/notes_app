class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  }) : assert(answers.contains(correctAnswer), 'answers$answers must contains correctAnswer($correctAnswer)');

  static final List<Question> questions = [
    Question(
      question: "Apple color is ...",
      answers: ['Black', "Red", "Purple"],
      correctAnswer: 'Red',
    ),
    Question(
      question: "Cairo is Capital of ...",
      answers: ['Egypt', "Saudi Arabia", "England", "Syria"],
      correctAnswer: 'Egypt',
    ),
    Question(
      question: "Flutter's programming language is ...",
      answers: ['Javascript', "Dart", "Java", "C#", "C++"],
      correctAnswer: 'Dart',
    ),
    Question(
      question: "Dart is an Async Language ?",
      answers: ["Yes", "No"],
      correctAnswer: 'Yes',
    ),
    Question(
      question: "Operating system of iPhone is ...",
      answers: ["iOS", "Android", "Linux", "Windows", "macOS", "iPadOS", "Web"],
      correctAnswer: 'iOS',
    ),
  ];
}