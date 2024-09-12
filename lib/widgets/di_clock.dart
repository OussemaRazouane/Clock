import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class DiClock extends StatelessWidget {
  const DiClock({super.key,required this.color, required this.current});
  final Color color;
  final DateTime current;
  @override
  Widget build(BuildContext context) {
    return DigitalClock(
        textScaleFactor: 3,
        showSeconds: true,
        isLive: true,
        digitalClockTextColor: color,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.all(Radius.circular(15))),
        datetime:current ,
    );
  }
}
