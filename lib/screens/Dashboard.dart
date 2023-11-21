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
    specialOfferList = getSpecialOfferList();
    bestSpecialNewList = getSpecialNewList();
    specialOfferNewList = getSpecialOfferNewList();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TxtBestSpecialists, style: boldTextStyle()),
                  8.height,
                  Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
                      .onTap(
                    () {
                      sendTextData(context);
                    },
                  ),
                ],
              ),
              8.height,
              // CategorySection(),
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: bestSpecialList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // DetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
                        shadowColor: GreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: FutureBuilder(
                                future: fetchImages(
                                    bestSpecialList[index].subTitle!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    // While the image is being loaded, display a loading image
                                    return SizedBox(
                                      width: 120,
                                      height: 110,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  } else if (snapshot.hasError) {
                                    // If there's an error while loading the image, display an error message
                                    return SizedBox(
                                      width: 120,
                                      height: 110,
                                      child: Center(
                                          child: Text('Error loading image')),
                                    );
                                  } else {
                                    // If the image is loaded successfully, display it
                                    return commonCacheImageWidget(
                                        snapshot.data.toString(), 110,
                                        width: 120, fit: BoxFit.cover);
                                  }
                                },
                              ),
                            ),
                            Text(bestSpecialList[index].title!,
                                    style: boldTextStyle())
                                .paddingAll(8),
                            Text(bestSpecialList[index].subTitle!,
                                    style: secondaryTextStyle())
                                .paddingSymmetric(horizontal: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TxtSpecialOffers, style: boldTextStyle()),
                  Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
                      .onTap(
                    () {
                      sendTextDataOffer(context);
                    },
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: specialOfferList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // DetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: GreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: commonCacheImageWidget(
                                  specialOfferList[index].img, 100,
                                  width: 200, fit: BoxFit.cover),
                            ),
                            Text(specialOfferList[index].title!,
                                    style: boldTextStyle())
                                .paddingAll(8),
                            Text(
                              specialOfferList[index].subtitle!,
                              style: secondaryTextStyle(),
                            ).paddingOnly(left: 8, right: 8, bottom: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TxtbuddySpecialLists, style: boldTextStyle()),
                  Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
                      .onTap(
                    () {
                      sendTextData(context);
                    },
                  ),
                ],
              ),
              Container(
                height: 204,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                  itemCount: bestSpecialNewList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // DetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: GreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Container(
                                child: commonCacheImageWidget(
                                    bestSpecialNewList[index].img, 110,
                                    width: 120, fit: BoxFit.cover),
                              ),
                            ),
                            8.height,
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bestSpecialNewList[index].title!,
                                    style: boldTextStyle(),
                                  ),
                                  8.height,
                                  Text(bestSpecialNewList[index].subTitle!,
                                      style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TxtbuddyServices, style: boldTextStyle()),
                  Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
                      .onTap(
                    () {
                      sendTextDataOffer(context);
                    },
                  ),
                ],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                  itemCount: specialOfferNewList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // DetailScreen().launch(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 8, 16, 8),
                        shadowColor: GreyColor.withOpacity(0.3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: commonCacheImageWidget(
                                  specialOfferNewList[index].img, 100,
                                  width: 200, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(specialOfferNewList[index].title!,
                                  style: boldTextStyle()),
                            ),
                            Text(
                              specialOfferNewList[index].subtitle!,
                              style: secondaryTextStyle(),
                            ).paddingOnly(right: 8, left: 8, bottom: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
