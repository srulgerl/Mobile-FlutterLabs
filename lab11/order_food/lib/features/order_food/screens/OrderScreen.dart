import 'package:flutter/material.dart';
import 'package:order_food/features/order_food/widgets/MenuList.dart';
import 'package:order_food/features/order_food/models/customer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Customer? customer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    customer = ModalRoute.of(context)?.settings.arguments as Customer?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: Column(
        children: [
          Text("Захиалгууд", style: TextStyle(fontSize: 20)),
          Expanded(
            child:
                customer!.items.isEmpty
                    ? const Center(
                      child: Text(
                        'Захиалсан зүйл байхгүй байна',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                    : MenuList(items: customer!.items, dismissible: true),
          ),
        ],
      ),
    );
  }
}
