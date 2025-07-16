import 'package:custom_date_picker_plus/custom_date_picker_plus.dart';
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
      title: 'Custom Date Picker Plus Demo',
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
      appBar: AppBar(title: const Text('Custom Date Picker Plus Demo')),
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