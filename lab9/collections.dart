void main() {
  Map<String, String> contact = {
    "name": "Saruul",
    'phone': '99119911',
    'city': 'Ulaanbaatar',
  };

  var result = contact.keys.where((key) => key.length == 4);
  print("4 үсэгтэй түлхүүрүүд: ${result.toList()}");
}
