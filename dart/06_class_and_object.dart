class Student {
  String name;
  int age;
  List<double> scores;

  Student(this.name, this.age, this.scores) {}

  double averageScore() {
    double all = 0;
    for (final i in scores) {
      all += i;
    }
    double average = scores.isEmpty ? 0 : all / scores.length;

    return average;
  }
}

void main() {
  print("run app! at ${DateTime.now()}");

  final student1 = Student("name", 21, [1, 2, 3]);

  print(student1.averageScore());
}
