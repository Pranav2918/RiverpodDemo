import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpoddemo/src/data/models/products.dart';
part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  //Initial value
  @override
  Set<Product> build() {
    return const {};
  }

  //Method to update states

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;

  for (Product p in cartProducts) {
    total += p.price;
  }

  return total;
}
