import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/presentation/widgets/cart_icon.dart';
import 'package:riverpoddemo/src/providers/cart_notifier.dart';
import 'package:riverpoddemo/src/providers/prod_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productNotifierProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 380.0,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: allProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 200.0),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        allProducts[index].image,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10.0),
                      Text(allProducts[index].title),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${allProducts[index].price.toString()} \$."),
                          const SizedBox(width: 10.0),
                          Text(
                            "(${allProducts[index].discount.toString()}%)",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      if (cartProducts
                          .map((e) => e.id)
                          .contains(allProducts[index].id))
                        TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .removeProduct(allProducts[index]);
                          },
                          child: Text("Remove"),
                        ),
                      if (!cartProducts
                          .map((e) => e.id)
                          .contains(allProducts[index].id))
                        TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(allProducts[index]);
                          },
                          child: Text("Add to cart"),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
