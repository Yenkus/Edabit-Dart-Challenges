import 'dart:math';

void main() {
  // Does triangle fit into the the trianglular hole?

  bool doesTriangleFit(List<int> dimensions1, List<int> dimensions2) {
    bool doesItFit = false;
    int triangleSides = 3;
    int triangle1 = 0;
    int triangle2 = 0;
    int triCounter = 2;
    if (dimensions1.length == triangleSides &&
        dimensions2.length == triangleSides) {
      // convert the triangle sides to a simple integers
      for (int i = 0; i < triangleSides; i++) {
        triangle1 += (dimensions1[i] * pow(10, triCounter).toInt());
        triangle2 += (dimensions2[i] * pow(10, triCounter).toInt());
        triCounter--;
        // if ((dimensions2[i] % dimensions1[i]) == 0) {
        //   // if (dimensions1[0] == dimensions1[1] &&
        //   //     dimensions1[0] == dimensions1[2]) {
        //   //   if (dimensions2[0] == dimensions2[1] &&
        //   //       dimensions2[0] == dimensions2[2]) {}
        //   // }
        //   doesItFit = true;
        // }
        //  else {
        //   doesItFit = false;
        // }
      }
      // compare the converted triangle values
      if (triangle2 % triangle1 == 0) {
        doesItFit = true;
      } else {
        doesItFit = false;
      }
    } else {
      print('Triangles have three(3) sides and nothing else');
    }
    return doesItFit;
  }

  print('Does the Triangle fit int the triangular hole: ${doesTriangleFit([
        1,
        1,
        1
      ], [
        2,
        2,
        2
      ])}');
}
