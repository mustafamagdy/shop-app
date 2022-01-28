import 'package:flutter/material.dart';

typedef ToggleFavorite = void Function(bool favorite);

class FavoriteToggle extends StatefulWidget {
  final ToggleFavorite onToggle;
  const FavoriteToggle({
    Key? key,
    required this.onToggle,
  }) : super(key: key);

  @override
  _FavoriteToggleState createState() => _FavoriteToggleState();
}

class _FavoriteToggleState extends State<FavoriteToggle> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.red[400],
          borderRadius: BorderRadius.circular(50),
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
              widget.onToggle(isFavorite);
            });
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 18,
          ),
        ));
  }
}
