// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shop_app/models/carts.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/services/httpService.dart';

class MyRepository {
  final HttpService httpService = HttpService();

  MyRepository();
  Future<List<ProductModel>> fetchProductData() async {
    try {
      var jsonData = await httpService.getData('products', null);
      // print(jsonData);
      List<ProductModel> data = ProductModel.fromList(jsonData);
      return data;
    } catch (e) {
      // Handle errors
      return Future.error(e.toString());
    }
  }

  Future<String> login(String username, String password) async {
    try {
      dynamic data = {"username": username, "password": password};
      var jsonData = await httpService.postData('auth/login', null, data);
      return jsonData["token"];
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //nemsn
  Future<List<Cart>> getCartForUser(int userId, String token) async {
    final cartJson = await httpService.getData('carts/user/$userId', token);
    final list = cartJson as List<dynamic>;
    return list.map((j) => Cart.fromJson(j as Map<String, dynamic>)).toList();
  }

  Future<int> getUserId(String? name, String? password) async {
    final jsonStr = await rootBundle.loadString('assets/users.json');
    final List<dynamic> users = jsonDecode(jsonStr);
    final user = users.firstWhere(
      (u) => u["username"] == name && u["password"] == password,
      orElse: () => null,
    );
    return user["id"] as int;
  }

  Future<void> deleteCartItem(int id, String token) async {
    final response = await httpService.deleteData('carts/$id', token, null);
    print("Server response (deleteCartItem): Success for ID $id: $response");
  }

  Future<void> addCartItem({
    required int userId,
    required int productId,
    required String token,
  }) async {
    final body = {
      'userId': userId,
      'products': [
        {
          'id': productId,
        }
      ]
    };

    final response = await httpService.postData('carts', token, body);
    print("👍🏻addCartItem response: $response");
  }
}
