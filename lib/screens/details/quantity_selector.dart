import 'package:flutter/material.dart';

import '../../constants.dart';

typedef QuantitySelected = void Function(int quantity);

class QuantitySelector extends StatefulWidget {
  final QuantitySelected onQtyUpdate;
  const QuantitySelector({
    Key? key,
    required this.onQtyUpdate,
  }) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    final color = kTextColor.withOpacity(0.4);
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (quantity > 1) {
                quantity -= 1;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.fromBorderSide(
                BorderSide(color: color, width: 1),
              ),
            ),
            child: Icon(Icons.remove, color: color),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Center(
            child: Text(
              '$quantity',
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (quantity < 10) {
                quantity += 1;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            margin: const EdgeInsets.only(right: 10),
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.fromBorderSide(
                BorderSide(color: color, width: 1),
              ),
            ),
            child: Icon(Icons.add, color: color),
          ),
        ),
      ],
    );
  }
}
