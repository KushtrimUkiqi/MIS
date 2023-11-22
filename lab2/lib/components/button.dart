import 'package:flutter/material.dart';

class ClothesButton extends StatelessWidget {
  final int index;
  final String text;
  final Function onPressed;

  const ClothesButton({Key? key,
    required this.index,
    required this.text,
    required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(index);
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.red[800]),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[300],
        minimumSize: const Size(140, 40),
      ),
    );
  }
}