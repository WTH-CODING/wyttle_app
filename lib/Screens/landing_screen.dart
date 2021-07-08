import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wyttle_app/Screens/cart_screen.dart';
import 'package:wyttle_app/Screens/profile_screen.dart';
import 'package:wyttle_app/Screens/search_screen.dart';
import 'package:wyttle_app/Screens/welcome_screen.dart';
import 'package:wyttle_app/Screens/wishlist_screen.dart';
import 'package:wyttle_app/widgets/widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    WelcomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  List titles = ["", "My Wishlist", "My Cart", "Profile"];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          icon: IconAppBar(Icons.menu, 0, () {
            _key.currentState?.openEndDrawer();
          }),
        ),
        title: Text(
          titles[_selectedIndex],
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions:  [
          _selectedIndex != 3 || _selectedIndex != 2 ? IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
            icon: IconAppBar(Icons.search, 0, () {}),
          ) : Container()
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/banner.jpeg',
                height: 240,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.thLarge),
                    ),
                    Text(
                      'Shop by Categories',
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.black45,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.boxOpen),
                    ),
                    Text(
                      'My Orders',
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.black45,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 50),
                child: InkWell(
                  child: Text('FAQs'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 50),
                child: InkWell(
                  child: Text('CONTACT US'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 50),
                child: InkWell(
                  child: Text('LEGAL'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.cyan,
              hoverColor: Colors.cyan,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 200),
              tabBackgroundColor: Colors.cyan,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.bookmark_add,
                  text: 'Bookmarks',
                ),
                GButton(
                  icon: Icons.shopping_cart_rounded,
                  text: 'Carts',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
