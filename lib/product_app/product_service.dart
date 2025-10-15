import 'package:flutter/material.dart';
import 'package:state_management_with_provider/product_app/product_model.dart';

class ProductListProvider extends ChangeNotifier {
  final List<ProductModel> _productList = [
    ProductModel(
        id: 1,
        name: 'iPhone 17',
        price: 'Tk 168,500',
        description:
            "The iPhone 17 is designed to provide excellent performance, intelligent"
            " features, and dependable everyday usability, making it one of Apple's"
            " best-balanced smartphones to date. The device is powered by the"
            " sophisticated A19 processor, which has a 6-core CPU with two performance"
            " and four efficiency cores, a 5-core GPU with Neural Accelerators",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/apple/iphone-17/iphone-17-lavender-500x500.webp"),
    ProductModel(
        id: 2,
        name: 'Samsung Galaxy A26 5G',
        price: 'Tk 35,400',
        description: "The Samsung Galaxy A26 5G provides high-speed performance, vibrant visuals, and long-lasting durability. It has a large 6.7-inch Super AMOLED display with a smooth 120 Hz refresh rate and a resolution of 1080 x 2340 pixels, which provides brilliant colors and crisp details. Corning Gorilla Glass Victus+ protects the screen from scratches and accidental drops",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/samsung/galaxy-a26/galaxy-a26-black-02-500x500.webp"),
    ProductModel(
        id: 3,
        name: 'OnePlus Nord CE4 Lite 5G',
        price: 'Tk 22,750',
        description: "The OnePlus Nord CE4 Lite 5G combines sleek design, smooth performance, and a long-lasting battery. It features a 6.67-inch AMOLED FHD+ display with a 120Hz refresh rate, 2100 nits peak brightness, and HDR streaming support for Netflix and Prime Video.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/oneplus/nord-ce4-lite/nord-ce4-lite-mega-blue-001-500x500.webp"),
    ProductModel(
        id: 4,
        name: 'OPPO Reno12 F 5G',
        price: 'Tk 32,990',
        description: "The OPPO Reno12 F 5G is a cutting-edge smartphone designed to deliver an exceptional user experience. It features a 120Hz Smart Adaptive Screen that provides a smooth and vibrant display with a high refresh rate and peak brightness of 2100 nits.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/oppo/reno12-f/reno12-f-4g-olive-green-002-500x500.webp"),
    ProductModel(
        id: 5,
        name: 'Vivo Y29',
        price: 'Tk 21,999',
        description: "The Vivo Y29 is a sleek and powerful mid-range smartphone in Bangladesh, offering a smooth 6.68-inch display, a versatile camera setup, a long-lasting battery, and a modern design. Ideal for everyday users, students, and professionals seeking a reliable and elegant device.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/vivo/y29/vivo-y29-elegant-white-01-500x500.webp"),
    ProductModel(
        id: 6,
        name: 'Realme 14',
        price: 'Tk 41,999',
        description: "The Realme 14 Smartphone is a feature-rich mid-range gadget that combines innovative performance, realistic graphics, and long-lasting battery life in a sleek and sturdy design. The Realme 14 Mobile Phone, powered by the newest Snapdragon® 6 Gen 4 5G chipset based on an efficient 4nm process, provides smooth and responsive performance with its octa-core CPU up to 2.3GHz and Adreno GPU, making it perfect for multitasking and gaming.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/realme/realme-14/realme-14-01-500x500.webp"),
    ProductModel(
        id: 7,
        name: 'Redmi 13',
        price: 'Tk 16,290',
        description: "The Xiaomi Redmi 13 is a budget-friendly smartphone that offers a nice blend of performance and features. The Xiaomi Redmi 13 mobile phone has a sleek design with a 6.79-inch Full HD+ IPS LCD display with a refresh rate of 90Hz to give vivid visuals and a more fluid browsing experience.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/xiaomi/redmi-13/redmi-13-sandy-gold-500x500.webp"),
    ProductModel(
        id: 8,
        name: 'Nokia C32',
        price: '12,850',
        description: "The Nokia C32 Smartphone is a stylish and powerful smartphone designed to improve your mobile experience. With a brilliant 6.5-inch HD+ display with a resolution of 720 x 1600, this phone provides a visually appealing platform for all of your entertainment demands.",
        imageUrl:
            "https://www.startech.com.bd/image/cache/catalog/mobile/nokia/nokia-c32/nokia-c32-charcoal-001-500x500.webp"),
  ];

  List<ProductModel> get productList => _productList;

  final List<ProductModel> _cartProductList = [];

  List<ProductModel> get cartProductList => _cartProductList;

  int get cartItemCount => _cartProductList.length;

  void addToCart(ProductModel p) {
    for (ProductModel product in _cartProductList) {
      if (product.id == p.id) {
        return;
      }
    }
    _cartProductList.add(p);
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartProductList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  bool isAlreadyCarted(int id) {
    return _cartProductList.where((e) => e.id == id).isNotEmpty;
  }
}
