import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ColorDotsState createState() => _ColorDotsState(product.colors.indexOf(product.selectedColor));
}

class _ColorDotsState extends State<ColorDots> {
  int selectedIndex;

  _ColorDotsState(int selectedIndex) : this.selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              isSelected: selectedIndex == index,
              onColorChanged: () => _handleChangeColor(index),
            ),
          ),
        ],
      ),
    );
  }

  void _handleChangeColor(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
    required this.onColorChanged,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final GestureTapCallback onColorChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onColorChanged,
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
          shape: BoxShape.circle,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
