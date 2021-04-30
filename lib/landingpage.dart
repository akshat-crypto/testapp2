import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:test1/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'frontpage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+919461246324',
      text: "Hey! I'm inquiring about something!",
    );

    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchWhatsApp();
        },
        child: ImageIcon(
          AssetImage('images/whatsapp.png'),
          size: 50,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Mittal Brothers'),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: FrontPage(),
    );
  }
}
