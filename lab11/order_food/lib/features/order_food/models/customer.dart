import 'package:flutter/material.dart';
import 'item.dart';

class Customer {
  Customer({
    required this.userId,
    required this.name,
    required this.gmail,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];

  final int userId;
  final String name;
  final ImageProvider imageProvider;
  final String gmail;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(
      0,
      (prev, item) => prev + item.totalPriceCents,
    );
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
