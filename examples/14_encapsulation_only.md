# Example 14: Encapsulation (Only)

## مفهوم
کپسولیشن یعنی داده داخلی کلاس را مستقیم در دسترس نگذاریم و از getter/setter کنترل شده استفاده کنیم.

## سوال
کلاس `BankAccount` بساز که:

- فیلد خصوصی `_balance` داشته باشد
- `deposit` و `withdraw` برای تغییر موجودی داشته باشد
- اجازه برداشت بیشتر از موجودی ندهد

## راهنمای مرحله‌ای
1. متغیر `_balance` را private تعریف کن.
2. getter برای نمایش موجودی بساز.
3. متد `deposit` با اعتبارسنجی مقدار مثبت بنویس.
4. متد `withdraw` با کنترل سقف موجودی بنویس.

## جواب کامل (Dart)
```dart
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) return;
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= 0) return false;
    if (amount > _balance) return false;
    _balance -= amount;
    return true;
  }
}

void main() {
  final account = BankAccount();
  account.deposit(500000);
  print('Balance: ${account.balance}');

  final ok = account.withdraw(200000);
  print('Withdraw success: $ok');
  print('Balance: ${account.balance}');

  final fail = account.withdraw(400000);
  print('Withdraw success: $fail');
  print('Balance: ${account.balance}');
}
```
