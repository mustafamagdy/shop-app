import 'package:flutter/material.dart';
import 'package:flutter_store_app1/screens/details/details_screen.dart';

import '../../constants.dart';
import '../../models/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 260.0;
    return Expanded(
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: itemHeight,
            mainAxisSpacing: kDefaultPadding,
            crossAxisSpacing: kDefaultPadding,
            // childAspectRatio: 0.75,
          ),
          itemBuilder: (ctx, idx) {
            final product = products[idx];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DetailsScreen(product: product),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: itemHeight * 0.8,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Hero(
                        tag: '${product.id}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Container(
                    height: itemHeight * 0.15,
                    padding: const EdgeInsets.only(left: kDefaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            product.title,
                            style: TextStyle(
                              color: kTextColor.withOpacity(0.7),
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
