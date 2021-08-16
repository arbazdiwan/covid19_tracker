import 'dart:convert';

import 'package:covid19_tracker/pages/about.dart';
import 'package:covid19_tracker/pages/allcountries.dart';
import 'package:covid19_tracker/panels/mostaffectedcountries.dart';
import 'package:covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'datasource.dart';
import 'pages/faq.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size deviceSize;
  Map worldData;

//  PermissionName permissionName = PermissionName.Internet;
  String message = 'abcde';

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    print('******************** LOADED WORLD DATA ... ' + response.body);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
//      backgroundColor: Colors.white, //Color(0xffcad6e6),
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutPage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                  width: double.infinity,
                  color: Color(0xffcad6e6),
                  padding: EdgeInsets.only(bottom: 80),
                  child: Image.asset("images/socialdistancing.jpg")),
            ),
//            Container(
//              height: 120,
//              width: deviceSize.width,
//              alignment: Alignment.center,
//              color: Colors.orange.shade100,
//              child: Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: Text(
//                  DataSource.quote,
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.orange.shade900,
//                    fontSize: 18,
//                  ),
//                ),
//              ),
//            ),

            Card(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WorldWide',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          //margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: primaryBlack,
                              borderRadius: BorderRadius.circular(20)),
                          child: GestureDetector(
                            child: Row(children: [
                              Text(
                                'Regional',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: Colors.white,
                              ),
                            ]),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AllCountries(countryData: countryData)));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  worldData == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                            child: WorldWidePanel(
                              worldData: worldData,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      'Most Affected Countries',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    countryData == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : MostAffectedPanel(countryData: countryData),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FAQPage()));
              },
              child: Card(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                color: primaryBlack,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch(
                    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Card(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                color: primaryBlack,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Myth Busters',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                launch('https://www.pmcares.gov.in/');
              },
              child: Card(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                color: primaryBlack,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donate',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.only(top: 40, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Color(0xff20a4b0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60))),
                child: Image.asset('images/heroes.png')),

//            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
