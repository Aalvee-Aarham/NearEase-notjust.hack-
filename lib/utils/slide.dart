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

class slide extends StatelessWidget {
  List<fetchimageModel> bestSpecialList;

  slide(this.bestSpecialList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TxtBestSpecialists, style: boldTextStyle()),
            8.height,
            Text(TxtViewAll, style: boldTextStyle(color: ColorPrimary))
          ],
        ),
        8.height,
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
                          future: fetchImage(bestSpecialList[index].subTitle!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // While the image is being loaded, display a loading image
                              return SizedBox(
                                width: 120,
                                height: 110,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            } else if (snapshot.hasError) {
                              // If there's an error while loading the image, display an error message
                              return SizedBox(
                                width: 120,
                                height: 110,
                                child:
                                    Center(child: Text('Error loading image')),
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
        )
      ],
    );
  }
}
