import 'dart:io';

void main() {
  File file = File('hello_copy.txt');

  if (file.existsSync()) {
    file.deleteSync();
    print('Файл амжилттай устлаа: hello_copy.txt');
  } else {
    print('Файл олдсонгүй: hello_copy.txt');
  }
}
