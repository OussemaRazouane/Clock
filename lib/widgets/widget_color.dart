import 'package:flutter/material.dart';
import 'package:my_clock/constants/const.dart';

class ColorWidget extends StatefulWidget {
  final Color color;
  final Color answer;
  final ValueChanged<Color> onSelected;
  const ColorWidget({super.key, required this.color, required this.onSelected, required this.answer});
  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  late bool isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected=widget.answer==widget.color;
    return InkWell(
      onTap: () => {
        setState(() {
          // Perform color change animation here
          widget.onSelected(widget.color);
        })
      },
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: isSelected ? const Icon(Icons.check) :null ,
          )),
    );
  }
}
