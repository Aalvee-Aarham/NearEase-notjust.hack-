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
  List<ProductModel> productlist = [
    ProductModel(
        name: "Classic Black Suit",
        price: "\$299.99",
        description:
            "Make a lasting impression with our timeless Classic Black Suit. Crafted from high-quality wool, this suit is tailored to perfection, ensuring a sophisticated and elegant fit. Ideal for formal occasions, business meetings, or any event where you want to exude confidence and style. Elevate your wardrobe with this essential piece that seamlessly combines classic design with modern sophistication."),
    ProductModel(
        name: "Designer Handbag",
        price: "\$199.99",
        description:
            "Indulge in luxury with our Designer Handbag, a true statement piece that enhances your fashion ensemble. Crafted from premium leather, this handbag features exquisite detailing and a spacious interior to accommodate all your essentials. The perfect blend of style and functionality, it effortlessly transitions from day to night, making it a must-have accessory for the fashion-forward individual."),
    ProductModel(
        name: "High-Heel Boots",
        price: "\$129.99",
        description:
            "Step out in style with our Fashionable High-Heel Boots, designed to add a touch of glamour to your look. These boots feature a sleek silhouette, a comfortable heel height, and quality craftsmanship. Whether you're dressing up for a night on the town or want to elevate your everyday style, these boots are the perfect choice. Embrace confidence and sophistication with every step you take."),
    ProductModel(
        name: "Aviator Sunglasses",
        price: "\$59.99",
        description:
            "Complete your look with our Classic Aviator Sunglasses, a timeless accessory that adds a cool and stylish edge to any outfit. The gold metal frame and tinted lenses not only provide UV protection but also exude a sense of effortless chic. Perfect for sunny days or to make a bold fashion statement, these sunglasses are a must-have for those who appreciate both style and functionality."),
    ProductModel(
        name: "Statement Necklace",
        price: "\$49.99",
        description:
            "Turn heads with our Bold and Eye-Catching Statement Necklace, a piece that will instantly elevate your outfit. Featuring intricate designs and vibrant colors, this necklace is a true expression of individuality and style. Whether you're dressing up a simple blouse or adding flair to a cocktail dress, this statement necklace is the perfect accessory to showcase your unique fashion sense."),
    ProductModel(
        name: "Tailored Trench Coat",
        price: "\$179.99",
        description:
            "Embrace sophistication with our Tailored Trench Coat, a wardrobe staple that exudes timeless style. Crafted from high-quality materials, this coat features a tailored fit, a belted waist, and classic details. Ideal for both casual and formal occasions, the trench coat adds a polished and refined touch to your ensemble. Invest in enduring elegance with this versatile and chic outerwear piece."),
    ProductModel(
        name: "Casual Denim Jacket",
        price: "\$89.99",
        description:
            "Stay on trend with our Versatile Denim Jacket, a casual yet stylish outerwear essential. Made from premium denim, this jacket combines comfort with fashion-forward design. The relaxed fit and distressed details make it perfect for creating a laid-back and effortlessly cool streetwear look. Enhance your wardrobe with this must-have piece that complements a variety of outfits."),
    ProductModel(
        name: "Bohemian Maxi Dress",
        price: "\$69.99",
        description:
            "Channel bohemian vibes with our Flowy Bohemian Maxi Dress, a free-spirited and stylish addition to your wardrobe. Made from lightweight and breathable fabric, this maxi dress features boho-inspired prints, a relaxed fit, and delicate detailing. Whether you're attending a summer festival or simply want to express your carefree style, this dress is perfect for those who embrace the bohemian spirit."),
    ProductModel(
        name: "Leather Clutch",
        price: "\$39.99",
        description:
            "Accessorize with our Sleek Leather Clutch, a stylish and practical addition to your ensemble. Crafted from genuine leather, this clutch features a minimalist design with a secure zip closure. Perfect for a night out or special occasions, it effortlessly complements both casual and formal outfits. Elevate your accessory collection with this versatile and timeless leather clutch."),
    ProductModel(
        name: "Printed Silk Scarf",
        price: "\$29.99",
        description:
            "Add a pop of color to your outfit with our Colorful Printed Silk Scarf. Made from luxurious silk, this scarf features vibrant prints and a lightweight feel. Whether you wear it around your neck, as a headscarf, or tie it to your handbag, this scarf is a versatile accessory that instantly enhances your style. Embrace the art of accessorizing with this eye-catching printed silk scarf."),
  ];

  Categorysection(this.productlist, {super.key});

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
            itemCount: productlist.length,
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
                          future: fetchImage(productlist[index].name!),
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
                      Text(productlist[index].name!, style: boldTextStyle())
                          .paddingAll(8),
                      Text(productlist[index].price!,
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
