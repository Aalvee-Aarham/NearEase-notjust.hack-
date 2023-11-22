import 'dart:async';
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
  late PageController _pageController;
  var position = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      // Change the page index every 3 seconds
      if (position < 10 - 1) {
        position++;
      } else {
        position = 0;
      }
      _pageController.animateToPage(
        position,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: fetchImages(widget.subtitle),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: 120,
            height: 110,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            width: 120,
            height: 110,
            child: Center(child: Text('Error loading image')),
          );
        } else {
          return Container(
            height: height * 0.55,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Image.network(snapshot.data![index],
                        width: width, height: height * 0.55, fit: BoxFit.cover);
                  },
                  onPageChanged: (index) {
                    setState(() {
                      position = index;
                      print(snapshot.data);
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DotsIndicator(
                    dotsCount: snapshot.data!.length,
                    position: position,
                    decorator: DotsDecorator(
                      color: Color(0xFFeaeaea),
                      activeColor: Color(0xFFf17015),
                      size: Size.square(7.0),
                      activeSize: Size.square(10.0),
                      spacing: EdgeInsets.all(3),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
