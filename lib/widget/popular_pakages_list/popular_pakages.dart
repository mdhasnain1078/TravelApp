import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/app_colors/app_colors.dart';
import 'package:traveler/provider/places.dart';
import 'package:intl/intl.dart';

class PopularPackages extends StatefulWidget {
  const PopularPackages({super.key});

  @override
  State<PopularPackages> createState() => _PopularPackagesState();
}

class _PopularPackagesState extends State<PopularPackages> {
  @override
  Widget build(BuildContext context) {
    final places = Provider.of<Places>(context);

    return Column(
      children: places
          .popularPackage()
          .map(
            (place) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 160,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: unratedStar)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              place.imagePath,
                              fit: BoxFit.cover,
                              height: 140,
                              width: 90,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      place.placeName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              place.toggledFavourite();
                                            });
                                          },
                                          icon: place.favourite
                                              ? const Icon(
                                                  Icons.favorite_rounded,
                                                  color: favouriteColor)
                                              : const Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  color: Colors.grey)),
                                    ),
                                  ]),
                              Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'hi-IN', decimalDigits: 0)
                                    .format(place.price),
                                style: const TextStyle(color: favouriteColor),
                              ),
                              Row(
                                children: [
                                  Row(
                                      children:
                                          places.rating(place.rating, 15)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${place.rating}",
                                    style: const TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 210,
                                    child: Text(
                                      "${place.description}...",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
