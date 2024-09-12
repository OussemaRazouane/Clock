// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Slid extends StatefulWidget {
  const Slid({
    super.key,
    required this.size,
    required this.onSelected,
  });
  final double size;
  final ValueChanged<double> onSelected;
  @override
  State<Slid> createState() => _SlidState();
}

class _SlidState extends State<Slid> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      min:200,
      max: 400,
      value: widget.size,
      onChanged: (val) {
        widget.onSelected(val);
      },
    );
  }
}
