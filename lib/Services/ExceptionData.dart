class MyException implements Exception {
  final String message;

  MyException(this.message);

  String toString() {
    return message;
  }
}
