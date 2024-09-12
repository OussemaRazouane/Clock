import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class AnClock extends StatelessWidget {
  const AnClock({super.key, required this.size, required this.color, required this.current,});
  final double size;
  final Color color;
  final DateTime current;
  @override
  Widget build(BuildContext context) {
    return AnalogClock(
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: color),
          color: Colors.white,
          shape: BoxShape.circle),
      width: size,
      isLive: true,
      hourHandColor: color,
      minuteHandColor: color,
      showSecondHand: true,
      numberColor: color,
      showNumbers: true,
      showAllNumbers: true,
      textScaleFactor: 1.4,
      showTicks: true,
      tickColor: color,
      showDigitalClock: false,
      datetime: current,
    );
  }
}
