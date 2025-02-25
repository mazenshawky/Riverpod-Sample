import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/models/product.dart';
import 'package:riverpod_sample/providers/cart_notifier.dart';
import 'package:riverpod_sample/providers/products_provider.dart';

import 'package:riverpod_sample/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> allProducts = ref.watch(productsProvider);
    final Set<Product> cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withValues(alpha: 0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  Text(allProducts[index].title),
                  Text('£${allProducts[index].price}'),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {},
                      child: const Text('Remove'),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add to Cart'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
