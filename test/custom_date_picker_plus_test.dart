import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_date_picker_plus_pro/custom_date_picker_plus_pro.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Simulate a large screen to avoid overflow
    TestWidgetsFlutterBinding.ensureInitialized().window.physicalSizeTestValue = const Size(1080, 1920);
    TestWidgetsFlutterBinding.ensureInitialized().window.devicePixelRatioTestValue = 1.0;
  });

  tearDown(() {
    // Reset screen size after each test
    TestWidgetsFlutterBinding.ensureInitialized().window.clearPhysicalSizeTestValue();
    TestWidgetsFlutterBinding.ensureInitialized().window.clearDevicePixelRatioTestValue();
  });

  group('CustomPickers Tests', () {
    testWidgets('showCustomDatePicker opens dialog and returns selected date', (WidgetTester tester) async {
      final initialDate = DateTime(2025, 1, 1);
      final firstDate = DateTime(2000);
      final lastDate = DateTime(2100);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1080, 1920)),
          child: MaterialApp(
            home: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  final result = await CustomPickers.showCustomDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    primaryColor: Colors.teal,
                    isDarkMode: true,
                  );
                  expect(result, isNotNull);
                },
                child: const Text('Open Date Picker'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });

    testWidgets('showCustomTimePicker opens dialog and returns selected time', (WidgetTester tester) async {
      final initialTime = const TimeOfDay(hour: 12, minute: 0);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1080, 1920)),
          child: MaterialApp(
            home: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  final result = await CustomPickers.showCustomTimePicker(
                    context: context,
                    initialTime: initialTime,
                    primaryColor: Colors.teal,
                    isDarkMode: true,
                    use24HourFormat: true,
                  );
                  expect(result, isNotNull);
                },
                child: const Text('Open Time Picker'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });

    testWidgets('showCustomYearPicker opens dialog and returns selected year', (WidgetTester tester) async {
      final initialDate = DateTime(2025);
      final firstDate = DateTime(2000);
      final lastDate = DateTime(2100);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1080, 1920)),
          child: MaterialApp(
            home: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  final result = await CustomPickers.showCustomYearPicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    primaryColor: Colors.teal,
                    isDarkMode: true,
                  );
                  expect(result, isNotNull);
                },
                child: const Text('Open Year Picker'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });

    testWidgets('showCustomRangePicker opens dialog and returns selected range', (WidgetTester tester) async {
      final initialDateRange = DateTimeRange(
        start: DateTime(2025, 1, 1),
        end: DateTime(2025, 1, 7),
      );
      final firstDate = DateTime(2000);
      final lastDate = DateTime(2100);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1080, 1920)),
          child: MaterialApp(
            home: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  final result = await CustomPickers.showCustomRangePicker(
                    context: context,
                    initialDateRange: initialDateRange,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    primaryColor: Colors.teal,
                    isDarkMode: true,
                  );
                  expect(result, isNotNull);
                },
                child: const Text('Open Range Picker'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });
  });
}
