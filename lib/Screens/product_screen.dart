import 'package:flutter/material.dart';
import 'package:wyttle_app/widgets/widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  static String id = "ProductScreen";

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int numberOfReviews = 100;
  bool stockAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 7),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.98,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('random_images/3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.98,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('random_images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.98,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('random_images/2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        glow: false,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (value) {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '($numberOfReviews Reviews)',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹199',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          SizedBox(
                            width: 5,
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
                      Text(
                        stockAvailable
                            ? 'Available in stock'
                            : 'Not available in stock',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Declare desctextshowflag this bool variable as global, and are there any way to increase the text widget height dynamically because here I want to give the maxline property as default, this maxline property also',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ProductSize('XS'),
                        ProductSize('S'),
                        ProductSize('M'),
                        ProductSize('L'),
                        ProductSize('XL'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: MainButton('ADD TO CART'),
      ),
    );
  }
}

class ProductSize extends StatefulWidget {
  final String size;
  ProductSize(this.size);
  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  Color bgColor = Colors.white;
  Color txtColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          bgColor = Color(0xffebefff);
          txtColor = Color(0xff5680E9);
        });
      },
      child: Container(
        width: 45,
        height: 45,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.size,
            style: TextStyle(
              fontSize: 18,
              color: txtColor,
            ),
          ),
        ),
      ),
    );
  }
}
