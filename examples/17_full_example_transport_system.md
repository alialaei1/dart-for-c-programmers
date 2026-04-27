# Example 17: Full Example - Transport System

## سوال
یک سیستم حمل و نقل بساز که:

- کلاس پایه `Vehicle` داشته باشد (وراثت)
- متد انتزاعی `move()` داشته باشد (انتزاع)
- `Car` و `Bike` پیاده سازی متفاوت بدهند (چندریختی)
- مصرف سوخت private مدیریت شود (کپسولیشن)
- عملیات حرکت را لاگ کند (mixin)

## راهنمای مرحله‌ای
1. `mixin` برای لاگ تعریف کن.
2. کلاس `abstract Vehicle` با `_fuel` و متدهای کنترل سوخت بساز.
3. کلاس های `Car` و `Bike` را با `extends Vehicle` ایجاد کن.
4. در هر کلاس متد `move()` را override کن.
5. با لیست `Vehicle` هر دو وسیله را اجرا کن.

## جواب کامل (Dart)
```dart
mixin Logger {
  void log(String message) => print('[LOG] $message');
}

abstract class Vehicle with Logger {
  double _fuel;
  Vehicle(this._fuel);

  double get fuel => _fuel;

  bool consumeFuel(double amount) {
    if (amount <= 0 || amount > _fuel) return false;
    _fuel -= amount;
    return true;
  }

  void move();
}

class Car extends Vehicle {
  Car(double fuel) : super(fuel);

  @override
  void move() {
    if (consumeFuel(5)) {
      log('Car moved. Remaining fuel: $fuel');
    } else {
      log('Car cannot move. Not enough fuel.');
    }
  }
}

class Bike extends Vehicle {
  Bike(double fuel) : super(fuel);

  @override
  void move() {
    if (consumeFuel(2)) {
      log('Bike moved. Remaining fuel: $fuel');
    } else {
      log('Bike cannot move. Not enough fuel.');
    }
  }
}

void main() {
  final vehicles = <Vehicle>[
    Car(10),
    Bike(3),
  ];

  for (final v in vehicles) {
    v.move();
  }
}
```
