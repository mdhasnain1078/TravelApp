import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveler/provider/places.dart';

import 'place_card.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final places = Provider.of<Places>(context).places;

    return SizedBox(
      height: 300,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: (ctx, i) {
            return ChangeNotifierProvider.value(
              value: places[i],
              child: const PlaceCard(),
            );
          }),
    );
  }
}
