import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:xypnos_training/api/models/user_model.dart';
import 'package:xypnos_training/api/services_2/remote_services.dart';
import 'package:xypnos_training/constants.dart';
import 'package:xypnos_training/provider/theme_provider.dart';
import 'package:xypnos_training/screens_of_authentification/sign_in/sign_in_screen.dart';
import 'package:xypnos_training/size_config.dart';

class Account extends StatefulWidget {
  static var darkmode;

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _switch1 = false;
  bool _switch2 = false;
  bool _switch3 = false;
  User user = User();
  //instantation of our Authentification class
  // Authentification authentification = Authentification();

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    var response = await RemoteServices.get("user");
    setState(() {
      user = User.fromJson(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    String profilepicurl;

    //
    if (user.profilePic.toString() != null) {
      profilepicurl = user.profilePic.toString();
    }

    //
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).appBarTheme.color,
        ),
        backwardsCompatibility: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                // color: Color(0xFF162349),
              ),
              onPressed: () {
                print("search courses");
              }),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          'Account',
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: getProportionateScreenWidth(23),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 0.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    // image: NetworkImage(
                    //       RemoteServices.profile_pic_url +
                    //                   user.profilePic.toString() !=
                    //               null
                    //           ? RemoteServices.profile_pic_url + user.profilePic
                    //           : '',
                    //     ) ??
                    //     AssetImage('assets/images/TRAINING 2-1.png'),

                    //

                    image: NetworkImage(
                            RemoteServices.profile_pic_url + profilepicurl) ??
                        AssetImage('assets/images/TRAINING 2-1.png'),
                  ),
                ),
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   border: Border.all(
                //     color: Color(0xFF162349),
                //   ),
                // ),
                // child: Icon(
                //   Icons.person,
                //   // color: Color(0xFF162349),
                //   size: 80,
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    user.name != null ? user.name : '',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.google,
                        // color: Color(0xFF3722d3),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text(
                        user.email != null ? user.email : '',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Become a member',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10.0),
            child: Text(
              'Push Notifications',
              style: TextStyle(
                color: Colors.grey,
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: SwitchListTile(
              secondary: Icon(
                Icons.ad_units_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Course-related',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Send notifications after enrolling, when deadlines are approaching...',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              value: _switch1,
              activeColor: kPrimaryColor,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  _switch1 = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: SwitchListTile(
              secondary: Icon(
                Icons.schedule_outlined,
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Study reminders',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Receive device notifications to remind you when to work on a course',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              value: _switch2,
              activeColor: kPrimaryColor,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  _switch2 = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: SwitchListTile(
              secondary: Icon(
                Icons.notifications_none_outlined,
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Promotions',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'Receive offers and promotions from Xypnos Labs',
                    style: TextStyle(fontSize: 12),
                  )),
              value: _switch3,
              activeColor: kPrimaryColor,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  _switch3 = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7, left: 10.0),
            child: Text(
              'Theme Settings',
              style: TextStyle(
                color: Colors.grey,
                fontSize: getProportionateScreenWidth(17),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: SwitchListTile(
              secondary: Icon(
                Icons.brightness_4,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Dark Theme / Light Theme',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Switch themes',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              activeColor: kPrimaryColor,
              inactiveTrackColor: Colors.grey,
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7, left: 10.0),
            child: Text(
              'Account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.settings_outlined,
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Account Settings',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.receipt_long_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'My Subscriptions',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.credit_card_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Payment Information',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7, left: 10.0),
            child: Text(
              'Support',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.support_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Learner Help Center',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.sms_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Send Logs',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7, left: 10.0),
            child: Text(
              'About',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.info_outline,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'About Xypnos Training',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.info_outline,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Terms of Use',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              leading: Icon(
                Icons.info_outline,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7, left: 10.0),
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          SizedBox(
            height: 60,
            child: ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: SignInScreen(),
                        type: PageTransitionType.bottomToTop));
              },
              // async {
              //   await authentification.googleSignOut().whenComplete(() {
              //     Navigator.pushReplacement(
              //         context,
              //         PageTransition(
              //             child: SignInScreen(),
              //             type: PageTransitionType.bottomToTop));
              //   });

              leading: Icon(
                Icons.logout_outlined,
                // color: Color(0xFF3722d3),
              ),
              title: Transform.translate(
                offset: Offset(-16, 0),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 25.00),
            child: Center(
                child: Text(
              "Xypnos Training V1.0.0",
              style: TextStyle(
                fontSize: 12,
              ),
            )),
          ),
        ],
      )),
    );
  }
}
