import 'package:flutter/material.dart';
import 'package:football/widgets/custom_appbar.dart';
import 'package:football/widgets/floating_call_button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.title});
  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: HomeAppBar()),
      body: Center(
        child: Text(
          'Live Broadcasting',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: const FloatingCallButton(),
    );
  }
}
