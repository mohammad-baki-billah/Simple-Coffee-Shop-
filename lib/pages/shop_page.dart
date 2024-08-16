import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/modes/coffee.dart';
import 'package:coffee_shop/modes/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
  // Access the CoffeeShop provider
  final coffeeShop = Provider.of<CoffeeShop>(context, listen: false);

  // Check if the item is already in the cart
  if (coffeeShop.userCart.contains(coffee)) {
    // Show a dialog indicating the item is already in the cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'This Item already added to cart',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor:  Colors.grey[400],
      ),
      useRootNavigator: true,
      useSafeArea: true,
      barrierDismissible: true,
    );

    // Dismiss the dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  } else {
    // Add to cart
    coffeeShop.addItemToCart(coffee);

    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Successfully added to cart',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.grey[400],
      ),
      useRootNavigator: true,
      useSafeArea: true,
      barrierDismissible: true,
    );

    // Dismiss the dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //meading messages
              const Text(
                'How would like your coffee?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),

              //list of coffees to buy
              Expanded(
                  child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                  // get individual coffee
                  Coffee eachCoffee = value.coffeeShop[index];

                  // return the tile for this coffee
                  return CoffeeTile(
                    coffee: eachCoffee,
                    icon: Icon(Icons.add),
                    onPressed: () => addToCart(eachCoffee),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
