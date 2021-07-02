import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Categories',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'SEE ALL',
                  style: TextStyle(
                      fontSize: 13, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                  IconAppBar(Icons.watch, 10),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 190,
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
        height: 160,
        width: 130,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 7, right: 7, top: 2, bottom: 2),
                    child: Text(
                      '30% OFF',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                padding: EdgeInsets.only(left: 8, top: 6),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹199',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '₹199',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
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
      child: Icon(
        iconData,
        color: Colors.black,
      ),
    );
  }
}
