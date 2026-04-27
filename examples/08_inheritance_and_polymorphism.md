# Example 8: Inheritance and Polymorphism

## سوال
یک کلاس پایه `Employee` بساز که متد `calculateSalary()` داشته باشد.
دو کلاس فرزند:

- `FullTimeEmployee`
- `PartTimeEmployee`

هر کدام فرمول حقوق متفاوت داشته باشند.
با یک `List<Employee>` روی همه کارمندها حلقه بزن و حقوقشان را چاپ کن.

## راهنمای مرحله‌ای
1. کلاس پایه را با فیلد `name` تعریف کن.
2. متد `calculateSalary()` را در پایه تعریف کن.
3. در کلاس های فرزند متد را `override` کن.
4. چند شیء از هر نوع بساز و داخل `List<Employee>` بریز.
5. با polymorphism خروجی بگیر.

## جواب کامل (Dart)
```dart
class Employee {
  String name;

  Employee(this.name);

  double calculateSalary() {
    return 0;
  }
}

class FullTimeEmployee extends Employee {
  double monthlyBase;
  double bonus;

  FullTimeEmployee(String name, this.monthlyBase, this.bonus) : super(name);

  @override
  double calculateSalary() {
    return monthlyBase + bonus;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked) : super(name);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}

void main() {
  final employees = <Employee>[
    FullTimeEmployee('Sara', 25000000, 4000000),
    PartTimeEmployee('Reza', 200000, 80),
  ];

  for (final e in employees) {
    print('${e.name} salary: ${e.calculateSalary().toStringAsFixed(0)}');
  }
}
```
