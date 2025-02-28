import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/src/presentation/views/cart/cart.dart';
import 'package:riverpoddemo/src/presentation/views/gallery/gallery.dart';
import 'package:riverpoddemo/src/presentation/views/user/user_list.dart';
import 'package:riverpoddemo/src/providers/cart_notifier.dart';
import 'package:riverpoddemo/src/providers/prod_provider.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(cartNotifierProvider);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GalleryScreen(),
                ));
          },
          icon: Icon(Icons.photo),
          tooltip: "Gallery",
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserList(),
                ));
          },
          icon: Icon(Icons.person),
          tooltip: "Users",
        ),
        IconButton(
            tooltip: 'Filters',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Sort by'),
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        ref.read(productNotifierProvider.notifier).lowToHigh();
                        Navigator.pop(context);
                      },
                      child: const Text('Low to high 🔽'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        ref.read(productNotifierProvider.notifier).highToLow();
                        Navigator.pop(context);
                      },
                      child: const Text('High to low 🔼'),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        ref
                            .read(productNotifierProvider.notifier)
                            .showDiscounted();
                        Navigator.pop(context);
                      },
                      child: const Text('Most discounted \$'),
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.filter_alt_sharp,
              color: Colors.blue,
            )),
        Stack(
          children: [
            IconButton(
              tooltip: "Cart",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartScreen();
                }));
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    itemCount.length.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
