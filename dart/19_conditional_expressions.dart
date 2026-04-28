void main() {
  String? nikname = "ali";
  int score = 100;

  String safeName = nikname ?? "Guest";
  String status = score >= 50 ? "Pass" : "Fail";

  print("${safeName}");
  print("${status}");
}
