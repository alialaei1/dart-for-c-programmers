extension StringExtension on String {
  String toTitleCase() {
    return this
        .split(" ")
        .map((word) => word.substring(0, 1).toUpperCase() + word.substring(1))
        .join(" ");
  }
}

void main() {
  print("ali".toTitleCase());
  print("ali alavi".toTitleCase());
  print("ali alavi".toTitleCase());
}
