# Example 10: Exception Handling

## سوال
تابعی بنویس که تقسیم دو عدد را انجام دهد.
اگر مخرج صفر بود، خطا تولید شود.
در `main` با `try/catch` خطا را مدیریت کن و پیام مناسب نمایش بده.

## راهنمای مرحله‌ای
1. تابع `safeDivide` با دو پارامتر `double` بنویس.
2. اگر `b == 0` بود `throw` کن.
3. در `main` دو حالت تست کن: درست و خطادار.
4. با `try/catch` خروجی خوانا چاپ کن.

## جواب کامل (Dart)
```dart
double safeDivide(double a, double b) {
  if (b == 0) {
    throw Exception('Division by zero is not allowed.');
  }
  return a / b;
}

void main() {
  try {
    final r1 = safeDivide(10, 2);
    print('10 / 2 = $r1');

    final r2 = safeDivide(5, 0);
    print('5 / 0 = $r2');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Program finished.');
  }
}
```
