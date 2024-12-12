import 'dart:io';

void main() {
  print("Enter a number: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> result = fibonacciSeries(n);
  print('Fibonacci series up to $n terms: $result');
}

List<int> fibonacciSeries(int n) {
  List<int> series = [];

  int a = 0, b = 1;

  if (n == 0) {
    return series;
  }

  series.add(a);

  if (n > 1) {
    series.add(b);
  }

  for (int i = 2; i < n; i++) {
    int next = a + b;
    series.add(next);
    a = b;
    b = next;
  }

  return series;
}