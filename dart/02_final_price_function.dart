void main() {
  double price = 12.3;
  double discountPercent = 20;
  double taxPercent = 9;
  double answer = calculateFinalPrice(
    price,
    discountPercent,
    taxPercent: taxPercent,
  );
  print("answer : $answer");
}

double calculateFinalPrice(
  double price,
  double discountPercent, {
  double taxPercent = 9,
}) {
  double priceWithDiscount = price - ((discountPercent / 100) * price);
  return (priceWithDiscount + (taxPercent / 100) * priceWithDiscount);
}
