void main() {
  double distance = 25;
  double speed = 40;

  double timeInHours = distance / speed;
  double timeInMinutes = timeInHours * 60;

  print("Оффис руу явах хугацаа: ${timeInMinutes.toStringAsFixed(2)} минут");
}
