class Animal {
  String name;
  Animal(this.name);
  void move() {
    print("Animal moving");
  }
}

class Bird extends Animal {
  String name;
  Bird(this.name) : super(name);

  @override
  void move() {
    print("Bird is moving");
  }
}

class Fish extends Animal {
  String name;
  Fish(this.name) : super(name);
  @override
  void move() {
    //super.move();
    print("Fish is moving");
  }
}

void main() {
  print("run app! ${DateTime.now()}");
  String nameFish = "name fish";
  String nameBird = "name Bird";

  Fish fish = new Fish(nameFish);
  Bird bird = new Bird(nameBird);

  fish.move();
  bird.move();
}
