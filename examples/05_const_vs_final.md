# Example 5: const vs final

## سوال
در یک مثال واقعی فرق `const` و `final` را نشان بده:

- یک مقدار ثابت زمان کامپایل (`pi`) با `const`
- یک مقدار که فقط یک بار در زمان اجرا مقداردهی می شود (`startTime`) با `final`
- یک لیست `final` که خود لیست قابل تغییر باشد

## راهنمای مرحله‌ای
1. `const double pi = 3.14159;` تعریف کن.
2. `final DateTime startTime = DateTime.now();` تعریف کن.
3. یک `final List<String>` تعریف کن و چند عضو `add` کن.
4. در کامنت توضیح بده چرا `final` اجازه تغییر reference نمی دهد ولی تغییر محتوای لیست ممکن است.

## جواب کامل (Dart)
```dart
void main() {
  const double pi = 3.14159;
  final DateTime startTime = DateTime.now();

  final List<String> tasks = ['setup project'];
  tasks.add('write exercises');
  tasks.add('run tests');

  print('const pi: $pi');
  print('final startTime: $startTime');
  print('final tasks list: $tasks');

  // final => reference ثابت است و نمي توان آن را به object جديد نسبت داد.
  // اما اگر object mutable باشد (مثل List)، محتواي آن قابل تغيير است.
  // tasks = []; // Not allowed
}
```
