double safeDivide(int num1, int num2) {
  if (num2 == 0) {
    throw Exception("Division by zero is not allowed.");
  }
  return num1 / num2;
}

void main() {
  int num1 = 1;
  int num2 = 0;
  print("app in run ${DateTime.now()}");
  try {
    print(safeDivide(num1, num2));
  } catch (e) {
    print("error $e");
  }
}
