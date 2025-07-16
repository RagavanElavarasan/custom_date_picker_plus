Custom Pickers
A Flutter package providing customizable date, time, year, and range pickers with extensive styling options.
Features

Date Picker: Customizable colors, text styles, dialog sizes, and dark mode support.
Time Picker: Supports 12/24-hour formats with customizable theming.
Year Picker: Allows year selection within a specified range.
Range Picker: Supports date range selection with customizable styling.
Multi-language Support: Uses the intl package for localization.
Theming: Customizable primary and accent colors, border radius, and dark mode.

Installation
Add this to your pubspec.yaml:
dependencies:
  custom_pickers: ^1.0.0

Run:
flutter pub get

Usage
Below is an example of how to use the CustomPickers package in your Flutter app:
import 'package:custom_pickers/custom_pickers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Pickers Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const CustomPickerExample(),
    );
  }
}

class CustomPickerExample extends StatefulWidget {
  const CustomPickerExample({Key? key}) : super(key: key);

  @override
  _CustomPickerExampleState createState() => _CustomPickerExampleState();
}

class _CustomPickerExampleState extends State<CustomPickerExample> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DateTime? _selectedYear;
  DateTimeRange? _selectedRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Pickers Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final date = await CustomPickers.showCustomDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  primaryColor: Colors.teal,
                  isDarkMode: true,
                  borderRadius: BorderRadius.circular(20),
                );
                if (date != null) setState(() => _selectedDate = date);
              },
              child: Text(_selectedDate == null
                  ? 'Select Date'
                  : DateFormat.yMd().format(_selectedDate!)),
            ),
            ElevatedButton(
              onPressed: () async {
                final time = await CustomPickers.showCustomTimePicker(
                  context: context,
                  primaryColor: Colors.teal,
                  isDarkMode: true,
                  use24HourFormat: true,
                );
                if (time != null) setState(() => _selectedTime = time);
              },
              child: Text(_selectedTime == null
                  ? 'Select Time'
                  : _selectedTime!.format(context)),
            ),
            ElevatedButton(
              onPressed: () async {
                final year = await CustomPickers.showCustomYearPicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  primaryColor: Colors.teal,
                  isDarkMode: true,
                );
                if (year != null) setState(() => _selectedYear = year);
              },
              child: Text(_selectedYear == null
                  ? 'Select Year'
                  : DateFormat.y().format(_selectedYear!)),
            ),
            ElevatedButton(
              onPressed: () async {
                final range = await CustomPickers.showCustomRangePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  primaryColor: Colors.teal,
                  isDarkMode: true,
                  borderRadius: BorderRadius.circular(20),
                );
                if (range != null) setState(() => _selectedRange = range);
              },
              child: Text(_selectedRange == null
                  ? 'Select Range'
                  : '${DateFormat.yMd().format(_selectedRange!.start)} - ${DateFormat.yMd().format(_selectedRange!.end)}'),
            ),
          ],
        ),
      ),
    );
  }
}

Example
To see a full example, check the example directory in the repository.
Contributing
Pull requests are welcome. Please follow the contribution guidelines.
License
MIT License. See LICENSE for details.