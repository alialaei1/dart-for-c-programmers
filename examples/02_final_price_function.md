# Example 2: Final Price Function

## سوال
یک تابع بنویس:

`double calculateFinalPrice(double price, double discountPercent, {double taxPercent = 9})`

کار تابع:
- تخفیف را از قیمت کم کند
- سپس مالیات را اضافه کند
- قیمت نهایی را برگرداند

## راهنمای مرحله‌ای
1. پارامترهای تابع را تعریف کن (سومی optional named باشد).
2. مقدار تخفیف را حساب کن.
3. قیمت بعد از تخفیف را به دست بیاور.
4. مالیات را روی قیمت بعد از تخفیف اعمال کن.
5. خروجی تابع را در `main` با چند مثال چاپ کن.

## جواب کامل (Dart)
```dart
double calculateFinalPrice(
  double price,
  double discountPercent, {
  double taxPercent = 9,
}) {
  double discountAmount = price * (discountPercent / 100);
  double discountedPrice = price - discountAmount;
  double taxAmount = discountedPrice * (taxPercent / 100);

  return discountedPrice + taxAmount;
}

void main() {
  double result1 = calculateFinalPrice(200000, 10);
  double result2 = calculateFinalPrice(500000, 15, taxPercent: 5);

  print('Result 1 (default tax 9%): ${result1.toStringAsFixed(0)}');
  print('Result 2 (custom tax 5%): ${result2.toStringAsFixed(0)}');
}
```
