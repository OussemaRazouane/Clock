import 'package:flutter/material.dart';

class Type extends StatefulWidget {
  const Type({super.key, required this.type, required this.answer, required this.onSelected});
  final String type;
  final String answer;
  final ValueChanged<String> onSelected;
  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  late bool isSelected;
  @override
  Widget build(BuildContext context) {
    isSelected = widget.answer == widget.type;
    return ListTile(
      leading: Icon(isSelected? Icons.radio_button_checked : Icons.radio_button_unchecked,size:30),
      title: Text("${widget.type} Clock",style:const TextStyle(fontSize:20)),
      onTap: () {
        widget.onSelected(widget.type);
      },
    );
  }
}
