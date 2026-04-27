# Example 4: Inventory with Map

## سوال
یک `Map<String, int>` برای موجودی کالا بساز:

- `pen: 20`
- `notebook: 12`
- `eraser: 30`

کارهایی که انجام شود:
- موجودی `notebook` را 5 تا کم کن
- یک آیتم جدید `marker: 10` اضافه کن
- اگر موجودی کالایی کمتر از 10 بود پیام هشدار چاپ شود

## راهنمای مرحله‌ای
1. `Map` اولیه را تعریف کن.
2. مقدار `notebook` را با خواندن مقدار فعلی و کم کردن 5 آپدیت کن.
3. آیتم جدید را اضافه کن.
4. با حلقه روی `entries` حرکت کن و شرط هشدار را چک کن.

## جواب کامل (Dart)
```dart
void main() {
  Map<String, int> inventory = {
    'pen': 20,
    'notebook': 12,
    'eraser': 30,
  };

  inventory['notebook'] = (inventory['notebook'] ?? 0) - 5;
  inventory['marker'] = 10;

  print('Inventory status:');
  for (final entry in inventory.entries) {
    print('- ${entry.key}: ${entry.value}');
    if (entry.value < 10) {
      print('  Warning: ${entry.key} is low in stock!');
    }
  }
}
```
