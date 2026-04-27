# Example 12: Polymorphism (Only)

## مفهوم
چندریختی یعنی با یک نوع مشترک (مثلا کلاس پایه)، به چند پیاده سازی مختلف رفتار بدهیم.

## سوال
کلاس پایه `Shape` با متد `area()` بساز.  
کلاس های `Rectangle` و `Circle` آن را پیاده سازی کنند.  
با یک `List<Shape>` مساحت همه را چاپ کن.

## راهنمای مرحله‌ای
1. کلاس `Shape` را تعریف کن.
2. دو کلاس فرزند با `@override area()` بساز.
3. لیستی از نوع پایه بساز و اشیای مختلف داخلش قرار بده.
4. با حلقه خروجی هر شکل را چاپ کن.

## جواب کامل (Dart)
```dart
class Shape {
  double area() => 0;
}

class Rectangle extends Shape {
  double width;
  double height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14159 * radius * radius;
}

void main() {
  final shapes = <Shape>[
    Rectangle(10, 4),
    Circle(3),
  ];

  for (final shape in shapes) {
    print('Area: ${shape.area().toStringAsFixed(2)}');
  }
}
```
