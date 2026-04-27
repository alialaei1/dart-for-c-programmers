void main() {
  String name = "Ali";
  int age = 23;
  double score1 = 18.5;
  double score2 = 16.0;
  double score3 = 17.5;
  String status = "";

  double average = (score1 + score2 + score3) / 3;

  if (average > 17) {
    status = "Excellent";
  } else if (average >= 14) {
    status = "Good";
  } else {
    status = "Needs Work";
  }

  print("Name: $name");
  print("Age: $age");
  print("Average: ${average.toStringAsFixed(2)}");
  print("Status: $status");
}
