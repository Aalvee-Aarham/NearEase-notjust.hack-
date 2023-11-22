import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/screens/ShopScreen/BannerSection.dart';
import 'package:nearease/screens/ShopScreen/CategorySection.dart';
import 'package:nearease/screens/ShopScreen/ProductsSlide.dart';
import 'package:nearease/screens/ShopScreen/data.dart';
import 'package:nearease/screens/ShopScreen/productmodel.dart';

class ShopScreen extends StatefulWidget {
  var data;

  String subtitle;
  ShopScreen({super.key, required this.data, required this.subtitle});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(children: <Widget>[
                      BannerSection(subtitle: widget.subtitle),
                      SizedBox(height: 20),
                      Center(
                          child: Text(widget.subtitle,
                              style: boldTextStyle().copyWith(fontSize: 20))),
                      SizedBox(height: 20),
                      Center(
                        child: Categoiresiconsection(
                          categories: widget.data.categories,
                        ),
                      ),
                      SizedBox(height: 8),
                      ProductsSlide(widget.data.one),
                      SizedBox(height: 8),
                      ProductsSlide(widget.data.two),
                      SizedBox(height: 8),
                      ProductsSlide(widget.data.three),
                    ])))));
  }
}
