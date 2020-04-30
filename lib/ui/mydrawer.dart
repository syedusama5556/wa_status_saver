import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MyNavigationDrawer extends StatelessWidget {
  final String version = '1.0';

  _launchURL() async {
    const url = 'https://infusiblecoder.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchAboutURL() async {
    const url = 'https://infusiblecoder.com/about.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
          accountName: Text(
            'Status Saver',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          accountEmail: Text('Version: $version'),
          currentAccountPicture: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: IconTheme(
                data: new IconThemeData(color: Color(0xff757575)),
                child: Icon(Icons.info)),
            title: Text('About Us'),
            onTap: () {
              _launchAboutURL();
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: IconTheme(
                data: new IconThemeData(color: Color(0xff757575)),
                child: Icon(Icons.rate_review)),
            title: Text('Rate Us'),
            onTap: () {
              _launchURL();
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: IconTheme(
                data: new IconThemeData(color: Color(0xff757575)),
                child: Icon(Icons.share)),
            title: Text('Share With Friends'),
            onTap: () {
              Share.share('check out my whatsapp status downloader',
                  subject: 'Look what I made!');
            },
          ),
        ),
      ],
    );
  }
}
