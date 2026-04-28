mixin Logger {
  logMessage(String message) {
    print("[LOG] $message");
  }
}

class Test with Logger {
  void printMassage(String massage) {
    logMessage(massage);
  }
}

void main() {
  print("app in run! ${DateTime.now()}");
  final test = Test();
  test.printMassage("Hello World");
}
