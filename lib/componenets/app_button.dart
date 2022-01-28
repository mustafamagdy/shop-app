import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color color;
  final bool shallow;
  final VoidCallback onPress;
  const AppButton({
    Key? key,
    this.text,
    this.icon,
    required this.color,
    required this.onPress,
    this.shallow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = text != null
        ? Text(
            text!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        : Icon(icon!, color: color);

    return InkWell(
      splashColor: color,
      onTap: onPress,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: shallow ? Colors.white : color,
            border: Border.all(
              color: color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(child: child),
      ),
    );
  }
}
