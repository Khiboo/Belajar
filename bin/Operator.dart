//CONTOH PERTEMUSN 3
void main() {
  int a = 10;
  int b = 4;

  // Operator Aritmatika
  print("=== Operator Aritmatika ===");
  print("$a + $b = ${a + b}");
  print("$a - $b = ${a - b}");
  print("$a * $b = ${a * b}");
  print("$a / $b = ${a / b}");
  print("$a ~/ $b = ${a ~/ b}");
  print("$a % $b = ${a % b}");

  // Operator Perbandingan
  print("\n=== Operator Perbandingan ===");
  print("$a == $b : ${a == b}");
  print("$a != $b : ${a != b}");
  print("$a > $b  : ${a > b}");
  print("$a < $b  : ${a < b}");
  print("$a >= $b : ${a >= b}");
  print("$a <= $b : ${a <= b}");

  // Operator Penugasan
  print("\n=== Operator Penugasan ===");
  int x = 5;
  print("x = $x");

  x += 3;  // sama dengan x = x + 3
  print("x += 3 → $x");

  x -= 2;  // sama dengan x = x - 2
  print("x -= 2 → $x");

  x *= 4;  // sama dengan x = x * 4
  print("x *= 4 → $x");

  x ~/= 3; // sama dengan x = x ~/ 3 (pembagian bulat)
  print("x ~/= 3 → $x");

  x %= 3;  // sama dengan x = x % 3 (sisa bagi)
  print("x %= 3 → $x");
}
