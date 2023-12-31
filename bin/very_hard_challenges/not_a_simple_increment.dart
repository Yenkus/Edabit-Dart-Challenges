import 'dart:math';

void main() {
  // Not a Simple Increment
  // Very confusing question

  void simpleIncrement(int n, int iteration, int step) {
    int position = 0;
    print('n = $n \niteration: $iteration\nstep: $step');
    for (int i = 0; i < iteration; i++) {
      int length = n.toString().length;
      print('length: $length');
      position = (position + step) % length;
      print('position $position');
      n += pow(10, length - position - 1).toInt();
      print('power: ${pow(10, length - position - 1).toInt()}');
      print('n + power: $n');
      if (n.toString().length > length) {
        position += 1;
        print('position in if: $position');
      }
    }
    print('n: $n');
  }

  simpleIncrement(143726, 16, 3);
}
