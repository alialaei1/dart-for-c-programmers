# Example 20: Extension Method

## سوال
یک `extension` روی `String` بنویس که:

- متد `toTitleCase()` داشته باشد
- اولین حرف هر کلمه را بزرگ کند

در `main` چند رشته را تست کن.

## راهنمای مرحله‌ای
1. با `extension` یک نام مناسب تعریف کن.
2. داخل آن متد `toTitleCase()` را بنویس.
3. رشته را با `split(' ')` به کلمات تبدیل کن.
4. روی هر کلمه، حرف اول را بزرگ کن و دوباره با `join(' ')` بچسبان.
5. در `main` خروجی را چاپ کن.

## جواب کامل (Dart)
```dart
extension StringCasingExtension on String {
  String toTitleCase() {
    if (trim().isEmpty) return this;

    final words = trim().split(RegExp(r'\s+'));
    final mapped = words.map((word) {
      if (word.isEmpty) return word;
      final first = word[0].toUpperCase();
      final rest = word.substring(1).toLowerCase();
      return '$first$rest';
    });
    return mapped.join(' ');
  }
}

void main() {
  final a = 'dart for c programmers';
  final b = 'hello WORLD';

  print(a.toTitleCase());
  print(b.toTitleCase());
}
```
