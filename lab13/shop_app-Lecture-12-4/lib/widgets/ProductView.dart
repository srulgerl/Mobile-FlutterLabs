// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/l10n/generated/app_localizations.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/provider/globalProvider.dart';
import 'package:shop_app/repository/repository.dart';
import 'package:shop_app/screens/product_detail.dart';

// ignore: must_be_immutable
class ProductViewShop extends StatelessWidget {
  final ProductModel data;
  final String icon;

  ProductViewShop(this.data, this.icon, {super.key});
  _onTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Product_detail(data)));
  }

  MyRepository repo = MyRepository();

  @override
  Widget build(BuildContext context) {
    return Consumer<Global_provider>(builder: (context, provider, child) {
      return InkWell(
          onTap: () => {_onTap(context)},
          child: Stack(clipBehavior: Clip.none, children: [
            Card(
              clipBehavior: Clip.none,
              elevation: 4.0,
              margin: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Container(
                    height: 120.0,
                    width: 120.0, // Adjust the height based on your design
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data.image!),
                      ),
                    ),
                  ),

                  icon == "favIcon"
                      ? Expanded(
                          child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    data.title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )),
                                  const SizedBox(width: 5.0),
                                  TextButton(
                                      onPressed: () => {},
                                      child: const Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                              //category
                              const SizedBox(height: 8.0),
                              Text(
                                data.category!.capitalizeEachWord(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //rating
                                    Row(children: [
                                      RatingBarIndicator(
                                        rating: data.rating?.rate ?? 0.0,
                                        itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber),
                                        itemSize: 18.0,
                                      ),
                                      Text(
                                        '(${data.rating?.count ?? 0})',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ]),
                                    //price
                                    const SizedBox(height: 8.0),
                                    Text(
                                      '${data.price!.toStringAsFixed(2)}\$',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ))
                      : Expanded(
                          child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Text(
                                    data.title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )),
                                  const SizedBox(width: 5.0),
                                  TextButton(
                                    onPressed: () =>
                                        {provider.setFavorite(data)},
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                data.category!.capitalizeEachWord(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(children: [
                                Text(
                                  '${data.price?.toStringAsFixed(2)}\$',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(width: 15.0),
                                RatingBarIndicator(
                                  rating: data.rating!.rate ?? 0.0,
                                  itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber),
                                  itemSize: 18.0,
                                ),
                                Text(
                                  '(${data.rating?.count!})',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),

                                //price
                                const SizedBox(height: 8.0),
                              ]),
                            ],
                          ),
                        ))
                ],
              ),
            ),
            icon == "favIcon"
                ? Positioned(
                    bottom: -8,
                    right: 8,
                    child: FloatingActionButton.small(
                        onPressed: () {
                          provider.setFavorite(data);
                        },
                        backgroundColor: Colors.white,
                        child: Icon(
                          provider.isFavorite(data)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 18.0,
                        )))
                : Positioned(
                    bottom: -8,
                    right: 8,
                    child: FloatingActionButton.small(
                        onPressed: () async {
                          try {
                            String? token = await provider.getToken();
                            if (token != null) {
                              repo.addCartItem(
                                  userId: provider.userId as int,
                                  productId: data.id as int,
                                  token: token);
                              provider.addCartItem(data);
                            }
                          } catch (e) {
                            SnackBar(content: Text("Aldaa$e"));
                          }
                        },
                        backgroundColor: Colors.red,
                        child: const Icon(
                          Icons.card_travel,
                          color: Colors.white,
                          size: 18.0,
                        )))
          ]));

      // Row(
      //   children: [
      //     Box(
      //       height: width /3,
      //       width: width,
      //       margin: EdgeInsets.only(right: 10),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(8),
      //         image: DecorationImage(image: NetworkImage(data.image!), fit: BoxFit.fitHeight)
      //       ),
      //     ),
      //      Column(
      //       children: [
      //         Text(data.title==null?"": data.title!),
      //         Text(data.category==null?"": data.category!),
      //         Text('${data.price}'),
      //       ],
      //     )

      //   ],
      // );
    });
  }
}

extension StringCasingExtension on String {
  String capitalizeEachWord() {
    return split(' ')
        .map((word) =>
            word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }
}
