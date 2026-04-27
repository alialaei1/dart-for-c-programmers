# Example 3: List and Set Basics

## سوال
یک `List<int>` از اعداد با مقدار تکراری بساز:

`[2, 3, 3, 5, 7, 7, 7, 10]`

کارهایی که باید انجام شود:
- تعداد کل اعضای لیست را چاپ کن
- با `Set` تکراری ها را حذف کن
- جمع کل اعداد یکتا را حساب کن

## راهنمای مرحله‌ای
1. لیست اولیه را تعریف کن.
2. با `toSet()` آن را به `Set<int>` تبدیل کن.
3. با یک حلقه یا `for-in` مجموع را حساب کن.
4. لیست اولیه، مجموعه یکتا و مجموع را چاپ کن.

## جواب کامل (Dart)
```dart
void main() {
  List<int> numbers = [2, 3, 3, 5, 7, 7, 7, 10];
  Set<int> uniqueNumbers = numbers.toSet();

  int sum = 0;
  for (final n in uniqueNumbers) {
    sum += n;
  }

  print('Original list: $numbers');
  print('Total count: ${numbers.length}');
  print('Unique values: $uniqueNumbers');
  print('Sum of unique values: $sum');
}
```
