import 'package:first_test/validator.dart';
import 'package:flutter_test/flutter_test.dart';


// Here we are doing unit testing
void main() {
  group('email validation', () {
    test("validate for empty email id", () {
      //Arrange & Act
      var result = Validator.validateEmail("");
      // Assert
      expect(result, 'Required field');
    });

    test("validate for invalid email id", () {
      //Arrange & Act
      var result = Validator.validateEmail("dfsf");
      // Assert
      expect(result, 'Please enter a valid email Id');
    });

    test("validate for valid email id", () {
      //Arrange & Act
      var result = Validator.validateEmail("abc@gmail.com");
      // Assert
      expect(result, null);
    });
  });


  group('Password validation', () {
    test('Validate for empty password', () {
      //Arrange & Act
      var result = Validator.validatePassword('');
      //Assert
      expect(result, 'Required field');
    });

    test('Validate for invalid password', () {
      //Arrange & Act
      var result = Validator.validatePassword('gkn');
      //Assert
      expect(result, 'Please add a valid password');
    });

    test("validate for valid password", () {
      //Arrange & Act
      var result = Validator.validateEmail("asKK*j");
      // Assert
      expect(result, null);
    });
  });
}
