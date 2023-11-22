import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nearease/model/Model.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

class CategorySection extends StatelessWidget {
  final List<Category> categories = [
    Category("Fashion", FontAwesomeIcons.tshirt),
    Category("Supermarket", FontAwesomeIcons.shoppingBasket),
    Category("Restaurant", FontAwesomeIcons.utensils),
    Category("Services", FontAwesomeIcons.cogs),
    Category("Independents", FontAwesomeIcons.users),
    Category("Pharmacy", FontAwesomeIcons.clinicMedical),
    Category("Grocery", FontAwesomeIcons.shoppingCart),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      children: categories.map((category) {
        return Container(
          child: CategoryCard(category: category),
        );
      }).toList(),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.fromLTRB(8, 8, 16, 8),
      shadowColor: GreyColor.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: FaIcon(
                category.icon,
                size: 50, // Adjust the icon size according to your needs
                color: Colors.orangeAccent,
              )),
          SizedBox(height: 5),
          Center(
              child: Text(category.name,
                  style: boldTextStyle().copyWith(fontSize: 9)))
        ],
      ),
    );
  }
}
