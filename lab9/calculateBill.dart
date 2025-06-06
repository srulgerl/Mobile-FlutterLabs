import 'dart:io';

void main() {
  print("Нийт төлбөрийг оруулна уу:");
  double totalAmount = double.parse(stdin.readLineSync()!);

  print("Нийт хүний тоог оруулна уу:");
  int numberOfPeople = int.parse(stdin.readLineSync()!);

  double splitAmount = totalAmount / numberOfPeople;

  print("Хүн бүрийн төлөх дүн: ₮${splitAmount.toStringAsFixed(2)}₮");
}
