import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/model/Model.dart';
import 'package:nearease/screens/ChatScreen.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';
import 'package:nearease/utils/DataProvider.dart';
import 'package:nearease/utils/Images.dart';
import 'package:nearease/main.dart';

class MessagesScreen extends StatefulWidget {
  static String tag = '/MessagesBottomNavigationBarScreen';

  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late List<MessageModel> messageList;
  late List<CallModel> callList;

  @override
  void initState() {
    super.initState();
    messageList = getMessageList();
    callList = getCallList();
  }

  Widget chatMassagesWidget() {
    return Container(
      color: GreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(splashColor: Colors.transparent),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 16.0, color: GreyColor),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: GreyColor),
                      fillColor: context.cardColor,
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: whiteColor),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ).expand(),
                ),
                16.width,
                Container(
                  child: Image.network(
                      "https://images.pexels.com/photos/1267315/pexels-photo-1267315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      width: 30,
                      height: 30),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: context.cardColor),
                ),
              ],
            ),
            16.height,
            ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: GreyColor.withOpacity(0.3), indent: 6),
              itemCount: messageList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    messageList[index].img.validate().startsWith('http')
                        ? Image.network(
                            messageList[index].img!,
                            width: 40,
                            height: 40,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                AssetImage(messageList[index].img!),
                            radius: 25),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(messageList[index].name!,
                              style: boldTextStyle(size: 14)),
                        ),
                        8.height,
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(messageList[index].message!,
                              style: TextStyle(fontSize: 12, color: GreyColor)),
                        ),
                      ],
                    ).expand(),
                    Text(messageList[index].lastSeen!,
                        style: secondaryTextStyle()),
                  ],
                ).onTap(() {
                  String? img = messageList[index].img;
                  String? name = messageList[index].name;
                  ChatScreen(img: img, name: name).launch(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget callsWidget() {
    return Container(
      color: GreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextField(
                autofocus: false,
                style: TextStyle(fontSize: 16.0, color: GreyColor),
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: GreyColor),
                  fillColor: context.cardColor,
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: GreyColor.withOpacity(0.3), indent: 5),
              physics: NeverScrollableScrollPhysics(),
              itemCount: callList.length,
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    callList[index].img.validate().startsWith('http')
                        ? Image.network(
                            callList[index].img!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(25)
                        : CircleAvatar(
                            backgroundImage: AssetImage(callList[index].img!),
                            radius: 25),
                    8.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(callList[index].name!,
                              style: boldTextStyle(size: 14)),
                          8.height,
                          Row(
                            children: [
                              Icon(callList[index].callImg, size: 14),
                              8.width,
                              Text(
                                callList[index].callStatus!,
                                style: TextStyle(
                                    color: AppTextColorSecondary, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelColor: ColorPrimary,
          unselectedLabelColor:
              appStore.isDarkModeOn ? white : AppTextColorPrimary,
          indicatorColor: ColorPrimary,
          onTap: (index) {},
          tabs: [
            Tab(child: Text(TabMessages, style: TextStyle(fontSize: 14))),
            Tab(child: Text(TabCalls, style: TextStyle(fontSize: 14))),
          ],
        ),
        body: TabBarView(children: [
          chatMassagesWidget(),
          callsWidget(),
        ]),
      ),
    );
  }
}
