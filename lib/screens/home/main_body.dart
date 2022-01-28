import 'package:flutter/material.dart';

import '../../constants.dart';
import 'categories.dart';
import 'product_list.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Women',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: kDefaultPadding),
          const Catergories(),
          const ProductList(),
        ],
      ),
    );
  }
}
