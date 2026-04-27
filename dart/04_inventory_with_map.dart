void main() {
  Map<String, int> stof = {"pen": 20, "notebook": 12, "eraser": 30};
  stof["notebook"] = (stof["notebook"] ?? 0) - 5;
  stof["marker"] = 10;
  stof.forEach((key, value) {
    if (value < 10) {
      print(key);
    }
  });

  for (final entry in stof.entries) {
    //
    if (entry.value < 10) {
      print(entry.key);
    }
  }
}
