import 'package:flutter/material.dart';

class CalendarForm extends StatefulWidget {
  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        title: Text("Calendar Form"),
      ),
    );
  }
}
