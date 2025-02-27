import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpoddemo/src/data/models/products.dart';
part 'prod_provider.g.dart';

const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'Groovy Shorts',
      price: 12,
      discount: 15,
      image: 'assets/images/shorts.png'),
  Product(
      discount: 8,
      id: '2',
      title: 'Karate Kit',
      price: 34,
      image: 'assets/images/karati.png'),
  Product(
      discount: 25,
      id: '3',
      title: 'Denim Jeans',
      price: 54,
      image: 'assets/images/jeans.png'),
  Product(
      discount: 55,
      id: '4',
      title: 'Red Backpack',
      price: 14,
      image: 'assets/images/backpack.png'),
  Product(
      discount: 35,
      id: '5',
      title: 'Drum & Sticks',
      price: 29,
      image: 'assets/images/drum.png'),
  Product(
      discount: 10,
      id: '6',
      title: 'Blue Suitcase',
      price: 44,
      image: 'assets/images/suitcase.png'),
  Product(
      discount: 18,
      id: '7',
      title: 'Roller Skates',
      price: 52,
      image: 'assets/images/skates.png'),
  Product(
      discount: 29,
      id: '8',
      title: 'Electric Guitar',
      price: 79,
      image: 'assets/images/guitar.png'),
];

@riverpod
class ProductNotifier extends _$ProductNotifier {
  bool _isLowToHigh = false;
  bool _isHighToLow = false;
  bool _isDiscount = false;

  //Initial value
  @override
  List<Product> build() {
    return allProducts;
  }

  void lowToHigh() {
    _isLowToHigh = true;
    if (_isLowToHigh) {
      state = [...state]..sort((a, b) => a.price.compareTo(b.price));
    } else {
      state = allProducts;
    }
  }

  void highToLow() {
    _isHighToLow = true;
    if (_isHighToLow) {
      state = [...state]..sort((a, b) => b.price.compareTo(a.price));
    } else {
      state = allProducts;
    }
  }

  void showDiscounted(){
    _isDiscount = true;
    if (_isDiscount) {
      state = [...state]..sort((a, b) => b.discount.compareTo(a.discount));
    } else {
      state = allProducts;
    }
  }


}
