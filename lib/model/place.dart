import 'package:flutter/material.dart';

class Place with ChangeNotifier {
  String imagePath;
  String placeName;
  String location;
  double rating;
  bool favourite;
  String description;
  int price;
  var category;

  Place({
    required this.imagePath,
    required this.placeName,
    required this.location,
    required this.rating,
    this.favourite = false,
    required this.description,
    required this.price,
    required this.category,
  });

  void toggledFavourite() {
    favourite = !favourite;
    print("it is real $favourite");
    notifyListeners();
  }
}
