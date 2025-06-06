import 'package:flutter/material.dart';
import 'package:order_food/features/order_food/widgets/MenuListItem.dart';
import "../models/item.dart";
import "package:order_food/features/order_food/widgets/DraggingListItem.dart";

class MenuList extends StatefulWidget {
  final List<Item> items;
  final bool dismissible;

  const MenuList({super.key, required this.items, this.dismissible = false});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final GlobalKey _draggableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.items.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        final item = widget.items[index];
        if (widget.dismissible) {
          return Dismissible(
            key: ValueKey(item),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Устгах",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            onDismissed:
                (direction) => setState(() => widget.items.removeAt(index)),
            child: MenuListItem(
              name: item.name,
              price: item.formattedTotalItemPrice,
              photoProvider: item.imageProvider,
            ),
          );
        } else {
          return LongPressDraggable<Item>(
            data: item,
            dragAnchorStrategy: pointerDragAnchorStrategy,
            feedback: DraggingListItem(
              dragKey: _draggableKey,
              photoProvider: item.imageProvider,
            ),
            child: MenuListItem(
              name: item.name,
              price: item.formattedTotalItemPrice,
              photoProvider: item.imageProvider,
            ),
          );
        }
      },
    );
  }
}
