import 'package:covid19_tracker/widgets/contactcard.dart';
import 'package:covid19_tracker/widgets/socialcard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datasource.dart';
import 'profile.dart';

class AboutPage extends StatelessWidget {
  Size device;

  @override
  Widget build(BuildContext context) {
    device = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: primaryBlack,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('images/covidpreventionsteps.png'),
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              decoration: BoxDecoration(
                  color: primaryBlack,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        radius: 50.0,
//                        backgroundImage: AssetImage('images/avatar.png'),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/avatar.PNG'),
                            radius: 50.0,
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'profilepic',
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Profile()));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/avatar.PNG'))),
                          ),
                        ),
                      ),
                      Text(
                        'Arbaz Diwan',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'SOFTWARE DEVELOPER',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 18.0,
                            letterSpacing: 2.0,
                            color: Colors.teal.shade100,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        height: 15.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.teal.shade100,
                          thickness: 1.0,
                        ),
                      ),
                      SizedBox(height: 5),
                      ContactCard(
                        title: 'arbazdiwan@gmail.com',
                        contact_url: 'mailto:arbazdiwan@gmail.com',
                        icon: FontAwesomeIcons.envelope,
                        isClickable: false,
                      ),
                      ContactCard(
                        title: '/arbaz-diwan',
                        contact_url: 'https://www.linkedin.com/in/arbaz-diwan/',
                        icon: FontAwesomeIcons.linkedin,
                        isClickable: true,
                      ),
                      ContactCard(
                        title: 'arbazdiwan.github.io',
                        contact_url: 'https://arbazdiwan.github.io/',
                        icon: FontAwesomeIcons.globe,
                        isClickable: true,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 0.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _launchWhatsApp();
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SocialCard(
                                icon: FontAwesomeIcons.instagram,
                                profile_url:
                                    'https://www.instagram.com/ab.diwan/'),
                            SocialCard(
                                icon: FontAwesomeIcons.facebook,
                                profile_url:
                                    'https://www.facebook.com/arbaz.diwan.777'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // attributions
                      FlipCard(
                        front: Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Attributions and Credits',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        back: Container(
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ContactCard(
                                title: 'App Inspiration',
                                icon: FontAwesomeIcons.youtube,
                                isClickable: true,
                                contact_url:
                                    'https://www.youtube.com/channel/UCDop5l09jz_ExPaQwGL-RrQ',
                              ),
                              ContactCard(
                                title: 'Vectors Images',
                                icon: FontAwesomeIcons.vectorSquare,
                                isClickable: true,
                                contact_url:
                                    'https://www.vecteezy.com/free-vector/corona-virus',
                              ),
                              ContactCard(
                                title: 'Vectors Images',
                                icon: FontAwesomeIcons.vectorSquare,
                                isClickable: true,
                                contact_url:
                                    'https://www.freepik.com/free-photos-vectors/covid-19',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp() async {
    String phone = '+919725776347';
    String message =
        "Hello Arbaz. I've installed your Covid19 Tracker App on my device model.... ";
    var whatsappUrl = "whatsapp://send?phone=$phone&text=$message";

    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
