import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  static String id = "MyOrdersScreen";

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  List<String> address = [
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
    "random_images/0.jpg",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My orders',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.blueGrey[50],
        child: ListView.builder(
            itemCount: address.length,
            itemBuilder: (context, index) {
              return MyOrdersTile(
                  address: address[index],
                  productName: 'Product Name',
                  isDelivered: false);
            }),
      ),
    );
  }
}

class MyOrdersTile extends StatelessWidget {
  MyOrdersTile(
      {required this.address,
      required this.productName,
      required this.isDelivered});
  final bool isDelivered;
  final String productName;
  final String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 140,
      margin: EdgeInsets.only(top: 10, right: 8, left: 8),
      decoration: BoxDecoration(
        color: Color(0xffC1C8E4),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 8),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(address),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isDelivered ? '  Order Delivered' : '  On the way',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    '   ' + productName,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Rate this product',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
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
}
