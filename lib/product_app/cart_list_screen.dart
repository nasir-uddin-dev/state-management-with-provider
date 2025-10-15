import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/product_app/product_model.dart';
import 'package:state_management_with_provider/product_app/product_service.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carts'),
        centerTitle: true,
      ),
      body: Consumer<ProductListProvider>(builder: (context, provider, _) {
        return ListView.builder(
            itemCount: provider.cartProductList.length,
            itemBuilder: (context, index) {
              final ProductModel product = provider.cartProductList[index];
              return Container(
                child: Column(
                  children: [
                    Image.network(product.imageUrl,
                        height: 370,
                        width: double.maxFinite,
                        fit: BoxFit.cover),
                    SizedBox(height: 10,),
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Text(product.description),
                    SizedBox(height: 10,),
                  ],
                ),
              );
            });
      }),
    );
  }
}
