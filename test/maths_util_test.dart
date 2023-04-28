import 'package:first_test/model/maths_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Math Utils -', () {

   test('Testing addition functionality between two numbers', () {
    //Arrange
    var a = 10;
    var b = 10;
    // Act
    var sum = add(a, b);
    //Assert
    expect(sum, 20);
  });

  test('Testing substraction functionality between two numbers', () {
    //Arrange
    var a = 20;
    var b = 10;
    // Act
    var subs = substract(a, b);
    //Assert
    expect(subs, 10);
  });

  test('Testing multiplication functionality between two numbers', () {
    //Arrange
    var a = 10;
    var b = 10;
    // Act
    var mul = multiply(a, b);
    //Assert
    expect(mul, 100);
  });
  });
 
}
