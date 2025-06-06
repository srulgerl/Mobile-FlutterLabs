// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repository/repository.dart';
import 'package:shop_app/widgets/ProductView.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  MyRepository repository = MyRepository();

  Future<List<ProductModel>> _getProductData(BuildContext context) async {
    final provider = Provider.of<Global_provider>(context, listen: false);

    if (provider.products.isEmpty) {
      try {
        final data = await repository.fetchProductData();
        provider.setProduts(data);

        return provider.products;
      } catch (e) {
        throw Exception("Aлдаа гарлаа: $e");
      }
    }
    return provider.products;
  }

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of(context, AppLocalizations)!;
    return FutureBuilder<List<ProductModel>>(
      future: _getProductData(context),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    loc.shop,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(223, 37, 37, 37),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) =>
                          ProductViewShop(snapshot.data![index], "favIcon"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ));
        } else {
          return const Center(
            child: SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
