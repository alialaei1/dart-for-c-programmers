# Example 9: Null Safety Basics

## سوال
برنامه ای بنویس که اطلاعات کاربر را مدیریت کند:

- `String? nickname` که ممکن است null باشد
- `int? age` که ممکن است null باشد

یک تابع بنویس که اگر `nickname` یا `age` مقدار نداشتند، مقدار پیش فرض چاپ کند.

## راهنمای مرحله‌ای
1. متغیر nullable با `?` تعریف کن.
2. از `??` برای مقدار پیش فرض استفاده کن.
3. یک تابع بساز که خروجی مناسب را چاپ کند.
4. دو سناریو تست کن: با مقدار و بدون مقدار.

## جواب کامل (Dart)
```dart
void printUserInfo(String? nickname, int? age) {
  final safeNickname = nickname ?? 'Guest';
  final safeAge = age ?? 0;

  print('Nickname: $safeNickname');
  print('Age: $safeAge');
}

void main() {
  print('Case 1:');
  printUserInfo('ali_dev', 24);

  print('\nCase 2:');
  printUserInfo(null, null);
}
```
