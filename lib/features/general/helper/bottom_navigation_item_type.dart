import 'package:flutter/material.dart';
import 'package:food_ninja/features/cart/cart_screen.dart';
import 'package:food_ninja/features/chat/chat_screen.dart';
import 'package:food_ninja/features/home/view/pages/home_screen.dart';
import 'package:food_ninja/features/profile/profile_screen.dart';

enum BottomNavigationItemType {
  home,
  profile,
  cart,
  chat,
}

extension BottomNavigationItemData on BottomNavigationItemType {
  String get bottomTitle {
    switch (this) {
      case BottomNavigationItemType.home:
        return 'Home';
      case BottomNavigationItemType.profile:
        return 'Profile';
      case BottomNavigationItemType.cart:
        return 'Cart';
      case BottomNavigationItemType.chat:
        return 'chat';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomNavigationItemType.home:
        return Icons.home;
      case BottomNavigationItemType.profile:
        return Icons.person;
      case BottomNavigationItemType.cart:
        return Icons.shopping_cart_rounded;
      case BottomNavigationItemType.chat:
        return Icons.chat;
      default:
        return Icons.home;
    }
  }

  int get index {
    switch (this) {
      case BottomNavigationItemType.home:
        return 0;
      case BottomNavigationItemType.cart:
        return 1;
      case BottomNavigationItemType.profile:
        return 2;
      case BottomNavigationItemType.chat:
        return 3;
      default:
        return 0;
    }
  }

  Widget getScreen(BuildContext context) {
    switch (this) {
      case BottomNavigationItemType.home:
        return const HomeScreen();
      case BottomNavigationItemType.profile:
        return const ProfileScreen();
      case BottomNavigationItemType.cart:
        return const CartScreen();
      case BottomNavigationItemType.chat:
        return const ChatScreen();
      default:
        return Container();
    }
  }

  static BottomNavigationItemType getTypeFromIndex(
      int index, BuildContext context) {
    if (index == BottomNavigationItemType.home.index) {
      return BottomNavigationItemType.home;
    } else if (index == BottomNavigationItemType.profile.index) {
      return BottomNavigationItemType.profile;
    } else if (index == BottomNavigationItemType.cart.index) {
      return BottomNavigationItemType.cart;
    } else if (index == BottomNavigationItemType.chat.index) {
      return BottomNavigationItemType.chat;
    } else {
      return BottomNavigationItemType.home;
    }
  }
}
