import 'dart:io';

Future<String> reverseStringAsync(String input) async {
  return await Future.delayed(Duration(seconds: 1), () {
    return input.split('').reversed.join();
  });
}

void main() async {
  stdout.write("Текст оруулна уу: ");
  String? text = stdin.readLineSync();

  print("Урвуулж байна...");
  String reversed = await reverseStringAsync(text!);
  print("Урвуу текст: $reversed");
}
