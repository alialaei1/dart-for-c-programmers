class Shape {
  int id;
  Shape(this.id);
  double area() {
    return 0;
  }
}

class Circle extends Shape {
  int id;
  double D;
  double pi = 3.14;

  Circle(this.id, this.D) : super(id);

  @override
  double area() {
    return (D * pi);
  }
}

class Rectangle extends Shape {
  int id;
  double T;
  double A;
  Rectangle(this.id, this.T, this.A) : super(id);
  @override
  double area() {
    return ((A * 2) + (T * 2));
  }
}

void main() {
  print("run app at ${DateTime.now()}");
  double T = 2;
  double A = 2;
  double D = 2;

  Rectangle rectangle = new Rectangle(10001, T, A);
  Circle circle = new Circle(10002, D);

  print("Rectangle: ${rectangle.area()}");
  print("Circle: ${circle.area()}");

  final shapes = [Rectangle(10001, T, A), Circle(10002, D)];

  for (final shape in shapes) {
    print(shape.area());
  }
}
