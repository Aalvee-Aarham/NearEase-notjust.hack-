import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nearease/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';

class ProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentTextStyle: TextStyle(color: AppTextColorSecondary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16.0),
          title: Text('hi', style: boldTextStyle()),
          content: Text('bhbjbhjh', style: secondaryTextStyle()),
          actions: <Widget>[
            TextButton(
              child: Text('kbkkbn',
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {
                finish(context);
              },
            ),
            TextButton(
              child: Text('uhihini',
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        height: context.height(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                        backgroundImage: Image.network(
                                "https://lh3.googleusercontent.com/a/ACg8ocJQO48H-hBsgk_MGctn_WnOfAMXqt0tl98X479K7PramA=s432-c-no")
                            .image, // Add your image URL here
                        radius: 50),
                  ),
                  8.height,
                  Text('Aalvee Aarham',
                      style: boldTextStyle()), // Add your name
                  8.height,
                  Text('aalvee.aarham@gmail.com',
                      style: secondaryTextStyle()), // Add your email
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: GreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.adjust,
                              size: 20,
                              color: ColorPrimary,
                            ),
                            12.width,
                            Text('dark mode',
                                style: secondaryTextStyle()), // Add your text
                          ],
                        ),
                        Switch(
                          value: appStore.isDarkModeOn,
                          activeColor: appColorPrimary,
                          onChanged: (s) {
                            appStore.toggleDarkMode(value: s);
                          },
                        )
                      ],
                    ).onTap(() {
                      appStore.toggleDarkMode();
                    }),
                    16.height,
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: GreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bell,
                          size: 23,
                          color: ColorPrimary,
                        ),
                        8.width,
                        Text('notifications', style: secondaryTextStyle())
                            .expand(),
                      ],
                    ).onTap(() {
                      // NotificationScreen().launch(context);
                    }),
                    16.height,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.cogs,
                          size: 23,
                          color: ColorPrimary,
                        ),
                        8.width,
                        Text('settings', style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {}),
                    16.height,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.fileAlt,
                          size: 23,
                          color: ColorPrimary,
                        ),
                        8.width,
                        Text('terms', style: secondaryTextStyle()).expand(),
                      ],
                    ).onTap(() {}),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: GreyColor.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0),
                  ],
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.signOutAlt,
                      size: 23,
                      color: ColorPrimary,
                    ),
                    8.width,
                    Text('log out', style: secondaryTextStyle()).expand(),
                  ],
                ).onTap(
                  () {
                    _showDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
