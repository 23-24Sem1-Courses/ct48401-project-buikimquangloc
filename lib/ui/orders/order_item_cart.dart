import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;
  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => OrderItemCardState();
}

class OrderItemCardState extends State<OrderItemCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderSummary() {
    return ListTile(
      title: Text('\$${widget.order.amount}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: (){
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      height: min(widget.order.productCount *20.0 + 10, 100),
      child:  ListView(
        children: widget.order.product
          .map(
            (prod) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  prod.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${prod.soluong}x \$${prod.gia}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                )
              ],
            ),
          )
          .toList(),
      ),
    );
  }
}
