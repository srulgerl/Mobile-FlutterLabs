import 'dart:io';
import 'dart:async';

void main() async {
  print("Тоонуудоо таслалаар бич: ");
  String? input = stdin.readLineSync();

  List<int> numbers =
      input!.split(',').map((e) => int.parse(e.trim())).toList();

  List<int> doubled = await Future.delayed(
    Duration(seconds: 1),
    () => numbers.map((n) => n * 2).toList(),
  );

  print("Үр дүн: $doubled");
}
