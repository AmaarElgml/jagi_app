import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'ProfileScreen.id';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(children: <Widget>[
              Column(children: <Widget>[
                Container(
                    height: 200.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: defSpacing * 2),
                          child: Stack(children: <Widget>[
                            Center(
                                child: Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: ExactAssetImage('assets/images/admins/male_avatar.png'),
                                            fit: BoxFit.cover)))),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                  CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: 25.0,
                                      child: Icon(Icons.camera_alt, color: Colors.white))
                                ]))
                          ]))
                    ])),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: defSpacing * 1.5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: defSpacing * 1.5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text('Personal Information',
                                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
                                        ]),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[_status ? _getEditIcon() : Container()])
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(top: defSpacing * 1.5),
                              child: Text('Name', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
                          Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Flexible(
                                  child: TextField(
                                      decoration: InputDecoration(hintText: "Enter Your Name"),
                                      enabled: !_status,
                                      autofocus: !_status))),
                          Padding(
                              padding: EdgeInsets.only(top: defSpacing * 1.5),
                              child: Text(
                                'Email',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Flexible(
                                  child: TextField(
                                      decoration: InputDecoration(hintText: "Enter Your Email"), enabled: !_status))),
                          Padding(
                              padding: EdgeInsets.only(top: defSpacing * 1.5),
                              child: Text(
                                'Mobile',
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Flexible(
                                  child: TextField(
                                      decoration: InputDecoration(hintText: "Enter Mobile Number"),
                                      enabled: !_status))),
                          !_status ? _getActionButtons() : Container()
                        ]))
              ])
            ])));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
        padding: EdgeInsets.only(top: 45.0),
        child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: defSpacing / 2),
                  child: CustomButton(
                      title: "Save",
                      onPressed: () {
                        setState(() {
                          _status = true;
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      })),
              flex: 2),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: defSpacing / 2),
                  child: CustomButton(
                      title: "Cancel",
                      onPressed: () {
                        setState(() {
                          _status = true;
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      backColor: Colors.white,
                      titleColor: primaryColor)),
              flex: 2)
        ]));
  }

  Widget _getEditIcon() {
    return GestureDetector(
        child: CircleAvatar(
            backgroundColor: Colors.red, radius: 14.0, child: Icon(Icons.edit, color: Colors.white, size: 16.0)),
        onTap: () {
          setState(() {
            _status = false;
          });
        });
  }
}
