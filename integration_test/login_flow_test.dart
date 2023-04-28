import 'package:first_test/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Here we are doing integration testing of the flow of the login screen
// We need to group a complete flow
void main() {
  group(
    'Login flow test',
    () {
      // The line below ensures that we are integration testing our widgets
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      // This is the empty field flow
      testWidgets(
          "Should show requeired fieled error message when user tries to login but they don't enter an email or password and tapping the login button",
          (WidgetTester tester) async {
        //Arange
        await tester.pumpWidget(
          const MaterialApp(
            home: LoginScreen(),
          ),
        );

        //Act
        Finder loginButton = find.byKey(
          const ValueKey("Login Button"),
        );
        await tester.tap(loginButton);
        // we are adding a duration since the test is really fast
        await tester.pumpAndSettle(const Duration(seconds: 2),);
        Finder errorText = find.text('Required field');
        //Assert
        expect(errorText, findsNWidgets(2));
      });
      // this is a validation of valid credentials flow
      testWidgets(
          "Should show HomeScreen after the credentials submited by user are valid",
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
        await tester.pumpAndSettle(const Duration(seconds: 2),);
        Finder welcomText = find.byType(Text);
        //Assert
        expect(welcomText, findsOneWidget);
      });
    },
  );
}
