import 'package:flutter/material.dart';
import 'package:nearease/screens/ShopScreen/productmodel.dart';

class BestSpecialModel {
  String? title;
  String? subTitle;
  String? img;

  BestSpecialModel({this.title, this.subTitle, this.img});
}

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}

class fetchimageModel {
  String? title;
  String? subTitle;
  Data? data;

  fetchimageModel({this.title, this.subTitle, required Data Data});
}

class CallModel {
  String? img;
  String? name;
  IconData? callImg;
  String? callStatus;
  String? videoCallIcon;
  String? audioCallIcon;

  CallModel(
      {this.img,
      this.name,
      this.callImg,
      this.callStatus,
      this.videoCallIcon,
      this.audioCallIcon});
}

class CategoryModel {
  String? img;
  String? categoryName;

  CategoryModel({this.img, this.categoryName});
}

class GalleryModel {
  String? img;

  GalleryModel({this.img});
}

class localStyleModel {
  String? img;
  String? name;

  localStyleModel({this.img, this.name});
}

class IncludeServiceModel {
  String? serviceImg;
  String? serviceName;
  String? time;
  int? price;

  IncludeServiceModel(
      {this.serviceImg, this.serviceName, this.time, this.price});
}

class MakeUpModel {
  String? img;
  String? name;

  MakeUpModel({this.img, this.name});
}

class MessageModel {
  String? img;
  String? name;
  String? message;
  String? lastSeen;

  MessageModel({this.img, this.name, this.message, this.lastSeen});
}

class NotificationModel {
  String? img;
  String? name;
  String? msg;
  String? status;
  String? callInfo;

  NotificationModel(
      {this.img, this.name, this.msg, this.status, this.callInfo});
}

class NotifyModel {
  String? img;
  String? name;
  String? address;
  double? rating;
  double? distance;

  NotifyModel({this.img, this.name, this.address, this.rating, this.distance});
}

class OfferModel {
  String? img;
  String? offerName;
  String? offerDate;
  int? offerOldPrice;
  int? offerNewPrice;

  OfferModel(
      {this.img,
      this.offerName,
      this.offerDate,
      this.offerOldPrice,
      this.offerNewPrice});
}

class ReviewModel {
  String? img;
  String? name;
  double? rating;

  String? day;
  String? review;

  ReviewModel({this.img, this.name, this.rating, this.day, this.review});
}

class ServicesModel {
  String? img;
  String? serviceName;
  String? time;
  int? price;
  int? radioVal;

  ServicesModel(
      {this.img, this.serviceName, this.time, this.price, this.radioVal});
}

class SpecialOfferModel {
  String? img;
  String? title;
  String? subtitle;

  SpecialOfferModel({this.img, this.title, this.subtitle});
}

class NEMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  NEMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
