import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wyttle_app/Screens/login_screen.dart';
import 'package:wyttle_app/Screens/myorders_screen.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/authserice.dart';
import 'package:wyttle_app/services/baseservice.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:wyttle_app/widgets/errorTokenWidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User user;
  bool loading = false;
  //TODO: Update this ad well as backend
  String version = "1.0.0+1";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      loading = true;
    });
    dynamic result = await UserService.getUser();
    if (result == "Your session is expired please login again" ||
        result == "No user was found in DB") {
      tokenErrorWiget(context);
    } else {
      setState(() {
        user = result;
        loading = false;
      });
    }
  }

  logout() async {
    AuthService.clearAuth();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.cyan.shade200,
                    child: Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Colors.cyan.shade100.withOpacity(0.5),
                              radius: 60,
                              child: ClipOval(
                                child: FadeInImage.assetNetwork(
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  placeholder: "assets/images/loader.gif",
                                  image: user.photoUrl.toString(),
                                  imageErrorBuilder:
                                      (context, exception, stackTrace) {
                                    return CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                        "assets/images/Group 1.png",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                user.name.toString(),
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                  color: Colors.cyan.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Coins: " + "${user.numOfCoins}",
                                style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Colors.cyan.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyOrdersScreen(),
                        ),
                      );
                    },
                    leading: Icon(Icons.history_edu),
                    title: Text("Order History"),
                    trailing: Icon(Icons.arrow_forward_ios)),
                MaterialButton(
                  onPressed: logout,
                  child: Text("Logout"),
                ),
              ],
            ),
          );
  }
}
