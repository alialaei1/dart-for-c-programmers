# Example 1: Student Score Analysis

## سوال
برنامه ای بنویس که اطلاعات یک دانشجو را نگه دارد و تحلیل کند:

- نام دانشجو (`String`)
- سن (`int`)
- سه نمره (`double`)
- میانگین را حساب کن
- اگر میانگین بالای 17 بود چاپ کند: `Excellent`
- اگر بین 14 تا 17 بود چاپ کند: `Good`
- در غیر این صورت چاپ کند: `Needs Work`

## راهنمای مرحله‌ای
1. متغیرهای `name`, `age`, `score1`, `score2`, `score3` را تعریف کن.
2. میانگین را در متغیر `average` حساب کن.
3. با `if / else if / else` وضعیت دانشجو را تعیین کن.
4. خروجی کامل و خوانا چاپ کن.

## جواب کامل (Dart)
```dart
void main() {
  String name = 'Ali';
  int age = 23;
  double score1 = 18.5;
  double score2 = 16.0;
  double score3 = 17.5;

  double average = (score1 + score2 + score3) / 3;

  String status;
  if (average > 17) {
    status = 'Excellent';
  } else if (average >= 14) {
    status = 'Good';
  } else {
    status = 'Needs Work';
  }

  print('Name: $name');
  print('Age: $age');
  print('Average: ${average.toStringAsFixed(2)}');
  print('Status: $status');
}
```
