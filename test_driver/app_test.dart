import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Login Automation", () {
    final emailFinder = find.byValueKey('email');
    final passFinder = find.byValueKey('password');
    final btnfinder = find.byValueKey('login');
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test("Do Login ", () async {
      await driver.tap(emailFinder);
      await driver.enterText('karthikavel2000@gmail.com');
      await driver.tap(passFinder);
      await driver.enterText('12345');
      await driver.tap(btnfinder);
      // expect(await driver.getText(emailFinder), 'karthikavel2000@gmail.com');
      // expect(await driver.getText(passFinder), '12345');
    });
  });
}
