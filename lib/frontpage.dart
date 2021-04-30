import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  static String myVideoId = 'aiafTg7e8GM';
  static String myView360 = 'https://360virtualindia.in/physicslabvt';
  //fullurl= https://www.youtube.com/watch?v=aiafTg7e8GM
  // Initiate the Youtube player controller
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      isLive: false,
      loop: true,
    ),
  );
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+919461246324',
      text: "Hey! I'm inquiring about the apartment listing",
    );

    await launch('$link');
  }

  String _url = 'https://360virtualindia.in/physicslabvt';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 100,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(40),
            color: Colors.yellowAccent.withOpacity(0.3),
            child: Column(
              children: <Widget>[
                Text(
                  'An Excellent Showroom of\n Hardwares',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'MITTAL BROTHERS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  onPressed: () => {launchWhatsApp()},
                  color: Colors.pink,
                  child: Text('Learn More'),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              // width: MediaQuery.of(context).size.width,
              height: kIsWeb
                  ? MediaQuery.of(context).size.height * 1.3
                  : MediaQuery.of(context).size.height * 0.95,
              padding: EdgeInsets.all(40),
              color: Colors.amberAccent,
              child: Column(
                children: [
                  Text(
                    'OUR PRODUCTS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: [
                          Image(
                            image: AssetImage('images/tiles.jpg'),
                          ),
                          Text(
                            'Tiles',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Image(
                            image: AssetImage('images/granite.jpg'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Granite',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () => {launchWhatsApp()},
                    color: Colors.pink,
                    child: Text(
                      'SEE MORE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //360 view button
          Container(
              padding: EdgeInsets.all(20),
              height: kIsWeb
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.blueAccent,
              child: Column(
                children: <Widget>[
                  Text(
                    'WANT TO GO FOR A\n VIRTUAL TOUR',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _launchURL();
                    },
                    color: Colors.pink,
                    child: Text(
                      'VIEW 360',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          //youtube video container
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.4,
            child: YoutubePlayer(
              controller: _controller,
              //liveUIColor: Colors.yellow,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(5),
            //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            color: Colors.black,
            child: Text(
              'Plot no 8 Opp. Metro Pillar no.30 Near Mansarovar Metro Station, Jaipur, Rajasthan 302020 | Phone: 9314021950\n\nCopyright © Aashiyana Decor',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          /*SizedBox(
            height: 30,
          ),*/
        ],
      ),
    );
  }
}
