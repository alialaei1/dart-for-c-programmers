abstract class PaymentMethod {
  void pay(double amount);
}

class CardPayment extends PaymentMethod {
  @override
  pay(payment) {
    print("$payment");
  }
}

class CashPayment extends PaymentMethod {
  @override
  pay(payment) {
    print("$payment");
  }
}

void main() {
  print("run app at ${DateTime.now()}");
  final cardPayment = CardPayment();
  final cashPayment = CashPayment();

  cashPayment.pay(100);
  cardPayment.pay(200);
}
