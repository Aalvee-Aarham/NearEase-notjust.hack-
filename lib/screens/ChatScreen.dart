import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/model/Model.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';
import 'package:nearease/utils/DataProvider.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nearease/main.dart';
import 'package:nearease/utils/Widgets.dart';

class ChatScreen extends StatefulWidget {
  static String tag = '/ChatScreen';
  final String? img;
  final String? name;

  ChatScreen({this.img, this.name});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      hideKeyboard(context);
      var msgModel = NEMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = Sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = NEMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = Receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: appStore.isDarkModeOn ? white : black),
          title: Row(
            children: <Widget>[
              CircleAvatar(
                  backgroundImage: AssetImage(widget.img!), radius: 16),
              8.width,
              Text(widget.name!, style: boldTextStyle()),
            ],
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.call, color: AppTextColorPrimary, size: 20)),
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(color: Colors.transparent),
                shrinkWrap: true,
                reverse: true,
                controller: scrollController,
                itemCount: msgListing.length,
                padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
                itemBuilder: (_, index) {
                  NEMessageModel data = msgListing[index];
                  var isMe = data.senderId == Sender_id;

                  return ChatMessageWidget(isMe: isMe, data: data);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: context.cardColor, boxShadow: defaultBoxShadow()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: msgController,
                      focusNode: msgFocusNode,
                      autofocus: true,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration.collapsed(
                        hintText: personName.isNotEmpty
                            ? 'Write to ${widget.name}'
                            : 'Type a message',
                        hintStyle: primaryTextStyle(),
                        fillColor: context.cardColor,
                        filled: true,
                      ),
                      style: primaryTextStyle(),
                      onSubmitted: (s) {
                        sendClick();
                      },
                    ).expand(),
                    IconButton(
                      icon: Icon(Icons.send, size: 25),
                      onPressed: () async {
                        sendClick();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
