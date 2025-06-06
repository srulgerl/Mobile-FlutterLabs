int function(int? n) {
  return n ?? 0;
}

void main() {
  print(function(2));
}
