import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCard extends StatelessWidget {
  final IconData icon;
  final String profile_url;

  const SocialCard({Key key, this.icon, this.profile_url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          launch(profile_url);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
