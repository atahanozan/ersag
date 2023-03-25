import 'package:ersag/projectpages/uyeol.dart';
import 'package:flutter/material.dart';

class OrdersPageView extends StatefulWidget {
  const OrdersPageView({Key? key}) : super(key: key);

  @override
  State<OrdersPageView> createState() => _OrdersPageViewState();
}

class _OrdersPageViewState extends State<OrdersPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Siparişler"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UyeOlPageView()));
              },
              icon: const Icon(Icons.plus_one))
        ],
      ),
    );
  }
}
