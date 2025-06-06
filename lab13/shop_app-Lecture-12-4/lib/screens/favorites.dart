import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';

import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/widgets/ProductView.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of(context, AppLocalizations);
    return Consumer<Global_provider>(builder: (context, provider, child) {
      return SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            loc.favorites,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(223, 37, 37, 37),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
          itemCount: provider.favItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductViewShop(provider.favItems[index], "cartIcon");
          },
        )),
      ]));
    });
  }
}
