import 'package:flutter/material.dart';
import 'package:nearease/screens/ShopScreen/dots_indicator/src/dots_decorator.dart';
import 'package:nearease/screens/ShopScreen/dots_indicator/src/dots_indicator.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nearease/utils/fetchimage.dart';

class BannerSection extends StatefulWidget {
  final String subtitle;

  const BannerSection({super.key, required this.subtitle});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.55,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          FutureBuilder(
            future: fetchImage(widget.subtitle!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While the image is being loaded, display a loading image
                return SizedBox(
                  width: width,
                  height: height * 0.55,
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                // If there's an error while loading the image, display an error message
                return SizedBox(
                  width: 120,
                  height: 110,
                  child: Center(child: Text('Error loading image')),
                );
              } else {
                // If the image is loaded successfully, display it
                return Hero(
                    tag: widget.subtitle,
                    child: commonCacheImageWidget(
                        snapshot.data.toString(),
                        width: width,
                        height * 0.55,
                        fit: BoxFit.cover));
              }
            },
          ),
        ],
      ),
    );
  }
}
