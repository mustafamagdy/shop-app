import 'package:flutter/material.dart';
import 'package:flutter_store_app1/componenets/app_button.dart';

import '../../componenets/color_selector.dart';
import '../../constants.dart';
import '../../models/product.dart';
import '../../screens/details/favorite_toggle.dart';
import '../../screens/details/quantity_selector.dart';
import '../../componenets/app_bar.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Color? productColor;

  @override
  void initState() {
    super.initState();
    productColor = widget.product.color;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: productColor,
      appBar: buildMainAppBar(context, color: productColor!),
      body: Stack(
        children: [
          _productTitle(),
          _productPrice(size),
          _productDetails(size),
          _productImage(size),
        ],
      ),
    );
  }

  Widget _productTitle() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aristocratic Hand Bag',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            Text(
              widget.product.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productDetails(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const SizedBox(height: kDefaultPadding * 5),
              Row(
                children: [
                  _productColors(),
                  const Spacer(),
                  _productSize(),
                  const Spacer()
                ],
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                widget.product.description,
                softWrap: true,
                style: TextStyle(
                  color: kTextColor.withOpacity(0.7),
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Row(
                children: [
                  QuantitySelector(onQtyUpdate: (qty) {}),
                  const Spacer(),
                  FavoriteToggle(onToggle: (isFavorite) {})
                ],
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: AppButton(
                      icon: Icons.shopping_cart_outlined,
                      color: productColor!,
                      shallow: true,
                      onPress: () {},
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Flexible(
                    flex: 5,
                    child: AppButton(
                      text: 'BUY NOW',
                      color: productColor!,
                      onPress: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _productColors() {
    final colors = [widget.product.color, Colors.amber, Colors.grey];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            color: kTextColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        ColorSelector(
          colors: colors,
          onColorSelected: (color) {
            setState(() {
              productColor = color;
            });
          },
        )
      ],
    );
  }

  Widget _productSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            color: kTextColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${widget.product.size} cm',
          style: TextStyle(
              color: kTextColor.withOpacity(0.8),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )
      ],
    );
  }

  Widget _productPrice(Size size) {
    return Positioned(
      left: 0,
      top: size.height * 0.22,
      child: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImage(Size size) {
    return Positioned(
      right: kDefaultPadding - 5,
      top: 80,
      child: SizedBox(
          width: 250,
          height: 280,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.cover,
          )),
    );
  }
}
