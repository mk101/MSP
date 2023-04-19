import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key, required this.seconds, required this.minutes, required this.hours}) : super(key: key);

  final int seconds;
  final int minutes;
  final int hours;

  @override
  Widget build(BuildContext context) {
    return Text('$hours:$minutes:$seconds');
  }
}
