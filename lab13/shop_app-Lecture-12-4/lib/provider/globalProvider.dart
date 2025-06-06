// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/products.dart';

class Global_provider extends ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> cartItems = [];
  List<ProductModel> favoriteItems = [];
  int currentIndex = 0;

  List<ProductModel> get products => _products;
  List<ProductModel> get favItems =>
      products.where((item) => item.isFavorite == true).toList();

  void setProduts(List<ProductModel> data) {
    final favIds = products
        .where((p) => p.isFavorite == true && p.id != null)
        .map((p) => p.id!)
        .toSet();

    // шинэ data-д isFavorite дахин оноох
    for (var item in data) {
      if (favIds.contains(item.id)) {
        item.isFavorite = true;
      }
    }
    _products = data;
    notifyListeners();
  }

  void addCartItem(ProductModel data) {
    if (cartItems.any((e) => e.id == data.id))
      cartItems.removeWhere((e) => e.id == data.id);
    else
      cartItems.add(data);
    print("Cart items: ${cartItems.length}");
    notifyListeners();
  }

  void removeCartItem(int id) {
    cartItems.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void incrementCount(ProductModel item) {
    int index = cartItems.indexWhere(
      (cartItem) => cartItem.title == item.title,
    );

    if (index != -1) {
      cartItems[index].count++;
      //addProductCart(cartId!, user!.id!, item.id!, item.count);
      notifyListeners();
    }
  }

  void decrementCount(ProductModel item) {
    int index = cartItems.indexWhere(
      (cartItem) => cartItem.title == item.title,
    );

    if (index != -1) {
      cartItems[index].count--;
      //addProductCart(cartId!, user!.id!, item.id!, item.count);
      notifyListeners();
    }
  }

  void setFavorite(ProductModel item) {
    int index = products.indexWhere((product) => product.title == item.title);

    if (index != -1) {
      products[index].isFavorite = !products[index].isFavorite;
      int favIndex = favoriteItems.indexWhere(
        (favItem) => favItem.title == item.title,
      );

      if (favIndex == -1 && products[index].isFavorite) {
        favoriteItems.add(products[index]);
      } else if (favIndex != -1 && !products[index].isFavorite) {
        favoriteItems.removeAt(favIndex);
      }

      notifyListeners();
    }
  }

  bool isFavorite(ProductModel item) {
    final index = products.indexWhere((p) => p.id == item.id);
    return index != -1 ? products[index].isFavorite : false;
  }

  void changeCurrentIdx(int idx) {
    currentIndex = idx;
    notifyListeners();
  }

  String? username;
  String? password;
  int? _userId;
  int? get userId => _userId;

  // Save token
  //flutter pub add flutter_secure_storage
  Future<void> saveToken(String token) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  // Retrieve token
  Future<String?> getToken() async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  }

  void saveUsernameAndpass(String? name, String? pass) {
    username = name;
    password = pass;
    notifyListeners();
  }

  saveUserId(int id) {
    _userId = id;
  }
}
