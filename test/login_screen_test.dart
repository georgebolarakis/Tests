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
      expect(title, findsOneWidget);
    });

    testWidgets("Should have one text field form, to collect user email id",
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
      Finder loginButton = find.byKey(
        const ValueKey('Login Button'),
      );
      //we want to test and simulate a tap on the button
      await tester.tap(loginButton);
      //we are waiting for all annimations to complete
      await tester.pumpAndSettle();

      Finder errorTexts = find.text('Required field');

      // Assert
      expect(
        errorTexts,
        findsAtLeastNWidgets(2),
      );
    });

    testWidgets(
        "Shoudl show required correct email message if format is wrong ",
        (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(
        const ValueKey("email_id"),
      );
      await tester.enterText(userNameTextField, 'some@com');
      //we need to simulate the tap button first
      Finder loginButton = find.byKey(
        const ValueKey('Login Button'),
      );
      //we want to test and simulate a tap on the button
      await tester.tap(loginButton);
      //we are waiting for all annimations to complete
      await tester.pumpAndSettle();

      Finder errorText = find.text('Please enter a valid email Id');

      // Assert
      expect(
        errorText,
        findsOneWidget,
      );
    });

    testWidgets("Shoudl show required correct password if format is wrong ",
        (WidgetTester tester) async {
      //Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(
        const ValueKey("password"),
      );
      await tester.enterText(userNameTextField, 'somecom');
      //we need to simulate the tap button first
      Finder loginButton = find.byKey(
        const ValueKey('Login Button'),
      );
      //we want to test and simulate a tap on the button
      await tester.tap(loginButton);
      //we are waiting for all annimations to complete
      await tester.pumpAndSettle();

      Finder errorText = find.text('Please add a valid password');

      // Assert
      expect(
        errorText,
        findsOneWidget,
      );
    });

//This is for when we succesfully login
    testWidgets("Should submit form when user email & password is valid",
        (WidgetTester tester) async {
  //Arange
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

  //Act
      //we need to identify the widgets in question
      Finder userNameTextField = find.byKey(
        const ValueKey("email_id"),
      );
      Finder passwordTextField = find.byKey(
        const ValueKey("password"),
      );
      // we need to wait for the input of the user and compare it to a correct format
      await tester.enterText(userNameTextField, 'some@gmail.com');
      await tester.enterText(passwordTextField, 'sS3!hfgdo');
      // we need to listen for the button tap
      Finder loginButton = find.byKey(
        const ValueKey("Login Button"),
      );
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      // we need to register the errors that we are looking for
      Finder errorTexts = find.text("required field");

  //Assert
      //since everything works as planned we return nothing
      expect(errorTexts, findsNothing);
    });
  });
}
