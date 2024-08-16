import 'package:coffee_shop/modes/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // Coffee for sale list
  final List<Coffee> _coffeeShop = [
    Coffee(
        name: 'Long Black', price: 4.5, image: 'lib/images/long_coffee.png'),
    Coffee(name: 'latte', price: 4.99, image: 'lib/images/latte_coffee.png'),
    Coffee(
        name: 'Espresso',
        price: 4.0,
        image: 'lib/images/expresso_coffee.png'),
    Coffee(
        name: 'Iced Coffee', price: 4.9, image: 'lib/images/iced_coffee.png'),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _coffeeShop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
