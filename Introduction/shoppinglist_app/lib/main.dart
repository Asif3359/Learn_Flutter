import 'package:flutter/material.dart';

class Products {
  const Products({required this.name});
  final String name;
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});
  final List<Products> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Products>{};

  void _handleCartChanged(Products product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onChangeCart: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

typedef CartChangeCallBack = Function(Products product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      {required this.product, required this.inCart, required this.onChangeCart})
      : super(key: ObjectKey(product));

  final Products product;
  final bool inCart;
  final CartChangeCallBack onChangeCart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChangeCart(product, inCart);
      },
      leading: CircleAvatar(
          backgroundColor: Colors.lightBlue, child: Text(product.name[0])),
      title: Text(
        product.name,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: "Shopping List App",
    home: ShoppingList(
      products: [
        Products(name: 'Eggs'),
        Products(name: 'Flour'),
        Products(name: 'Mango'),
      ],
    ),
  ));
}
