String? def(String? name, int? age) {
  if (name != null && age != null) {
    return null;
  } else {
    return "fffff";
  }
}

void printUserInfo(String? name, int? age) {
  final String safeNickname = name ?? "Guest";
  final int safeAge = age ?? 0;
  print(safeNickname);
  print(safeAge);
}

//retuen
({String nickname, int age}) printUserInfo2(String? name, int? age) {
  final String safeNickname = name ?? "Guest";
  final int safeAge = age ?? 0;
  return (nickname: safeNickname, age: safeAge);
}

void main() {
  print("app in run! ${DateTime.now()}");
  String? nickname;
  int? age;

  print(def(nickname, age));

  printUserInfo(nickname, age);

  print(printUserInfo2(nickname, age));
}
