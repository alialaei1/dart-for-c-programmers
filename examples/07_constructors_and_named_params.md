# Example 7: Constructors and Named Parameters

## سوال
یک کلاس `Product` بساز با فیلدهای:

- `name` (`String`)
- `price` (`double`)
- `category` (`String`)
- `discountPercent` (`double`)

از سازنده با پارامترهای named استفاده کن و `discountPercent` را پیش فرض `0` بگذار.
یک متد `finalPrice()` بنویس که قیمت نهایی را برگرداند.

## راهنمای مرحله‌ای
1. فیلدها را تعریف کن.
2. سازنده را به شکل named بنویس (`required` برای فیلدهای لازم).
3. مقدار پیش فرض برای `discountPercent` بگذار.
4. متد `finalPrice()` را با فرمول تخفیف پیاده سازی کن.
5. در `main` دو محصول بساز و خروجی بگیر.

## جواب کامل (Dart)
```dart
class Product {
  String name;
  double price;
  String category;
  double discountPercent;

  Product({
    required this.name,
    required this.price,
    required this.category,
    this.discountPercent = 0,
  });

  double finalPrice() {
    return price - (price * discountPercent / 100);
  }
}

void main() {
  final p1 = Product(name: 'Notebook', price: 120000, category: 'Stationery');
  final p2 = Product(
    name: 'Headphone',
    price: 900000,
    category: 'Electronics',
    discountPercent: 15,
  );

  print('${p1.name}: ${p1.finalPrice().toStringAsFixed(0)}');
  print('${p2.name}: ${p2.finalPrice().toStringAsFixed(0)}');
}
```
