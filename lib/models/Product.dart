import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final List<String> colorNames;
  final double rating, price;
  final bool isPopular;
  final Color selectedColor;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    required this.colorNames,
    this.rating = 0.0,
    this.isPopular = false,
    Color? defaultColor,
    required this.title,
    required this.price,
    required this.description,
  })  : assert(colors.isNotEmpty, true),
        assert(colors.length == colorNames.length, true),
        selectedColor = defaultColor ?? colors[0];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          selectedColor == other.selectedColor;

  @override
  int get hashCode => id.hashCode ^ selectedColor.hashCode;

  clone(Color selectedColor) => Product(
      id: id,
      images: images,
      colors: colors,
      colorNames: colorNames,
      title: title,
      price: price,
      description: description,
      defaultColor: selectedColor
  );
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    colorNames: [
      "Red",
      "Pink",
      "Light Yellow",
      "White",
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    colorNames: [
      "Red",
      "Pink",
      "Light Yellow",
      "White",
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    colorNames: [
      "Red",
      "Pink",
      "Light Yellow",
      "White",
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    colorNames: [
      "Red",
      "Pink",
      "Light Yellow",
      "White",
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
