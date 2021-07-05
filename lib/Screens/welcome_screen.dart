import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wyttle_app/Screens/cart_screen.dart';
import 'package:wyttle_app/Screens/myorders_screen.dart';
import 'package:wyttle_app/Screens/search_screen.dart';
import 'package:wyttle_app/widgets/widget.dart';
import 'package:wyttle_app/Screens/wishlist_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> bannerImage = [
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
    "random_images/0.jpg",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
  ];
  List<String> lowerProductImage = [
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
    "random_images/0.jpg",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
  ];
  String name = "Shasank";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[50],
        // leading: IconButton(
        //   onPressed: () {
        //     // Scaffold.of(context).openDrawer();
        //     // Drawer();
        //     // Navigator.push(context, Drawer);
        //     // GlobalKey<ScaffoldState>().currentState?.openDrawer();
        //   },
        //   icon: IconAppBar(Icons.menu, 0),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
            icon: IconAppBar(Icons.search, 0),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/banner.jpeg',
                height: 240,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, SearchScreen.id);
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
                  Navigator.pushNamed(context, MyOrdersScreen.id);
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
      body: Container(
        color: Colors.blueGrey[50],
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello $name!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Lets get something?',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 160,
              child: ListView.builder(
                itemCount: bannerImage.length,
                itemBuilder: (context, index) {
                  return BannerOffers(bannerImage[index]);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Text(
            //   'SEE ALL',
            //   style: TextStyle(
            //       fontSize: 13, color: Theme.of(context).primaryColor),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconAppBar(FontAwesomeIcons.tshirt, 10),
                  IconAppBar(FontAwesomeIcons.trophy, 10),
                  IconAppBar(FontAwesomeIcons.userShield, 10),
                  IconAppBar(FontAwesomeIcons.dumbbell, 10),
                  IconAppBar(FontAwesomeIcons.mars, 10),
                  IconAppBar(FontAwesomeIcons.venus, 10),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 210,
              child: ListView.builder(
                itemCount: lowerProductImage.length,
                itemBuilder: (context, index) {
                  return LowerProducts(lowerProductImage[index]);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[50],
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_filled,
                color: Color(0xff5680E9),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, WishlistScreen.id);
                },
                icon: Icon(
                  Icons.bookmark_add,
                  color: Colors.black45,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.id);
                },
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black45,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LowerProducts extends StatelessWidget {
  final String bannerImage;
  LowerProducts(this.bannerImage);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 180,
        width: 150,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            image: AssetImage(bannerImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 90),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, top: 6),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '₹199',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerOffers extends StatelessWidget {
  final String bannerImage;
  BannerOffers(this.bannerImage);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 160,
        width: 270,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(
            image: AssetImage(bannerImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
