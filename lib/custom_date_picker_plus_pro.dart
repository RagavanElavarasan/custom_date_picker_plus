import 'package:calendar_date_picker2/calendar_date_picker2.dart' as cdp2;
import 'package:flutter/material.dart' ;
import 'package:intl/intl.dart';

/// A customizable picker package for Flutter providing date, time, year, and range selection.
class CustomPickers {
  /// Displays a customizable date picker dialog.
  static Future<DateTime?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    Color? primaryColor,
    Color? accentColor,
    TextStyle? textStyle,
    String? confirmText,
    String? cancelText,
    bool isDarkMode = false,
    bool centerLeadingDate = true,
    BorderRadius? borderRadius,
    double? dialogWidth,
    double? dialogHeight,
  }) async {
    return showDialog<DateTime>(
      context: context,
      builder: (context) => _CustomDatePickerDialog(
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        primaryColor: primaryColor ?? Colors.blue,
        accentColor: accentColor ?? Colors.white,
        textStyle: textStyle ?? const TextStyle(fontSize: 16),
        confirmText: confirmText ?? 'OK',
        cancelText: cancelText ?? 'Cancel',
        isDarkMode: isDarkMode,
        centerLeadingDate: centerLeadingDate,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        dialogWidth: dialogWidth ?? 300,
        dialogHeight: dialogHeight ?? 400,
      ),
    );
  }

  /// Displays a customizable time picker dialog.
  static Future<TimeOfDay?> showCustomTimePicker({
    required BuildContext context,
    TimeOfDay? initialTime,
    Color? primaryColor,
    Color? accentColor,
    TextStyle? textStyle,
    String? confirmText,
    String? cancelText,
    bool isDarkMode = false,
    bool use24HourFormat = false,
  }) async {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: use24HourFormat),
            child: child!,
          ),
        );
      },
    );
  }

  /// Displays a customizable year picker dialog.
  static Future<DateTime?> showCustomYearPicker({
    required BuildContext context,
    DateTime? initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    Color? primaryColor,
    Color? accentColor,
    TextStyle? textStyle,
    String? confirmText,
    String? cancelText,
    bool isDarkMode = false,
    double? dialogWidth,
    double? dialogHeight,
  }) async {
    return showDialog<DateTime>(
      context: context,
      builder: (context) => _CustomYearPickerDialog(
        initialDate: initialDate ?? DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate,
        primaryColor: primaryColor ?? Colors.blue,
        accentColor: accentColor ?? Colors.white,
        textStyle: textStyle ?? const TextStyle(fontSize: 16),
        confirmText: confirmText ?? 'OK',
        cancelText: cancelText ?? 'Cancel',
        isDarkMode: isDarkMode,
        dialogWidth: dialogWidth ?? 300,
        dialogHeight: dialogHeight ?? 400,
      ),
    );
  }

  /// Displays a customizable date range picker dialog.
  static Future<DateTimeRange?> showCustomRangePicker({
    required BuildContext context,
    DateTimeRange? initialDateRange,
    required DateTime firstDate,
    required DateTime lastDate,
    Color? primaryColor,
    Color? accentColor,
    TextStyle? textStyle,
    String? confirmText,
    String? cancelText,
    bool isDarkMode = false,
    bool centerLeadingDate = true,
    BorderRadius? borderRadius,
    double? dialogWidth,
    double? dialogHeight,
  }) async {
    return showDialog<DateTimeRange>(
      context: context,
      builder: (context) => _CustomRangePickerDialog(
        initialDateRange: initialDateRange,
        firstDate: firstDate,
        lastDate: lastDate,
        primaryColor: primaryColor ?? Colors.blue,
        accentColor: accentColor ?? Colors.white,
        textStyle: textStyle ?? const TextStyle(fontSize: 16),
        confirmText: confirmText ?? 'OK',
        cancelText: cancelText ?? 'Cancel',
        isDarkMode: isDarkMode,
        centerLeadingDate: centerLeadingDate,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        dialogWidth: dialogWidth ?? 300,
        dialogHeight: dialogHeight ?? 400,
      ),
    );
  }
}

class _CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color primaryColor;
  final Color accentColor;
  final TextStyle textStyle;
  final String confirmText;
  final String cancelText;
  final bool isDarkMode;
  final bool centerLeadingDate;
  final BorderRadius borderRadius;
  final double dialogWidth;
  final double dialogHeight;

  const _CustomDatePickerDialog({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.primaryColor,
    required this.accentColor,
    required this.textStyle,
    required this.confirmText,
    required this.cancelText,
    required this.isDarkMode,
    required this.centerLeadingDate,
    required this.borderRadius,
    required this.dialogWidth,
    required this.dialogHeight,
  });

  @override
  _CustomDatePickerDialogState createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<_CustomDatePickerDialog> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
      child: Container(
        //width: widget.dialogWidth,
        height: widget.dialogHeight,
        decoration: BoxDecoration(
          color: widget.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          children: [
            Expanded(
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                onDateChanged: (date) => setState(() => _selectedDate = date),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(widget.cancelText, style: widget.textStyle),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, _selectedDate),
                    child: Text(widget.confirmText, style: widget.textStyle.copyWith(color: widget.primaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomYearPickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color primaryColor;
  final Color accentColor;
  final TextStyle textStyle;
  final String confirmText;
  final String cancelText;
  final bool isDarkMode;
  final double dialogWidth;
  final double dialogHeight;

  const _CustomYearPickerDialog({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.primaryColor,
    required this.accentColor,
    required this.textStyle,
    required this.confirmText,
    required this.cancelText,
    required this.isDarkMode,
    required this.dialogWidth,
    required this.dialogHeight,
  });

  @override
  _CustomYearPickerDialogState createState() => _CustomYearPickerDialogState();
}

class _CustomYearPickerDialogState extends State<_CustomYearPickerDialog> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        //width: widget.dialogWidth,
        height: widget.dialogHeight,
        decoration: BoxDecoration(
          color: widget.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                onDateChanged: (date) => setState(() => _selectedDate = date),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(widget.cancelText, style: widget.textStyle),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, _selectedDate),
                    child: Text(widget.confirmText, style: widget.textStyle.copyWith(color: widget.primaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomRangePickerDialog extends StatefulWidget {
  final DateTimeRange? initialDateRange;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color primaryColor;
  final Color accentColor;
  final TextStyle textStyle;
  final String confirmText;
  final String cancelText;
  final bool isDarkMode;
  final bool centerLeadingDate;
  final BorderRadius borderRadius;
  final double dialogWidth;
  final double dialogHeight;

  const _CustomRangePickerDialog({
    this.initialDateRange,
    required this.firstDate,
    required this.lastDate,
    required this.primaryColor,
    required this.accentColor,
    required this.textStyle,
    required this.confirmText,
    required this.cancelText,
    required this.isDarkMode,
    required this.centerLeadingDate,
    required this.borderRadius,
    required this.dialogWidth,
    required this.dialogHeight,
  });

  @override
  _CustomRangePickerDialogState createState() => _CustomRangePickerDialogState();
}

class _CustomRangePickerDialogState extends State<_CustomRangePickerDialog> {
  late DateTimeRange _selectedRange;

  @override
  void initState() {
    super.initState();
    _selectedRange = widget.initialDateRange ??
        DateTimeRange(start: widget.firstDate, end: widget.lastDate);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
      child: Container(
        //width: widget.dialogWidth,
        height: widget.dialogHeight,
        decoration: BoxDecoration(
          color: widget.isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          children: [
            Expanded(
              child: cdp2.CalendarDatePicker2(
                config: cdp2.CalendarDatePicker2Config(
                  calendarType: cdp2.CalendarDatePicker2Type.range,
                  selectedDayHighlightColor: widget.primaryColor,
                  centerAlignModePicker: widget.centerLeadingDate,
                ),
                value: [_selectedRange.start, _selectedRange.end],
                onValueChanged: (dates) {
                  if (dates.length == 2)

{
                    setState(() {
                      _selectedRange = DateTimeRange(
                        start: dates[0],
                        end: dates[1],


                      );
                    });
                  }
                }

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(widget.cancelText, style: widget.textStyle),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, _selectedRange),
                    child: Text(widget.confirmText, style: widget.textStyle.copyWith(color: widget.primaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Configuration class for CalendarDatePicker2


/// Example usage widget
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