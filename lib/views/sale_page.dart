import 'package:flutter/material.dart';
import 'package:union_shop/widgets/shared_widgets.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(activePage: 'sale'),
          Expanded(
            child: Center(
              child: Text('SALE! — placeholder page',
                  style: TextStyle(fontSize: 18)),
            ),
          ),
          AppFooter(),
        ],
      ),
    );
  }
}