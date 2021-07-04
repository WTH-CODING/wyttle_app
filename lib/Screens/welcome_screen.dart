import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String name = "Shasank";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          onPressed: () {},
          icon: IconAppBar(Icons.menu, 0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconAppBar(Icons.search, 0),
          ),
        ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BannerOffers('random_images/3.jpg'),
                  BannerOffers('random_images/2.jpg'),
                  BannerOffers('random_images/1.jpg'),
                  BannerOffers('random_images/0.jpg'),
                ],
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LowerProducts('random_images/3.jpg'),
                  LowerProducts('random_images/2.jpg'),
                  LowerProducts('random_images/1.jpg'),
                  LowerProducts('random_images/0.jpg'),
                ],
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
                color: Colors.black45,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_add,
                  color: Colors.black45,
                )),
            IconButton(
                onPressed: () {},
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
  final String address;
  LowerProducts(this.address);

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
            image: AssetImage(address),
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
  final String address;
  BannerOffers(this.address);

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
            image: AssetImage(address),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class IconAppBar extends StatelessWidget {
  final IconData iconData;
  final double marg;
  IconAppBar(this.iconData, this.marg);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        margin: EdgeInsets.only(right: marg),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.black12,
        ),
        child: FaIcon(
          iconData,
          color: Colors.black,
        ));
  }
}
