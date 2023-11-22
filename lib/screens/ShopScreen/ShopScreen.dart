import 'package:flutter/material.dart';
import 'package:nearease/screens/ShopScreen/BannerSection.dart';
import 'package:nearease/screens/ShopScreen/CategorySection.dart';
import 'package:nearease/screens/ShopScreen/ProductsSlide.dart';
import 'package:nearease/screens/ShopScreen/productmodel.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late List<ProductModel> productlist;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(children: <Widget>[
                      BannerSection(subtitle: 'fashion store'),
                      Categorysection(productlist),
                    ])))));
  }
}
