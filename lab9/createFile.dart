import 'dart:io';

void main() {
  File file = File('students.csv');

  file.writeAsStringSync('Dorjoo,20,Ulaanbaatar\n', mode: FileMode.append);
  file.writeAsStringSync('Bataa,22,Darkhan\n', mode: FileMode.append);
  file.writeAsStringSync('Saraa,19,Erdenet\n', mode: FileMode.append);

  print('CSV файл амжилттай үүслээ.');

  String content = file.readAsStringSync();
  print(content);
}
