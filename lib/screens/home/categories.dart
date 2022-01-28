import 'package:flutter/material.dart';

import '../../constants.dart';

class Catergories extends StatefulWidget {
  const Catergories({Key? key}) : super(key: key);

  @override
  State<Catergories> createState() => _CatergoriesState();
}

class _CatergoriesState extends State<Catergories> {
  int selectedIndex = 0;
  final tabs = ['Hand bag', 'Jewellery', 'Footwear', 'Dresses'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (ctx, idx) {
            return _buildCategory(idx);
          }),
    );
  }

  _buildCategory(int index) {
    final isCurrent = index == selectedIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: kDefaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tabs[index],
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              margin: const EdgeInsets.only(top: kDefaultPadding / 4),
              height: 2,
              width: 30,
              color: isCurrent ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
