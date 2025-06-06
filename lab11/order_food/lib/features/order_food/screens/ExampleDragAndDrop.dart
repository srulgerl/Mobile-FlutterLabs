import "package:flutter/material.dart";
import 'package:order_food/features/order_food/models/customer.dart';
import 'package:order_food/features/order_food/models/item.dart';
import "package:order_food/features/order_food/widgets/CustomerCart.dart";
import "package:order_food/features/order_food/widgets/menuList.dart";

const List<Item> _items = [
  Item(
    name: 'Spinach Pizza',
    totalPriceCents: 1299,
    uid: '1',
    imageProvider: NetworkImage(
      'https://docs.flutter.devs/cookbook/img-files/effects/split-check/Food1.jpg',
    ),
  ),
  Item(
    name: 'Veggie Delight',
    totalPriceCents: 799,
    uid: '2',
    imageProvider: NetworkImage(
      'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Food2.jpg',
    ),
  ),
  Item(
    name: 'Chicken Parmesan',
    totalPriceCents: 1499,
    uid: '3',
    imageProvider: NetworkImage(
      'https://docs.flutter.dev/cookbook/img-files/effects/split-check/Food3.jpg',
    ),
  ),
  Item(
    name: 'Cheeseburger',
    totalPriceCents: 1099,
    uid: '4',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1550547660-d9450f859349',
    ),
  ),
  Item(
    name: 'Caesar Salad',
    totalPriceCents: 699,
    uid: '5',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1607532941433-304659e8198a?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhZXNhciUyMHNhbGFkfGVufDB8fDB8fHww',
    ),
  ),
  Item(
    name: 'Taco Plate',
    totalPriceCents: 999,
    uid: '6',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ),
  Item(
    name: 'Pasta Alfredo',
    totalPriceCents: 1399,
    uid: '7',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1662197480393-2a82030b7b83?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8UGFzdGElMjBBbGZyZWRvfGVufDB8fDB8fHww',
    ),
  ),
  Item(
    name: 'Sushi Platter',
    totalPriceCents: 1899,
    uid: '8',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1570877215023-229052e10c34?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8U3VzaGklMjBQbGF0dGVyfGVufDB8fDB8fHww',
    ),
  ),
  Item(
    name: 'Grilled Salmon',
    totalPriceCents: 1699,
    uid: '9',
    imageProvider: NetworkImage(
      'https://media.istockphoto.com/id/1879865657/photo/grilled-salmon-fillet-with-vegetables-broccoli-cherry-iceberg-lettuce-spices-and-herbs.webp?a=1&b=1&s=612x612&w=0&k=20&c=qFBvkBldHedRwAtUjh-kOHQSVzcLqE44ivfhqBk4-hc=',
    ),
  ),
  Item(
    name: 'Chocolate Cake',
    totalPriceCents: 599,
    uid: '10',
    imageProvider: NetworkImage(
      'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
    ),
  ),
];

final List<Customer> _people = [
  Customer(
    userId: 1,
    gmail: "saruul@gmail.com",
    name: 'Saruul',
    imageProvider: const NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Avatar1.jpg',
    ),
  ),
  Customer(
    userId: 2,
    gmail: "Nathan@gmail.com",
    name: 'Nathan',
    imageProvider: const NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Avatar2.jpg',
    ),
  ),
  Customer(
    userId: 3,
    gmail: "Emilio",
    name: 'Emilio',
    imageProvider: const NetworkImage(
      'https://docs.flutter.dev'
      '/cookbook/img-files/effects/split-check/Avatar3.jpg',
    ),
  ),
];

@immutable
class ExampleDragAndDrop extends StatefulWidget {
  const ExampleDragAndDrop({super.key});

  @override
  State<ExampleDragAndDrop> createState() => _ExampleDragAndDropState();
}

class _ExampleDragAndDropState extends State<ExampleDragAndDrop>
    with TickerProviderStateMixin {
  void _itemDroppedOnCustomerCart({
    required Item item,
    required Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  Customer? loggedCustomer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loggedCustomer = ModalRoute.of(context)?.settings.arguments as Customer?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      title: Text(
        'Order Food',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 36,
          color: const Color(0xFFF64209),
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      elevation: 0,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(child: MenuList(items: _items, dismissible: false)),
              _buildPeopleRow(),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildMenuList() {
  //   return ListView.separated(
  //     padding: const EdgeInsets.all(16),
  //     itemCount: _items.length,
  //     separatorBuilder: (context, index) {
  //       return const SizedBox(height: 12);
  //     },
  //     itemBuilder: (context, index) {
  //       final item = _items[index];
  //       return _buildMenuItem(item: item);
  //     },
  //   );
  // }

  // Widget _buildMenuItem({required Item item}) {
  //   return LongPressDraggable<Item>(
  //     data: item,
  //     dragAnchorStrategy: pointerDragAnchorStrategy,
  //     feedback: DraggingListItem(
  //       dragKey: _draggableKey,
  //       photoProvider: item.imageProvider,
  //     ),
  //     child: MenuListItem(
  //       name: item.name,
  //       price: item.formattedTotalItemPrice,
  //       photoProvider: item.imageProvider,
  //     ),
  //   );
  // }

  Widget _buildPeopleRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed:
                () => Navigator.pushNamed(
                  context,
                  '/order',
                  arguments: loggedCustomer,
                ),
            child: _buildPersonWithDropZone(loggedCustomer!),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonWithDropZone(Customer customer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: DragTarget<Item>(
        builder: (context, candidateItems, rejectedItems) {
          return CustomerCart(
            hasItems: customer.items.isNotEmpty,
            highlighted: candidateItems.isNotEmpty,
            customer: customer,
          );
        },
        onAcceptWithDetails: (details) {
          _itemDroppedOnCustomerCart(item: details.data, customer: customer);
        },
      ),
    );
  }
}
