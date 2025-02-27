import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/providers/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          height: double.infinity,
          width: 380.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black38)
          ),
          child: cartProducts.isEmpty ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("You cart is empty"),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Go back")),
              )
            ],
          ) : Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: cartProducts
                        .map(
                          (product) => Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.black)),
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  product.image,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                                Text(product.title),
                                Spacer(),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: Center(
                                    child: Text(
                                      "${product.price.toString()} \$",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.only(left: 5.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: IconButton(
                                      onPressed: () {
                                        ref
                                            .read(cartNotifierProvider.notifier)
                                            .removeProduct(product);
                                      },
                                      icon: Icon(Icons.remove)),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total price"),
                      Text("${total.toString()} \$")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
