# Example 16: Full Example - Shop System

## سوال
یک سیستم فروشگاهی بساز که این مفاهیم را با هم داشته باشد:

- `abstraction`: قرارداد پرداخت
- `inheritance`: انواع مشتری
- `polymorphism`: رفتار متفاوت پرداخت
- `encapsulation`: مدیریت موجودی کیف پول
- `mixin`: ثبت لاگ عملیات

## راهنمای مرحله‌ای
1. یک `mixin Logger` بساز.
2. کلاس `abstract PaymentMethod` با متد `pay` بساز.
3. کلاس `Wallet` بساز و موجودی را private نگه دار.
4. کلاس های `RegularCustomer` و `VipCustomer` از `Customer` ارث ببرند.
5. روش های پرداخت مختلف را پیاده سازی کن و در `main` اجرا کن.

## جواب کامل (Dart)
```dart
mixin Logger {
  void log(String text) => print('[LOG] $text');
}

abstract class PaymentMethod {
  bool pay(double amount);
}

class Wallet with Logger implements PaymentMethod {
  double _balance;
  Wallet(this._balance);

  double get balance => _balance;

  @override
  bool pay(double amount) {
    if (amount <= 0 || amount > _balance) {
      log('Wallet پرداخت ناموفق: amount=$amount');
      return false;
    }
    _balance -= amount;
    log('Wallet پرداخت موفق: amount=$amount, balance=$_balance');
    return true;
  }
}

class CardPayment with Logger implements PaymentMethod {
  @override
  bool pay(double amount) {
    log('Card payment done: $amount');
    return true;
  }
}

class Customer {
  String name;
  Customer(this.name);

  double getDiscountPercent() => 0;
}

class RegularCustomer extends Customer {
  RegularCustomer(String name) : super(name);
}

class VipCustomer extends Customer {
  VipCustomer(String name) : super(name);

  @override
  double getDiscountPercent() => 10;
}

void checkout(Customer customer, PaymentMethod paymentMethod, double amount) {
  final discount = customer.getDiscountPercent();
  final finalAmount = amount - (amount * discount / 100);
  final ok = paymentMethod.pay(finalAmount);
  print('${customer.name} checkout => $ok, finalAmount=$finalAmount');
}

void main() {
  final wallet = Wallet(500000);
  final card = CardPayment();

  final regular = RegularCustomer('Ali');
  final vip = VipCustomer('Sara');

  checkout(regular, wallet, 220000);
  checkout(vip, card, 220000);
}
```
