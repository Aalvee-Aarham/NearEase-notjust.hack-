import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearease/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nearease/utils/Colors.dart';
import 'package:nearease/utils/Constants.dart';
import 'package:nearease/utils/Images.dart';
import 'package:nearease/main.dart';

class AppointmentScreen extends StatefulWidget {
  static String tag = '/AppointmentBottomNavigationBarScreen';

  @override
  AppointmentScreenState createState() => AppointmentScreenState();
}

class AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  bool isSwitched = false;

  late DateTime date;

  _pickDate() async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (time != null) {
      setState(() {
        date = time;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

  Widget ongoingAppointmentWidget() {
    return Container(
      color: appStore.isDarkModeOn
          ? scaffoldDarkColor
          : GreyColor.withOpacity(0.1),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.cardColor,
                boxShadow: [
                  BoxShadow(
                      color: GreyColor.withOpacity(0.3),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0)
                ],
              ),
              child: ListTile(
                title: Text('Date : ${date.day}/ ${date.month}/ ${date.year}',
                    style: TextStyle(color: AppTextColorSecondary)),
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: AppTextColorSecondary),
                onTap: () => _pickDate(),
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.cardColor,
                boxShadow: [
                  BoxShadow(
                      color: GreyColor.withOpacity(0.3),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 2.0)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                            placeholder: placeholderWidgetFn() as Widget
                                Function(BuildContext, String)?,
                            imageUrl:
                                "https://images.pexels.com/photos/845451/pexels-photo-845451.jpeg",
                            height: 70,
                            width: 130,
                            fit: BoxFit.cover),
                      ),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Conado local Studio',
                              style: boldTextStyle(size: 14)),
                          8.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on,
                                      size: 14, color: AppTextColorSecondary)
                                  .paddingOnly(top: 2),
                              Text('301 Dorthy walks,chicago,Us.',
                                      style: secondaryTextStyle(size: 12))
                                  .expand(),
                            ],
                          ),
                        ],
                      ).expand(),
                    ],
                  ),
                  8.height,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Makeup Marguerite',
                            style: boldTextStyle(size: 14)),
                        Text('1:30 - 2:30 PM',
                            style: primaryTextStyle(
                                color: ColorPrimary, size: 14)),
                      ]),
                  8.height,
                  Row(
                    children: [
                      Icon(Icons.person,
                          size: 14, color: AppTextColorSecondary),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text('Lettie Neal', style: secondaryTextStyle()),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Remind me 1h in advance',
                          style: secondaryTextStyle()),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: isSwitched,
                          activeColor: ColorPrimary,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget historyAppointmentWidget() {
    return Container(
      color: appStore.isDarkModeOn
          ? scaffoldDarkColor
          : GreyColor.withOpacity(0.1),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.cardColor,
              boxShadow: [
                BoxShadow(
                    color: GreyColor.withOpacity(0.3),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                            placeholder: placeholderWidgetFn() as Widget
                                Function(BuildContext, String)?,
                            imageUrl:
                                "https://images.pexels.com/photos/51383/photo-camera-subject-photographer-51383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                            height: 70,
                            width: 130,
                            fit: BoxFit.cover),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Conado  local Studio',
                              style: boldTextStyle(size: 14)),
                          8.height,
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 14, color: AppTextColorSecondary),
                              4.width,
                              Text('301 Dorthy walks',
                                  style: secondaryTextStyle()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.height,
                  Text('Canon 6600', style: secondaryTextStyle()),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,
                              size: 14, color: AppTextColorSecondary),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text('\$2000', style: secondaryTextStyle()),
                          ),
                        ],
                      ),
                      Text('March 24, 2020',
                          style: TextStyle(
                              color: AppTextColorPrimary, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: TabBar(
            labelColor: ColorPrimary,
            unselectedLabelColor:
                appStore.isDarkModeOn ? white : AppTextColorPrimary,
            indicatorColor: ColorPrimary,
            onTap: (index) {},
            tabs: [
              Tab(
                  child: Text("Appointments and Bookings",
                      style: TextStyle(fontSize: 14))),
              Tab(child: Text("Cart", style: TextStyle(fontSize: 14))),
            ],
          ),
          body: TabBarView(
            children: [
              ongoingAppointmentWidget(),
              historyAppointmentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
