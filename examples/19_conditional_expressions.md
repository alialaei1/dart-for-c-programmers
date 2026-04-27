# Example 19: Conditional Expressions (`??` and `?:`)

## سوال
یک برنامه بنویس که اطلاعات کاربر را نمایش دهد:

- `String? nickname`
- `int score`

قوانین:
- اگر `nickname` مقدار نداشت، از `"Guest"` استفاده شود (`??`)
- اگر `score >= 50` بود وضعیت `"Pass"` وگرنه `"Fail"` شود (`?:`)

## راهنمای مرحله‌ای
1. متغیر nullable برای نام مستعار تعریف کن.
2. با `??` یک مقدار پیش فرض بده.
3. با `?:` وضعیت قبولی/ردی را مشخص کن.
4. خروجی نهایی را چاپ کن.

## جواب کامل (Dart)
```dart
void main() {
  String? nickname;
  int score = 72;

  String displayName = nickname ?? 'Guest';
  String result = score >= 50 ? 'Pass' : 'Fail';

  print('User: $displayName');
  print('Score: $score');
  print('Result: $result');
}
```
