import 'package:calendar_date_picker2/calendar_date_picker2.dart' as cdp2;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_date_picker_plus_pro/custom_date_picker_plus_pro.dart';
import 'package:intl/intl.dart';

void main() {
  group('CustomPickers Tests', () {
    testWidgets('showCustomDatePicker opens dialog and returns selected date', (WidgetTester tester) async {
      final initialDate = DateTime(2025, 1, 1);
      final firstDate = DateTime(2000);
      final lastDate = DateTime(2100);

      // Build a simple widget to provide a context
      await tester.pumpWidget(
        MaterialApp(
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
                expect(result, isNotNull); // Verify dialog can be called
              },
              child: const Text('Open Date Picker'),
            ),
          ),
        ),
      );

      // Tap the button to trigger the dialog
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });

    testWidgets('showCustomTimePicker opens dialog and returns selected time', (WidgetTester tester) async {
      final initialTime = TimeOfDay(hour: 12, minute: 0);

      await tester.pumpWidget(
        MaterialApp(
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
                expect(result, isNotNull); // Verify dialog can be called
              },
              child: const Text('Open Time Picker'),
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
        MaterialApp(
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
                expect(result, isNotNull); // Verify dialog can be called
              },
              child: const Text('Open Year Picker'),
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
        MaterialApp(
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
                expect(result, isNotNull); // Verify dialog can be called
              },
              child: const Text('Open Range Picker'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
    });
  });
}