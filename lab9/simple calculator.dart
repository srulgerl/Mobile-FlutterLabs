import 'dart:io';

void main() {
  stdout.write("Эхний тоог оруулна уу: ");
  int x1 = int.parse(stdin.readLineSync()!);

  stdout.write("Хоёр дахь тоог оруулна уу: ");
  int x2 = int.parse(stdin.readLineSync()!);

  print("$x1 + $x2 = ${x2 + x1}");
  print("$x1 - $x2 = ${x1 - x2}");
  print("$x1 * $x2 = ${x2 * x1}");
  if (x2 != 0) {
    double division = x1 / x2;
    print("$x1 / $x2 = ${division.toStringAsFixed(2)}");
  } else {
    print("Хуваах боломжгүй: Хоёр дахь тоо 0 байна.");
  }
}
