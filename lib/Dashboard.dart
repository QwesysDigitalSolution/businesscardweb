import 'package:businesscardweb/Utility/ResponsiveWidget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isFirst = false;

  GlobalKey _globalKeyCard1 = new GlobalKey();
  GlobalKey _globalKeyCard2 = new GlobalKey();
  GlobalKey _globalKeyCard3 = new GlobalKey();

  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();

  CallsAndMessagesService _service = new CallsAndMessagesService();

  String id = "0";

  Map<String, String> getQueryParameters() {
    var win = html.window;
    var loc = win.location;
    var href = loc.href;
    var uri = Uri.parse(href);
    var qp = uri.queryParameters;
    return qp;
  }

  @override
  void initState() {
    // TODO: implement initState
    var param = getQueryParameters();
    print("Paramiter Data");
    print("==============");
    print(param.toString());
    if (param['ID'] != null) {
      setState(() {
        id = param['ID'];
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = 600;
    double cardHeight = 350;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              RepaintBoundary(
                key: _globalKeyCard1,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Text("Click On The Card To Flip",style: TextStyle(fontSize: 16, color: Colors.grey[600],fontWeight: FontWeight.w600,letterSpacing: 3,wordSpacing: 2,),),
                      SizedBox(height: 10,),
                      FlipCard(
                        key: cardKey1,
                        flipOnTouch: true,
                        direction: FlipDirection.HORIZONTAL,
                        front: GestureDetector(
                          onTap: () {
                            cardKey1.currentState.toggleCard();
                          },
                          child: Material(
                            color: Color.fromRGBO(15, 14, 28, 1),
                            child: Container(
                              height: ResponsiveWidget.isLargeScreen(context)
                                  ? 350
                                  : 200,
                              width: ResponsiveWidget.isLargeScreen(context)
                                  ? 600
                                  : 344,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: ResponsiveWidget.isLargeScreen(context) ? 600 : 344,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: ResponsiveWidget.isLargeScreen(context) ? 100 : 30)),
                                        Image.network(
                                          "https://www.freepnglogos.com/uploads/eagles-png-logo/eagle-sports-png-logos--0.png",
                                          width: (ResponsiveWidget.isLargeScreen(context) ? 600 : 344) * 0.3,
                                          fit: BoxFit.contain,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 0),
                                          child: Text(
                                            "TagLine",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: ResponsiveWidget.isLargeScreen(context) ? 18 : 12,
                                                letterSpacing: ResponsiveWidget.isLargeScreen(context) ? 4 : 2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 40),
                                      child: Container(
                                        width: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 600
                                            : 344,
                                        height: 5,
                                        color: Color.fromRGBO(250, 177, 0, 1),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        /* shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(10.0)),*/
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        color: Color.fromRGBO(250, 177, 0, 1),
                                        onPressed: () {
                                          _service.url('https://www.google.com/');
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Image.asset(
                                              "images/internet.png",
                                              height: 15,
                                              width: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Text(
                                                "www.yoursitename.com",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.7),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        back: GestureDetector(
                          onTap: () {
                            cardKey1.currentState.toggleCard();
                          },
                          child: Material(
                            elevation: 2,
                            child: Container(
                              height: ResponsiveWidget.isLargeScreen(context)
                                  ? 350
                                  : 200,
                              width: ResponsiveWidget.isLargeScreen(context)
                                  ? 600
                                  : 344,
                              margin: EdgeInsets.only(top: 0, bottom: 0),
                              //color: Colors.white,
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 350
                                            : 200,
                                        width: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 251
                                            : 149,
                                        color: Color.fromRGBO(15, 14, 28, 1),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.network(
                                              "https://www.freepnglogos.com/uploads/eagles-png-logo/eagle-sports-png-logos--0.png",
                                              width: (ResponsiveWidget.isLargeScreen(context) ? 251 : 149) * 0.5,
                                              fit: BoxFit.contain,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 0),
                                              child: Text(
                                                "TagLine",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 18 : 12,
                                                    letterSpacing: ResponsiveWidget.isLargeScreen(context) ? 4 : 2),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 9
                                            : 6,
                                        height: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 600
                                            : 344,
                                        color: Color.fromRGBO(250, 177, 0, 1),
                                      ),
                                      Container(
                                        width: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 340
                                            : 189,
                                        height: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 260
                                            : 180,
                                        padding: EdgeInsets.only(
                                          left: ResponsiveWidget.isLargeScreen(context) ? 40 : 30,
                                        ),
                                        //color: Colors.pink,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text( "DENISH",
                                                        style: TextStyle(
                                                            fontSize: ResponsiveWidget.isLargeScreen(context) ? 18 : 14,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w600,
                                                        ),
                                                    ),
                                                    Text( " UBHAL",
                                                        style: TextStyle(
                                                          fontSize: ResponsiveWidget.isLargeScreen(context) ? 18 : 14,
                                                          color: Colors.grey[700],
                                                        ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Application Developer",
                                                  style:
                                                  TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 14 : 11),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.call('9033608708');
                                                    },
                                                    child: Text(
                                                      "+91 87584 22007",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.call('9033608708');
                                                    },
                                                    child: Text(
                                                      "+91 87584 22007",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.url('https://www.google.com/');
                                                    },
                                                    child: Text(
                                                      "www.website.com",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.sendEmail('qwesys@gmail.com');
                                                    },
                                                    child: Text(
                                                      "your@gmail.com",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.url('https://www.google.com/maps/@21.1702,72.8311');
                                                    },
                                                    child: Text(
                                                      "Your Address",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (){
                                                      _service.url('https://www.google.com/maps/@21.1702,72.8311');
                                                    },
                                                    child: Text(
                                                      "Your Address",
                                                      style:
                                                      TextStyle(fontSize: ResponsiveWidget.isLargeScreen(context) ? 12 : 10),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 90
                                            : 40,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Container(
                                        width: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 60
                                            : 38,
                                        height: ResponsiveWidget.isLargeScreen(
                                            context)
                                            ? 260
                                            : 180,
                                        decoration: BoxDecoration(
                                            color:
                                            Color.fromRGBO(250, 177, 0, 1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            50))),
                                                height: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                width: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: ResponsiveWidget
                                                      .isLargeScreen(
                                                      context)
                                                      ? 18
                                                      : 12,
                                                )),
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            50))),
                                                height: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                width: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                child: Icon(
                                                  Icons.call,
                                                  color: Colors.white,
                                                  size: ResponsiveWidget
                                                      .isLargeScreen(
                                                      context)
                                                      ? 18
                                                      : 12,
                                                )),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(50))),
                                              height: ResponsiveWidget
                                                  .isLargeScreen(context)
                                                  ? 32
                                                  : 25,
                                              width: ResponsiveWidget
                                                  .isLargeScreen(context)
                                                  ? 32
                                                  : 25,
                                              child: Icon(
                                                Icons.alternate_email,
                                                color: Colors.white,
                                                size: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 18
                                                    : 12,
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(
                                                            50))),
                                                height: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                width: ResponsiveWidget
                                                    .isLargeScreen(context)
                                                    ? 32
                                                    : 25,
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: ResponsiveWidget
                                                      .isLargeScreen(
                                                      context)
                                                      ? 18
                                                      : 12,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        onPressed: (){
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.cloud_download,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Save Card To Contact",style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1,wordSpacing: 2,),),
                          ],
                        )
                      ),
                      SizedBox(height: 50,),
                      Text("Powerd by Qwesys Digital Solutions",style: TextStyle(fontSize: 18, color: Colors.grey[600],fontWeight: FontWeight.w600,letterSpacing: 3,wordSpacing: 2,),),
                      SizedBox(height: 10,),
                      Text("want to create your card",style: TextStyle(fontSize: 16, color: Colors.grey[600],fontWeight: FontWeight.w600,letterSpacing: 3,wordSpacing: 2,),),
                      SizedBox(height: 10,),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        onPressed: (){
                          _service.url("https://play.google.com/store/apps?hl=en");
                        },
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Signup Now",style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1,wordSpacing: 2,),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
  void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launch("mailto:$email");
  void url(String url) => launch("$url");
}