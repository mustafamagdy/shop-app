import 'package:flutter/material.dart';

import 'package:flutter_store_app1/constants.dart';

typedef ColorSelectedCallBack = void Function(Color color);

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  final ColorSelectedCallBack onColorSelected;
  const ColorSelector({
    Key? key,
    required this.colors,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  var selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(
        widget.colors.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
              widget.onColorSelected(widget.colors[index]);
            });
          },
          child: _colorCircle(
            color: widget.colors[index],
            isSelected: index == selectedColorIndex,
          ),
        ),
      ).toList(),
    );
  }

  Widget _colorCircle({required Color color, required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding / 4),
      height: isSelected ? 20 : 16,
      width: isSelected ? 20 : 16,
      decoration: BoxDecoration(
        // color: Colors.transparent,
        border: Border.all(color: color, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.all(isSelected ? 1.5 : 0),
        height: 10,
        width: 10,
        //color: color,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
