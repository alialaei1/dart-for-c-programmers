mixin Logger {
  void log(String text) {
    print('[LOG] $text');
  }
}

abstract class PaymentMethod {
  bool pay(double amount);
}

class Wallet with Logger implements PaymentMethod {
  double _balance;
  Wallet(this._balance);

  double get balance {
    return _balance;
  }

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

  print("start app at ${DateTime.now()}");
}
