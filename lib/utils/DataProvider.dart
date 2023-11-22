// TODO Implement this library.import 'dart:core';

import 'package:flutter/material.dart';
import 'package:nearease/model/Model.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Constants.dart';
import 'Images.dart'; // TODO Implement this library.import 'dart:core';

List<fetchimageModel> getSpecialList() {
  List<fetchimageModel> list = [];

  list.add(fetchimageModel(
    title: 'Fashion Emporium',
    subTitle: 'Fashion Store',
  ));
  list.add(fetchimageModel(
    title: 'Willies Pharmacy',
    subTitle: 'Medical Supplies',
  ));
  list.add(fetchimageModel(
    title: 'Glamour Boutique',
    subTitle: 'Makeup Store',
  ));
  list.add(fetchimageModel(
    title: 'Health & Beauty Hub',
    subTitle: 'Beauty Supplies',
  ));
  list.add(fetchimageModel(
    title: 'Style Haven',
    subTitle: 'Fashion Store',
  ));
  list.add(fetchimageModel(
    title: 'Cuts & Clips Salon',
    subTitle: 'Barber Shop',
  ));
  list.add(fetchimageModel(
    title: 'Elegance Studio',
    subTitle: 'Makeup Studio',
  ));
  return list;
}

List<MessageModel> getMessageList() {
  List<MessageModel> messageList = [];
  messageList.add(MessageModel(
      img: example,
      name: 'Sherman Barber Shop',
      message: 'Hi Jackson..',
      lastSeen: 'Now'));
  messageList.add(MessageModel(
      img: example,
      name: 'Dale Horward',
      message: 'Thank you.',
      lastSeen: '8:30 AM'));
  messageList.add(MessageModel(
      img: example,
      name: 'Norah Beauty buddy',
      message: 'Hello',
      lastSeen: 'Yesterday'));
  return messageList;
}

List<CallModel> getCallList() {
  List<CallModel> callList = [];
  callList.add(
    CallModel(
      img: example,
      name: 'Sherman Barber Shop',
      callImg: Icons.call,
      callStatus: 'You call them',
      videoCallIcon: example,
      audioCallIcon: example,
    ),
  );
  callList.add(
    CallModel(
      img: example,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: example,
      audioCallIcon: example,
    ),
  );
  callList.add(
    CallModel(
      img: example,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: example,
      audioCallIcon: example,
    ),
  );
  callList.add(
    CallModel(
      img: example,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: example,
      audioCallIcon: example,
    ),
  );
  return callList;
}

List<GalleryModel> getGalleryList() {
  List<GalleryModel> galleryList = [];
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  galleryList.add(GalleryModel(img: example));
  return galleryList;
}

List<CategoryModel> getCategory() {
  List<CategoryModel> categoryList = [];
  categoryList.add(CategoryModel(img: example, categoryName: 'All'));
  categoryList.add(CategoryModel(img: example, categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: example, categoryName: 'Make Up'));
  categoryList.add(CategoryModel(img: example, categoryName: 'local Color'));
  categoryList.add(CategoryModel(img: example, categoryName: 'Skin Care'));
  categoryList.add(CategoryModel(img: example, categoryName: 'local Color'));

  return categoryList;
}

List<OfferModel> getOfferList() {
  List<OfferModel> offerList = [];
  offerList.add(
    OfferModel(
        img: example,
        offerName: 'Personality Girl Event',
        offerDate: 'June 10 - June 26',
        offerOldPrice: 100,
        offerNewPrice: 89),
  );
  offerList.add(
    OfferModel(
        img: example,
        offerName: 'Changer local Color',
        offerDate: 'May 10 - May 17',
        offerOldPrice: 80,
        offerNewPrice: 70),
  );
  offerList.add(
    OfferModel(
        img: example,
        offerName: 'Personality Girl Event',
        offerDate: 'Sep 12 - Sep 14',
        offerOldPrice: 120,
        offerNewPrice: 109),
  );
  offerList.add(
    OfferModel(
        img: example,
        offerName: 'Personality Girl Event',
        offerDate: 'Nov 05 - Nov 13',
        offerOldPrice: 150,
        offerNewPrice: 130),
  );
  return offerList;
}

List<ServicesModel> getServicesList() {
  List<ServicesModel> servicesList = [];
  servicesList.add(ServicesModel(
      img: example,
      serviceName: 'local Style',
      time: '45 Min',
      price: 50,
      radioVal: 1));
  servicesList.add(ServicesModel(
      img: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100,
      radioVal: 2));
  servicesList.add(ServicesModel(
      img: example,
      serviceName: 'local Cutting',
      time: '60 Min',
      price: 70,
      radioVal: 3));
  servicesList.add(ServicesModel(
      img: example,
      serviceName: 'Skin Care',
      time: '30 Min',
      price: 150,
      radioVal: 4));
  return servicesList;
}

List<IncludeServiceModel> getIncludeServicesList() {
  List<IncludeServiceModel> servicesList = [];
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'local Cutting',
      time: '60 Min',
      price: 70));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Skin Care',
      time: '30 Min',
      price: 150));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'local Style',
      time: '45 Min',
      price: 50));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100));
  servicesList.add(IncludeServiceModel(
      serviceImg: example,
      serviceName: 'Change local Color',
      time: '50 Min',
      price: 100));
  return servicesList;
}

List<ReviewModel> getReviewList() {
  List<ReviewModel> reviewList = [];
  reviewList.add(ReviewModel(
      img: example,
      name: 'Carlos Day',
      rating: 4.5,
      day: '4 Day ago',
      review: example));
  reviewList.add(ReviewModel(
      img: example,
      name: 'Sherman',
      rating: 2.5,
      day: '10 Day ago',
      review: Review));
  reviewList.add(ReviewModel(
      img: example,
      name: 'Dale Horward',
      rating: 4,
      day: '1 Day ago',
      review: Review));
  reviewList.add(ReviewModel(
      img: example,
      name: 'Carlos Day',
      rating: 3.5,
      day: '3 Day ago',
      review: Review));
  return reviewList;
}

List<localStyleModel> getlocalStyleList() {
  List<localStyleModel> localStyleList = [];
  localStyleList.add(localStyleModel(img: example, name: 'Carlos Day'));
  localStyleList.add(localStyleModel(img: example, name: 'Carlos Sherman'));
  localStyleList.add(localStyleModel(img: example, name: 'Dale Horward'));
  localStyleList.add(localStyleModel(img: example, name: 'Sherman'));
  return localStyleList;
}

List<MakeUpModel> getMakeupList() {
  List<MakeUpModel> makeupList = [];
  makeupList.add(MakeUpModel(img: example, name: 'willies carpen'));
  makeupList.add(MakeUpModel(img: example, name: 'Carlos Day'));
  makeupList.add(MakeUpModel(img: example, name: 'Dale Horward'));
  makeupList.add(MakeUpModel(img: example, name: 'willies carpen'));
  return makeupList;
}

List<NotificationModel> getNotificationList() {
  List<NotificationModel> notificationList = [];
  notificationList.add(NotificationModel(
      img: example,
      name: 'Sherman Shop',
      msg: 'Hi Jackson..',
      status: 'Just Now',
      callInfo: example));
  notificationList.add(NotificationModel(
      img: example,
      name: 'Dale Horward',
      msg: 'Thank you.',
      status: '8:30 AM',
      callInfo: example));
  notificationList.add(NotificationModel(
      img: example,
      name: 'Norah  buddy',
      msg: 'Hello',
      status: 'Yesterday',
      callInfo: example));
  notificationList.add(NotificationModel(
      img: example,
      name: 'Norah Beauty',
      msg: 'Sent you a message',
      status: 'Tomorrow',
      callInfo: example));
  return notificationList;
}

List<NotifyModel> getNotifyList() {
  List<NotifyModel> notifyList = [];
  notifyList.add(
    NotifyModel(
        img: example,
        name: 'Norah Beauty buddy',
        address: '301 Dorthy walks,chicago,Us.',
        rating: 4.5,
        distance: 7.5),
  );
  notifyList.add(
    NotifyModel(
        img: example,
        name: 'Sherman Barber Shop',
        address: 'Dorthy walks,Us.',
        rating: 3.5,
        distance: 14.2),
  );
  notifyList.add(
    NotifyModel(
        img: example,
        name: 'willies carpen',
        address: '301 Dorthy walks,chicago,Us.',
        rating: 2.0,
        distance: 10.0),
  );
  notifyList.add(
    NotifyModel(
        img: example,
        name: 'Norah Beauty buddy',
        address: '301 Dorthy walks,chicago,Us.',
        rating: 5.0,
        distance: 17.5),
  );
  notifyList.add(
    NotifyModel(
        img: example,
        name: 'Dale Horward',
        address: '301 Dorthy walks,chicago,Us.',
        rating: 3.5,
        distance: 11.0),
  );
  return notifyList;
}

List<NEMessageModel> getChatMsgData() {
  List<NEMessageModel> list = [];

  NEMessageModel c1 = NEMessageModel();
  c1.senderId = Sender_id;
  c1.receiverId = Receiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  NEMessageModel c2 = NEMessageModel();
  c2.senderId = Sender_id;
  c2.receiverId = Receiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  NEMessageModel c3 = NEMessageModel();
  c3.senderId = Receiver_id;
  c3.receiverId = Sender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  NEMessageModel c4 = NEMessageModel();
  c4.senderId = Sender_id;
  c4.receiverId = Receiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  NEMessageModel c5 = NEMessageModel();
  c5.senderId = Sender_id;
  c5.receiverId = Receiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  NEMessageModel c6 = NEMessageModel();
  c6.senderId = Receiver_id;
  c6.receiverId = Sender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  NEMessageModel c7 = NEMessageModel();
  c7.senderId = Sender_id;
  c7.receiverId = Receiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  NEMessageModel c8 = NEMessageModel();
  c8.senderId = Receiver_id;
  c8.receiverId = Sender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  NEMessageModel c9 = NEMessageModel();
  c9.senderId = Sender_id;
  c9.receiverId = Receiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  NEMessageModel c10 = NEMessageModel();
  c10.senderId = Receiver_id;
  c10.receiverId = Sender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  NEMessageModel c11 = NEMessageModel();
  c11.senderId = Receiver_id;
  c11.receiverId = Sender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  NEMessageModel c12 = NEMessageModel();
  c12.senderId = Sender_id;
  c12.receiverId = Receiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  NEMessageModel c13 = NEMessageModel();
  c13.senderId = Sender_id;
  c13.receiverId = Receiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  NEMessageModel c14 = NEMessageModel();
  c14.senderId = Receiver_id;
  c14.receiverId = Sender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  NEMessageModel c15 = NEMessageModel();
  c15.senderId = Sender_id;
  c15.receiverId = Receiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  NEMessageModel c16 = NEMessageModel();
  c16.senderId = Receiver_id;
  c16.receiverId = Sender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  NEMessageModel c17 = NEMessageModel();
  c17.senderId = Sender_id;
  c17.receiverId = Receiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  NEMessageModel c18 = NEMessageModel();
  c18.senderId = Receiver_id;
  c18.receiverId = Sender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'images/flag/ic_us.png'),
    LanguageDataModel(
        id: 2,
        name: 'Hindi',
        languageCode: 'hi',
        fullLanguageCode: 'hi-IN',
        flag: 'images/flag/ic_hi.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'images/flag/ic_ar.png'),
    LanguageDataModel(
        id: 4,
        name: 'French',
        languageCode: 'fr',
        fullLanguageCode: 'fr-FR',
        flag: 'images/flag/ic_fr.png'),
  ];
}
