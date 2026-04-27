# Example 6: Class and Object

## سوال
یک کلاس `Student` بساز که این فیلدها را داشته باشد:

- `name` از نوع `String`
- `age` از نوع `int`
- `scores` از نوع `List<double>`

یک متد `averageScore()` بنویس که میانگین نمره ها را برگرداند.
در `main` یک شیء از این کلاس بساز و اطلاعات را چاپ کن.

## راهنمای مرحله‌ای
1. با `class Student` شروع کن و فیلدها را تعریف کن.
2. یک سازنده ساده برای مقداردهی اولیه بنویس.
3. متد `averageScore()` را با جمع نمره ها پیاده سازی کن.
4. در `main` شیء بساز، متد را صدا بزن و خروجی بگیر.

## جواب کامل (Dart)
```dart
class Student {
  String name;
  int age;
  List<double> scores;

  Student(this.name, this.age, this.scores);

  double averageScore() {
    double sum = 0;
    for (final s in scores) {
      sum += s;
    }
    return scores.isEmpty ? 0 : sum / scores.length;
  }
}

void main() {
  final student = Student('Ali', 24, [18.5, 17.0, 19.0]);
  print('Name: ${student.name}');
  print('Age: ${student.age}');
  print('Average: ${student.averageScore().toStringAsFixed(2)}');
}
```
