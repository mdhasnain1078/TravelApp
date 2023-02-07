import 'package:flutter/material.dart';
import 'package:traveler/model/category_enum.dart';
import 'package:traveler/model/place.dart';

class Places with ChangeNotifier {
  final List<Place> _places = [
    Place(
      placeName: "Kuta Beach",
      location: "Bali, Indonesia",
      rating: 4.2,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.beach,
      imagePath: "assets/image/kutaBeachPotrait.png",
    ),
    Place(
      placeName: "Baga Beach",
      location: "Goa , India",
      rating: 4.8,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.beach,
      imagePath: "assets/image/bagaBeachPotrait.png",
    ),
    Place(
      placeName: "Ajanta Beach",
      location: "Goa , India",
      rating: 3.8,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.beach,
      imagePath: "assets/image/ajanta_bech.png",
    ),
    Place(
      placeName: "Mountain 1",
      location: "Sejan , jithodia",
      rating: 4.8,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.mountain,
      imagePath: "assets/image/mountain1.jpg",
    ),
    Place(
      placeName: "Mountain 2",
      location: "Sejan , jithodia",
      rating: 4.2,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.mountain,
      imagePath: "assets/image/mountain2.jpg",
    ),
    Place(
      placeName: "Mountain 3",
      location: "Sejan , jithodia",
      rating: 3.8,
      description:
          "One of the most happening beaches in Goa, Baga Beach is where you will find water sports,fine diningrestaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
      price: 15000,
      category: Caterory.mountain,
      imagePath: "assets/image/mountain3.jpg",
    )
  ];

  List<Place>? placeList;

  List<Place> get places {
    return placeList ?? _places;
  }

  List<Icon> rating(double rating, double size) {
    List<Icon> ratings = [];
    for (var i = 0; i < 5; i++) {
      if (rating.toInt() > i) {
        ratings.add(Icon(
          Icons.star_rounded,
          size: size,
          color: Colors.amber,
        ));
      } else {
        ratings.add(Icon(
          Icons.star_rounded,
          size: size,
          color: Colors.grey,
        ));
      }
    }
    return ratings;
  }

  List<Place> popularPackage() {
    return places.where((place) => place.rating >= 4).toList();
  }

  void beachPlaces() {
    placeList =
        _places.where((place) => place.category == Caterory.beach).toList();
    notifyListeners();
  }

  void mountainPlaces() {
    placeList =
        _places.where((place) => place.category == Caterory.mountain).toList();
    notifyListeners();
  }
}
