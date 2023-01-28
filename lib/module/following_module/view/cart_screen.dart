import 'package:flutter/material.dart';
import 'package:football/widgets/custom_appbar.dart';
import 'package:football/widgets/floating_call_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.title});
  final String title;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: Center(
        child: Text(
          'Teams that you are following',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
