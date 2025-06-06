import 'dart:io';

class Question {
  String question;
  List<String> options;
  int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

void main() {
  List<Question> quiz = [
    Question("1. Dart-г аль компани бүтээсэн бэ?", [
      "Apple",
      "Google",
      "Microsoft",
    ], 2),
    Question("2. Flutter ямар хэл дээр бичигдсэн бэ?", [
      "Dart",
      "Java",
      "C#",
    ], 1),
    Question("3. 5 + 3 = ?", ["6", "7", "8"], 3),
  ];

  int score = 0;

  for (var q in quiz) {
    print(q.question);
    for (int i = 0; i < q.options.length; i++) {
      print("${i + 1}. ${q.options[i]}");
    }

    stdout.write("Таны хариулт (тоог оруулна уу): ");
    int? answer = int.tryParse(stdin.readLineSync()!);

    if (answer == q.correctAnswer) {
      print("Зөв!\n");
      score++;
    } else {
      print("Буруу. Зөв хариулт: ${q.options[q.correctAnswer - 1]}\n");
    }
  }

  print("Та нийт $score/${quiz.length} оноо авлаа!");
}
