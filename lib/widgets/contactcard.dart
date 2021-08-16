import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String contact_url;
  final bool isClickable;

  const ContactCard(
      {Key key, this.icon, this.title, this.contact_url, this.isClickable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable) launch(contact_url);
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.teal,
                      size: 20.0,
                    ),
                    SizedBox(width: 20),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.teal,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              isClickable
                  ? Icon(Icons.arrow_forward_ios, color: Colors.teal)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
