import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_app/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: GetStarted()),
      );
}

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Image.asset('assets/images/getting_started_img.png')),
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Hi Fellas,  Welcome to Smart Home App",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        "Upgrade your home with Smart Home App and enjoy the services that your home serve cause they are Smart now :).",
                        style: GoogleFonts.poppins(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        animationDuration: Duration(seconds: 5),
                        primary: Style.accentColor,
                        maximumSize: Size(408, 45),
                        minimumSize: Size(308, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        )),
                    child: Text(
                      'Getting Started',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 48, top: 70),
                child: Image.asset('assets/images/login_illust.png'),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 9),
                  child: Text(
                    'First, you need login or create account',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.only(top: 9, bottom: 9),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Your email ex: youremail@domain.com',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12, color: Style.hintColor)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 9, bottom: 10),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Your password here :)',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12, color: Style.hintColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Forgot your password?',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Tapped forgot password')));
                            },
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.black)))),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(148, 45),
                              maximumSize: Size(200, 45),
                              primary: Style.cancelColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              )),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(148, 45),
                              maximumSize: Size(200, 45),
                              primary: Style.accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // <-- Radius
                              )),
                          onPressed: () {},
                          child: Text('Login',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 35),
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: "Doesn't have account?",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Tapped Doest have account')));
                            },
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.black)))),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(408, 45),
                        minimumSize: Size(308, 45),
                        primary: Style.cancelColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Create Account here',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: RichText(
                      text: TextSpan(
                          text: "Or",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Tapped forgot password')));
                            },
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)))),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 70),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(408, 45),
                        minimumSize: Size(308, 45),
                        primary: Colors.white,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        )),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.blue,
                    ),
                    label: Text('Create Account with Google',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
