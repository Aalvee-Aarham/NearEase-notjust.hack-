import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearease/screens/CategoryScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/model/Model.dart';
import 'package:nearease/screens/ShopScreen/productmodel.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';
import 'package:nearease/utils/DataProvider.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nearease/utils/fetchimage.dart';

class Categorysection extends StatelessWidget {
  ProductSlideModel topproducts;

  Categorysection(
    this.topproducts, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(topproducts.title, style: boldTextStyle()),
              8.height,
              Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
            ],
          ),
          8.height,
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: topproducts.productlist.length,
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
                            future: fetchImage(
                                topproducts.productlist[index].name!),
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
                        Text(topproducts.productlist[index].name!,
                                style: boldTextStyle())
                            .paddingAll(8),
                        Text(topproducts.productlist[index].price!,
                                style: secondaryTextStyle())
                            .paddingSymmetric(horizontal: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
