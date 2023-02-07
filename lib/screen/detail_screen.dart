import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:traveler/app_colors/app_colors.dart';
import '../provider/places.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  static const String routeName = "/detailScreen";

  @override
  Widget build(BuildContext context) {
    final placeInformation =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final places = Provider.of<Places>(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              placeInformation["imagePath"],
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 270,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        placeInformation["placeName"],
                        style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Theme.of(context).primaryColor),
                          Text(placeInformation["location"],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 400,
                    child: Text(placeInformation["description"],
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                          children:
                              places.rating(placeInformation["rating"], 20)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${placeInformation["rating"]}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 0).format(placeInformation["price"])}/persion",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500)),
                      ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Your ticket is book")));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: starColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              fixedSize: const Size(103, 45),
                              elevation: 0),
                          child: Text(
                            "Book Now",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
