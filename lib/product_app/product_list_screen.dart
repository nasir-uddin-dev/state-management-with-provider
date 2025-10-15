import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/product_app/cart_list_screen.dart';
import 'package:state_management_with_provider/product_app/product_model.dart';
import 'package:state_management_with_provider/product_app/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Mobile',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Shops',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))
        ])),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Consumer<ProductListProvider>(builder: (context, provider, _) {
              return Badge(
                label: Text(provider.cartItemCount.toString()),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CartListScreen()));
                    },
                    icon: Icon(Icons.shopping_cart)),
              );
            }),
          )
        ],
      ),
      body: Consumer<ProductListProvider>(
          builder: (context, productListProvider, _) {
        return GridView.builder(
            itemCount: productListProvider.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              final ProductModel product =
                  productListProvider.productList[index];
              final bool alreadyInCart =
                  productListProvider.isAlreadyCarted(product.id);

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      product.imageUrl,
                      height: 80,
                    ),
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(product.price),
                    FilledButton(
                      onPressed: () {
                        if (alreadyInCart) {
                          productListProvider.removeFromCart(product.id);
                        } else {
                          productListProvider.addToCart(product);
                        }
                      },
                      child: Text(alreadyInCart ? 'Remove' : 'Add to Cart'),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
