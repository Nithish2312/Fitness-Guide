import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/screens/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
String selectedUrl = 'https://flutter.io';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        InputPage.id: (context) => InputPage(),
        
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home:Scaffold(

        appBar: AppBar(
          title: Text('Fitness Guide'),
        ),
        body: HomePage(),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          TypewriterAnimatedTextKit(
            
            text:['Fitness Guide'],
            textStyle:TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          RoundedButton(
            title: 'Find out Your BMI Index',
            colour: Colors.lightBlueAccent,
            onPressed: (){
              setState(() {
                Navigator.pushNamed(context, InputPage.id);
              });
            },),
          SizedBox(
            height: 20.0,
          ),
          RoundedButton(
            title: 'Get Tips to Lose Weight',
            colour: Colors.lightBlueAccent,
            onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => WebViewFlutter(
                      websiteName: "GOLO",
                      websiteUrl: "https://www.golo.com/",
                    )));
              });
            },),

          
        ],
      ),
      );
  }
}


class WebViewFlutter extends StatefulWidget {
  final String websiteName;
  final String websiteUrl;

  const WebViewFlutter({Key key, this.websiteName,this.websiteUrl})
      : super(key: key);

  @override
  _WebViewFlutterState createState() => _WebViewFlutterState();
}

class _WebViewFlutterState extends State<WebViewFlutter> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.websiteName),
      ),
      body: WebView(
        initialUrl: widget.websiteUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
