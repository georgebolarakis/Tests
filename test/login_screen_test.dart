import 'package:first_test/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Here we are doing Widget Testing
void main() {
  group("UI Rendering Widget Testing", () {
    testWidgets('Should have a title', (WidgetTester tester) async {
      //Arrange

      //we need to load the ui in our test case but since it is called from MaterialApp
      //we need to wrap the LoginScreen in a MaterialApp
      //we essentially render our login screen in our function
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act

      // We need to find where the title is
      // Finder tittle = find.byKey(key)
      Finder title = find.text('Login Screen');

      //Assert
      //Assert
      expect(title, findsOneWidget);
    });

    testWidgets("Should have one text field fform to collect user email id",
        (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(const ValueKey('email_id'));

      // Assert
      expect(userNameTextField, findsOneWidget);
    });

    testWidgets("Should have one text field fform to collect user password",
        (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder passwordTextField = find.byKey(const ValueKey('password'));

      // Assert
      expect(passwordTextField, findsOneWidget);
    });

    testWidgets("Should have one login button", (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      //Finder loginButton = find.byType(ElevatedButton);
      Finder loginButton = find.byKey(const ValueKey('Login Button'));

      // Assert
      expect(loginButton, findsOneWidget);
    });
  });

  group("Behavioral Testing Widgets", () {
    testWidgets(
        "Should show Required Fields error message if user email & password is empty",
        (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      //we need to simulate the tap button first
      Finder loginButton = find.byKey(const ValueKey('Login Button'),);


      // Assert
    });
  });
}
