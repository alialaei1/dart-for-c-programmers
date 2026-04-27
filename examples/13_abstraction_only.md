# Example 13: Abstraction (Only)

## مفهوم
انتزاع یعنی «چی کار باید انجام شود» را تعریف کنیم، اما جزئیات «چطور انجام شود» را به کلاس های فرزند بسپاریم.

## سوال
یک کلاس `abstract` به نام `PaymentMethod` بساز که متد `pay(double amount)` داشته باشد.  
دو پیاده سازی `CardPayment` و `CashPayment` بساز.

## راهنمای مرحله‌ای
1. کلاس `abstract` تعریف کن.
2. متد `pay` را بدون بدنه در آن اعلام کن.
3. کلاس های concrete بساز و متد را پیاده سازی کن.
4. در `main` هر دو روش پرداخت را تست کن.

## جواب کامل (Dart)
```dart
abstract class PaymentMethod {
  void pay(double amount);
}

class CardPayment extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid $amount by card.');
  }
}

class CashPayment extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid $amount by cash.');
  }
}

void main() {
  final card = CardPayment();
  final cash = CashPayment();

  card.pay(250000);
  cash.pay(120000);
}
```
