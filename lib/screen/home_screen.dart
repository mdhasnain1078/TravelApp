import 'package:flutter/material.dart';
import '../widget/place_list/category_List.dart';
import '../widget/popular_pakages_list/popular_pakages.dart';
import '../widget/searchField/search_field.dart';
import '../widget/switch/switches.dart';
import '../widget/title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Hello, Hasnain",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        )
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.light))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 8, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Where do you",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("want to explore today?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30))
                  ],
                ),
              ),
              const SearchField(),
              const TitleRow(
                title: 'Choose Category',
              ),
              const Switches(),
              const CategoryList(),
              const TitleRow(
                title: 'Popular Package',
              ),
              const PopularPackages()
            ],
          ),
        ),
      ),
    );
  }
}
