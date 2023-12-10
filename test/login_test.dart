// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:mobikon/presentation/login/login_controller.dart';

void main() {
  /// Pretest setup
  /// Setup for each test means that the test will start with a fresh instance of the class
  /// setup All will run only once before all the tests

  late LoginController loginController;
  setUp(() async {
    loginController = LoginController();
  });

  group('Login Controller', () {
    test(
      'Given login controller When email is set empty Then email is set in login controller',
      () {
        /// Act
        final String email = loginController.email;

        /// Assert
        expect(email, '');
      },
    );

    test(
      'Given login controller When email and password set Then email and password set in login controller',
      () {
        /// Act
        loginController.setEmail('affansultan901@gmail.com');
        loginController.setPassword('Affan@123');

        /// Assert
        expect(loginController.email, 'affansultan901@gmail.com');
        expect(loginController.password, 'Affan@123');
      },
    );
  });

  /// Post test teardown
  /// Teardown for each test means that the it calls after every test
  /// teardown All will run only once after all the tests
  tearDown(() async {});
  //tearDownAll(() async {});
}
