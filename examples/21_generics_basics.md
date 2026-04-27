# Example 21: Generics Basics

## سوال
یک کلاس generic به نام `Box<T>` بساز که:

- یک مقدار از نوع `T` نگه دارد
- متد `setValue(T value)` برای تغییر مقدار داشته باشد
- متد `getValue()` برای خواندن مقدار داشته باشد

در `main` یک `Box<int>` و یک `Box<String>` تست کن.

## راهنمای مرحله‌ای
1. کلاس را با `class Box<T>` تعریف کن.
2. فیلد private از نوع `T` بساز.
3. متدهای set/get را پیاده سازی کن.
4. در `main` از انواع مختلف برای `T` استفاده کن.
5. خروجی را چاپ کن تا type-safe بودن مشخص شود.

## جواب کامل (Dart)
```dart
class Box<T> {
  T _value;

  Box(this._value);

  void setValue(T value) {
    _value = value;
  }

  T getValue() {
    return _value;
  }
}

void main() {
  final intBox = Box<int>(10);
  intBox.setValue(25);
  print('intBox: ${intBox.getValue()}');

  final stringBox = Box<String>('hello');
  stringBox.setValue('dart');
  print('stringBox: ${stringBox.getValue()}');
}
```
