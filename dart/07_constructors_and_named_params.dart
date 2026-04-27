class Product {
  String name;
  double price;
  String category;
  double discountPercen;

  Product({
    required this.name,
    required this.price,
    required this.category,
    this.discountPercen = 0,
  });
  double finalPrice() {
    return (price - (discountPercen == 0 ? 0 : (discountPercen / 100 * price)));
  }
}

void main() {
  print("app in run! ${DateTime.now()}");
  Product product = Product(
    name: "name",
    price: 12.2,
    category: "category",
    discountPercen: 10,
  );

  print(product.finalPrice());
}
