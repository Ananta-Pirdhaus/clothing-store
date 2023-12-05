import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable Content Vertical
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 72,
                bottom: 80), // space for fixed navbar at top and bottom
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: ElevatedButton(
                        onPressed: () {
                          // Handle search action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(FontAwesomeIcons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25), //uk stroke search
                      ),
                    ),
                  ),
                ),
                // Banner
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Best Selling Text
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Best Selling',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'roboto',
                      ),
                    ),
                  ),
                ),
              ]
            )
          )
        ]
      )
    );
  }
}
