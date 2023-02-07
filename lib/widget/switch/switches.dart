import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/app_colors/app_colors.dart';
import 'package:traveler/provider/places.dart';
import 'my_switch.dart';

class Switches extends StatefulWidget {
  const Switches({
    Key? key,
  }) : super(key: key);

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  bool isSelectedBeach = true;
  bool isSelectedMountain = false;

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<Places>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MySwitch(
          onTap: () {
            places.beachPlaces();
            setState(() {
              isSelectedBeach = true;
              isSelectedMountain = false;
            });
          },
          image: Image.asset(
            "assets/image/beach.png",
            height: 60,
            width: 60,
          ),
          title: "Beach",
          borderColor: isSelectedBeach ? buttonBorderColor : unratedStar,
        ),
        const SizedBox(
          width: 10,
        ),
        MySwitch(
          onTap: () {
            places.mountainPlaces();
            setState(() {
              isSelectedBeach = false;
              isSelectedMountain = true;
              print("OK");
            });
          },
          image: Image.asset(
            "assets/image/mountain.png",
            height: 60,
            width: 60,
          ),
          title: "Mountain",
          borderColor: isSelectedMountain ? buttonBorderColor : unratedStar,
        )
      ],
    );
  }
}
