class Employee {
  String _name;
  Employee(this._name);
  String get name => _name;
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
    double salary = monthlyBase + bonus;

    return salary;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;
  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked)
    : super(name);
  @override
  double calculateSalary() {
    double salary = hourlyRate * hoursWorked;

    return salary;
  }
}

void main() {
  print("run app! at ${DateTime.now()}");
  final employees = [
    FullTimeEmployee("John", 100000, 10000),
    PartTimeEmployee("Jane", 50000, 8),
  ];
  for (final employee in employees) {
    print(
      "calculate salary for ${employee.name} is ${employee.calculateSalary()}",
    );
  }
}
