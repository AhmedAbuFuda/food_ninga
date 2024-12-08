import 'package:flutter/material.dart';
import 'package:food_ninja/features/general/helper/bottom_navigation_item_type.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({
    super.key,
  });

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationItemType> bottomNavigationItems = [];
    bottomNavigationItems.addAll(BottomNavigationItemType.values);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8, 20))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: GNav(
            tabMargin: const EdgeInsets.all(8),
            backgroundColor: Colors.white,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            activeColor: Theme.of(context).primaryColor,
            tabBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: bottomNavigationItems
                .map((e) => GButton(
                      icon: e.icon,
                      text: e.bottomTitle,
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ))
                .toList(),
            onTabChange: (value) {
              setState(() {
                myCurrentIndex = value;
              });
            },
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: bottomNavigationItems[myCurrentIndex].getScreen(context)),
    );
  }
}
