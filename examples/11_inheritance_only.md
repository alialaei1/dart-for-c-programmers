# Example 11: Inheritance (Only)

## مفهوم
وراثت یعنی یک کلاس جدید (`child`) ویژگی ها و رفتارهای کلاس دیگر (`parent`) را به ارث ببرد.

## سوال
کلاس `Animal` با متد `move()` بساز.  
دو کلاس `Bird` و `Fish` از آن ارث ببرند و متد حرکت را برای خودشان پیاده سازی کنند.

## راهنمای مرحله‌ای
1. کلاس پایه `Animal` را با فیلد `name` تعریف کن.
2. کلاس `Bird` و `Fish` را با `extends Animal` بساز.
3. در هر کلاس فرزند متد مناسب حرکت را تعریف کن.
4. در `main` نمونه بساز و خروجی بگیر.

## جواب کامل (Dart)
```dart
class Animal {
  String name;
  Animal(this.name);

  void move() {
    print('$name is moving.');
  }
}

class Bird extends Animal {
  Bird(String name) : super(name);

  @override
  void move() {
    print('$name is flying.');
  }
}

class Fish extends Animal {
  Fish(String name) : super(name);

  @override
  void move() {
    print('$name is swimming.');
  }
}

void main() {
  final bird = Bird('Eagle');
  final fish = Fish('Salmon');

  bird.move();
  fish.move();
}
```
