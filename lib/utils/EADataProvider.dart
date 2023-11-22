import 'package:nearease/utils/Images.dart';

List<EAForYouModel> forYouList = [
  EAForYouModel(
      name: "🔥 Black Friday Deal: 50% off 🔥",
      add: "Use the promo code BLACKFRIDAY ",
      attending: "https://www.notjust.dev/",
      hashtag: "#23rd to 27th November",
      rating: 5.0,
      price: "50%",
      distance: 0,
      image:
          "https://kajabi-storefronts-production.kajabi-cdn.com/kajabi-storefronts-production/themes/2150478331/settings_images/JD6mfHa4SdW7AYq88KG6_me_cropped.png",
      fev: true),
  EAForYouModel(
      name: "NY Single Party Events",
      add: "93, Bayport Ave South..",
      attending: "19/5k attending",
      hashtag: "#date",
      rating: 4.3,
      price: "20",
      distance: 8,
      image:
          "https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      fev: true),
  EAForYouModel(
      name: "The Wonder Women Free Tickets ",
      add: "Tobacco Dock,London ",
      attending: "19/5k attending",
      hashtag: "#cinema #movie",
      rating: 4.3,
      time: "06 Hrs 27 Mins 44 Secs,",
      price: "Free",
      distance: 8,
      image:
          "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg",
      fev: false),
  EAForYouModel(
      name: "NY Single Party Events",
      add: "93, Bayport Ave South..",
      attending: "19/5k attending",
      hashtag: "#date",
      rating: 4.3,
      price: "20",
      distance: 8,
      image:
          "https://images.pexels.com/photos/1684187/pexels-photo-1684187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      fev: false),
];

class EAForYouModel {
  String? hashtag;
  String? name;
  double? rating;
  String? add;
  String? attending;
  String? time;
  String? image;
  String? price;
  double? distance;
  bool? fev;

  EAForYouModel(
      {this.hashtag,
      this.name,
      this.rating,
      this.add,
      this.attending,
      this.time,
      this.image,
      this.distance,
      this.price,
      this.fev = false});
}
