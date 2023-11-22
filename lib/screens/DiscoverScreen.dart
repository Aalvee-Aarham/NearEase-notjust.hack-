import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearease/screens/CategoryScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/model/Model.dart';
import 'package:nearease/screens/ShopScreen/ProductsSlide.dart';
import 'package:nearease/screens/ShopScreen/productmodel.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';
import 'package:nearease/utils/DataProvider.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nearease/utils/fetchimage.dart';
import 'package:nearease/utils/slide.dart';

// import 'DetailScreen.dart';
// import 'NotificationScreen.dart';
// import 'SpecialListViewAllScreen.dart';
// import 'SpecialOfferViewAllScreen.dart';

class DiscoverScreen extends StatefulWidget {
  static String tag = '/DiscoverBottomNavigationBarScreen';

  @override
  DiscoverScreenState createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
  late List<fetchimageModel> bestSpecialList;

  @override
  void initState() {
    super.initState();
    bestSpecialList = getSpecialList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Hi', style: boldTextStyle(size: 18)),
                      8.width,
                      Text('Notjust.dev,',
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorPrimary,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  GestureDetector(
                    child: Icon(Icons.notifications,
                        color: ColorPrimary, size: 22),
                    onTap: () {
                      // NotificationScreen().launch(context);
                    },
                  )
                ],
              ),
              16.height,
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  8.width,
                  Text('301 Dorthy walks,chicago,Us.',
                      style: secondaryTextStyle()),
                ],
              ),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        hintText: 'Find nearby stores here, ',
                        prefixIcon: Icon(Icons.search, color: GreyColor),
                        hintStyle: TextStyle(color: GreyColor),
                        filled: true,
                        fillColor: context.cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppDividerColor, width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: AppDividerColor, width: 0.5),
                        ),
                      ),
                    ),
                  ).expand(),
                  8.width,
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 14),
                    height: 45,
                    child: Icon(Icons.filter_list, color: Colors.grey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppDividerColor, width: 0.5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: boldTextStyle()),
                  8.height,
                ],
              ),
              8.height,
              Container(
                height: 250,
                child: Center(child: CategorySection()),
              ),
              slide(bestSpecialList),
              ProductsSlide(
                  isInd: true,
                  ProductSlideModel(productlist: [
                    ProductModel(
                      name: "Electrician - John Smith",
                      price: "\$25.00/hour",
                      description:
                          "Experienced electrician with expertise in wiring, installations, and electrical repairs. Providing reliable services for both residential and commercial projects.",
                    ),
                    ProductModel(
                      name: "Cleaner - Alice Johnson",
                      price: "\$15.00/hour",
                      description:
                          "Professional cleaner offering thorough cleaning services for homes and offices. Attention to detail and efficiency guaranteed for a spotless environment.",
                    ),
                    ProductModel(
                      name: "Web Developer - Michael Davis",
                      price: "\$40.00/hour",
                      description:
                          "Skilled web developer specializing in front-end and back-end development. Creating responsive and dynamic websites tailored to your business needs.",
                    ),
                    ProductModel(
                      name: "Graphic Designer - Emily White",
                      price: "\$35.00/hour",
                      description:
                          "Creative graphic designer with a passion for visual storytelling. Crafting unique and impactful designs for branding, marketing, and digital media.",
                    ),
                    ProductModel(
                      isInd: true,
                      name: "Plumber - Daniel Lee",
                      price: "\$30.00/hour",
                      description:
                          "Licensed plumber offering plumbing services for repairs, installations, and maintenance. Providing efficient solutions for residential and commercial plumbing needs.",
                    ),
                  ], title: 'Top independets near you')),
              ProductsSlide(
                  isInd: true,
                  ProductSlideModel(productlist: [
                    ProductModel(
                      name: "CleanClothes Inc.",
                      price: "\$1.50 per pound",
                      description:
                          "Professional laundry services providing high-quality cleaning for your clothes. Convenient and timely pick-up and delivery options available.",
                    ),
                    ProductModel(
                      name: "FreshPress Solutions",
                      price: "\$3.00 per item",
                      description:
                          "Specialized dry cleaning services for delicate and formal wear. Expert care to preserve the quality and longevity of your garments.",
                    ),
                    ProductModel(
                      name: "Sparkle Cleaners",
                      price: "\$20.00/hour",
                      description:
                          "Reliable and thorough home cleaning services. Experienced cleaners dedicated to creating a clean and comfortable living space for you.",
                    ),
                    ProductModel(
                      name: "Internet Provider",
                      price: "\$50.00/month",
                      description:
                          "Fast and reliable internet services for your home or business. High-speed connections and 24/7 customer support for uninterrupted connectivity.",
                    ),
                  ], title: "top services near you")),
            ],
          ),
        ),
      ),
    );
  }

  void sendTextData(BuildContext context) {
    String textData = 'Best Specialists';
    // SpecialListViewAllScreen(specialList: textData).launch(context);
  }

  void sendTextDataOffer(BuildContext context) {
    String sendOfferText = 'Special Offers';
    // SpecialOfferViewAllScreen(offerData: sendOfferText).launch(context);
  }
}
