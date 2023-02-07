import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/model/place.dart';
import 'package:traveler/provider/places.dart';
import 'package:traveler/screen/detail_screen.dart';

import '../../app_colors/app_colors.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({super.key});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    final place = Provider.of<Place>(context);
    final places = Provider.of<Places>(context);
    return
        // Container(
        //     padding: const EdgeInsets.all(10),
        //     height: 300,
        //     width: 250,
        //     child: GridTile(
        //         footer: Text(place.placeName),
        //         child: Card(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(30)),
        //           child: ClipRRect(
        //               borderRadius: BorderRadius.circular(30), child: place.image),
        //         )));
        InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: {
        "imagePath": place.imagePath,
        "placeName": place.placeName,
        "description": place.description,
        "price": place.price,
        "location": place.location,
        "rating": place.rating
      }),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
            alignment: Alignment.bottomRight,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                height: 300,
                width: 220,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        place.imagePath,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                bottom: 220,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: IconButton(
                      onPressed: () {
                        place.toggledFavourite();
                      },
                      icon: place.favourite
                          ? const Icon(Icons.favorite_rounded,
                              color: favouriteColor)
                          : const Icon(Icons.favorite_outline_rounded,
                              color: Colors.grey)),
                ),
              ),
              Positioned(
                top: 170,
                right: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.placeName,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Urbanist"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(place.location,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontFamily: "Urbanist")),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: places.rating(place.rating, 20),
                        ),
                        Text(
                          "${place.rating}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
