import 'dart:math';

String generateID() {
  int id = Random().nextInt(90000) + 10000;
  return id.toString();
}
