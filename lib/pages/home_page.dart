import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_shop_coffee/util/coffee_tile.dart';
import 'package:ui_shop_coffee/util/coffee_type.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List coffeeType = [
    [
      "Cappucino",
      true,
    ],
    [
      "Expresso",
      false,
    ],
    [
      "Latte",
      false,
    ],
    [
      "Black",
      false,
    ],
    [
      "Tea",
      false,
    ],
    [
      "Boba",
      false,
    ],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best Coffee for You",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          // TODO Error Bottom Overflow : resizeToAvoidBottomInset: false
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeTile(
                  coffeeImagePath: 'lib/images/lattee.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '5',
                ),
                CoffeTile(
                  coffeeImagePath: 'lib/images/cappuchino.jpg',
                  coffeeName: 'Cappuchino',
                  coffeePrice: '7',
                ),
                CoffeTile(
                  coffeeImagePath: 'lib/images/milk.jpg',
                  coffeeName: 'Milk',
                  coffeePrice: '3',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
