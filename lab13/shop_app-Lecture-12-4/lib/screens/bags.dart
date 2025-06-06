// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repository/repository.dart';

class Basket extends StatelessWidget {
  final repo = MyRepository();

  Basket({super.key});

  Future<void> _deleteCart(BuildContext context, int productId) async {
    final provider = Provider.of<Global_provider>(context, listen: false);
    final token = await provider.getToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Токен олдсонгүй")),
      );
      return;
    }

    try {
      await repo.deleteCartItem(productId, token);
      provider.removeCartItem(productId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Бараа устлаа (ID: $productId)")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Устахад алдаа гарлаа: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of(context, AppLocalizations);
    return Consumer<Global_provider>(
      builder: (context, provider, child) {
        double total = provider.cartItems.fold(
          0,
          (sum, item) => sum + (item.price! * item.count),
        );
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    loc.basket,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(223, 37, 37, 37),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                provider.cartItems.isEmpty
                    ? Center(
                        child: Text(
                          loc.basketState,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: provider.cartItems.length,
                          itemBuilder: (context, index) {
                            final product = provider.cartItems[index];
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1.0,
                                ),
                              ),
                              child: Dismissible(
                                background: Container(color: Colors.red),
                                key: ValueKey<ProductModel>(product),
                                onDismissed: (DismissDirection direction) {
                                  _deleteCart(context, product.id!);
                                },
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  leading: Image.network(
                                    product.image!,
                                    width: 50,
                                    height: 50,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.error),
                                  ),
                                  title: Text(product.title ?? loc.product),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  if (product.count > 1) {
                                                    provider.decrementCount(
                                                        product);
                                                  } else {
                                                    _deleteCart(
                                                        context, product.id!);
                                                  }
                                                },
                                              ),
                                              Text('${product.count}'),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  provider
                                                      .incrementCount(product);
                                                },
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$${(product.price! * product.count).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${loc.total}\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(loc.paymentSuccess)),
                    );
                  },
                  child: Text(loc.buy),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
