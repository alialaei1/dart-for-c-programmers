class Box<T> {
  T _value;
  Box(this._value);
  void setValue(T value) {
    this._value = value;
  }

  T getValue() {
    return _value;
  }
}

void main() {
  final box = Box<int>(10);
  box.setValue(20);
  print(box.getValue());
  final box2 = Box<String>("Hello");
  box2.setValue("World");
  print(box2.getValue());
}
