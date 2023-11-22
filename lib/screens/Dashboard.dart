import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearease/screens/CategoryScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/model/Model.dart';
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
  late List<SpecialOfferModel> specialOfferList;
  late List<BestSpecialModel> bestSpecialNewList;
  late List<SpecialOfferModel> specialOfferNewList;

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
                      Text('Theresa Cohen,',
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
                        hintText: 'Find buddy specialist',
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
              slide(bestSpecialList),
              slide(bestSpecialList),
              slide(bestSpecialList),
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
