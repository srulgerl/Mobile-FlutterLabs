// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/screens/bags.dart';
import 'package:shop_app/screens/favorites.dart';
import 'package:shop_app/screens/profile.dart';
import 'package:shop_app/screens/shopping.dart';
import '../l10n/generated/app_localizations.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // List of pages for navigation
  List<Widget> Pages = [
    const ShopPage(),
    Basket(),
    const Favorites(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Consumer<Global_provider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Pages[provider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: provider.currentIndex,
            onTap: provider.changeCurrentIdx,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.shop),
                label: localizations.shop,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag),
                label: localizations.basket,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: localizations.favorites,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: localizations.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
