class BankAccount {
  double _balance = 0;

  double get balance {
    return _balance;
  }

  set balance(double amount) {
    if (amount <= 0) return;
    _balance = amount;
  }

  void deposit(double amount) {
    if (amount <= 0) return;
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) return;
    if (amount > _balance) return;
    _balance -= amount;
  }
}

void main() {
  final account = BankAccount();
  account.balance = 100000;

  account.deposit(100000);
  account.withdraw(50000);

  print("app in run! ${DateTime.now()}");
  print(account.balance);
}
