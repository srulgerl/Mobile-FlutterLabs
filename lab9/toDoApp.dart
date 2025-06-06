import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print("Хийх ажлын жагсаалт");
    print("1. Шинэ ажил нэмэх");
    print("2. Ажил устгах");
    print("3. Ажлуудыг харах");
    print("4. Гарах");
    stdout.write("Сонголтоо оруулна уу: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("хийх ажилаа оруулна уу: ");
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print("Ажил нэмэгдлээ");
        }
        break;

      case '2':
        stdout.write("Устгах ажилын дугаар (0-${tasks.length - 1}): ");
        int index = int.parse(stdin.readLineSync()!);
        if (index >= 0 && index < tasks.length) {
          print("Устгасан: ${tasks[index]}");
          tasks.removeAt(index);
        } else {
          print("Буруу дугаар!");
        }
        break;

      case '3':
        print("Ажлын цагсаалт");
        if (tasks.isEmpty) {
          print("Ажил алга байна.");
        } else {
          for (int i = 0; i < tasks.length; i++) {
            print("$i: ${tasks[i]}");
          }
        }
        break;

      case '4':
        return;

      default:
        print("Буруу сонголт. Дахин оролдоно уу.");
    }
  }
}
