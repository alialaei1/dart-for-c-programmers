void main() {
  List<int> L1 = [2, 3, 3, 5, 7, 7, 7, 10];
  Set<int> S1 = L1.toSet();

  for (int i = 0; i < L1.length; i++) {
    print(L1[i]);
  }
  for (final n in L1) {
    print(n);
  }
  int sum = 0;
  for (final n in S1) {
    sum += n;
  }
  print(sum);
}
