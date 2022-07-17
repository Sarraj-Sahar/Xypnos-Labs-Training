import 'package:xypnos_training/screens_of_authentification/sign_in/sign_in_screen.dart';
import 'package:xypnos_training/screens_of_authentification/sign_up/sign_up_screen.dart';

import '../main.dart';
import 'package:get/get.dart';
import 'splash_data.dart';
import 'start_button_content.dart';
import 'splash_screen_layout.dart';
import 'font_styles.dart';
import 'package:flutter/material.dart';

class ConstellationDetailView extends StatefulWidget {
  static const route = "ConstellationDetailView";

  final ConstellationData data;
  final bool redMode;
  final int contentDelay;
  final Function onBackTap;

  const ConstellationDetailView(
      {Key key,
      this.data,
      this.redMode,
      this.contentDelay = 1000,
      @required this.onBackTap})
      : super(key: key);

  @override
  _ConstellationDetailViewState createState() =>
      _ConstellationDetailViewState();
}

class _ConstellationDetailViewState extends State<ConstellationDetailView>
    with SingleTickerProviderStateMixin {
  AnimationController _animController;

  Animation<double> _contentScaleTween;
  Animation<double> _textAlphaTween;

  void initState() {
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.contentDelay),
    )..addListener(() {
        setState(() {});
      });
    _contentScaleTween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Interval(.4, .8, curve: Curves.easeOutQuad),
      ),
    );
    _textAlphaTween = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Interval(.6, 1, curve: Curves.easeOutQuad),
      ),
    );
    _animController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 350.0),
            child: IconButton(
              iconSize: 20,
              icon: Icon(Icons.arrow_back),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              splashColor: Colors.white24,
              color: Colors.indigo,
              onPressed: () => widget.onBackTap(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: ConstellationTitleCard(
              data: widget.data,
              redMode: widget.redMode,
            ),
          ),
          Expanded(
            child: Transform.scale(
              scale: _contentScaleTween.value,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 180,
                    child: Container(
                      height: 80,
                      child: Text(
                        "With",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            package: MyApp.pkg),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    right: 80,
                    child: Container(
                      height: 90,
                      child: Image.asset("assets/images/TRAINING 2-1.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 170,
                    right: 140,
                    child: Container(
                      height: 40,
                      width: 120,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        splashColor: Colors.white24,
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                        //
                        onPressed: () {
                          Get.to(SignInScreen(),
                              transition: Transition.leftToRightWithFade);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => (SignInScreen()),
                          //     ));
                        },
                        // onPressed: () {
                        //   Navigator.pushNamed(context, SignInScreen.routeName);
                        // },
                        //

                        child: Text("Sign In",
                            style: TextStyle(
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: Fonts.Content,
                                color: Colors.white,
                                package: MyApp.pkg)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    right: 140,
                    child: Container(
                      height: 40,
                      width: 120,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        splashColor: Colors.white24,
                        color: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(
                            color: Color(0xFF47c3d4),
                          ),
                        ),
                        //

                        // onPressed: () {
                        //   Navigator.pushNamed(context, SignUpScreen.routeName);
                        // },

                        onPressed: () {
                          Get.to(SignUpScreen(),
                              transition: Transition.leftToRightWithFade);
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: Fonts.Content,
                                color: Colors.white,
                                package: MyApp.pkg)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientOverlay() {
    double firstGradientStop = .2;
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.transparent,
            Color(0x0),
            Color(0x0),
            Colors.black
          ], stops: [
            0,
            firstGradientStop,
            1 - firstGradientStop,
            1
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
