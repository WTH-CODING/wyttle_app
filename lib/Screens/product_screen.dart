import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static String id = "ProductScreen";

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
          onPressed: () {},
        ),
        title: Text(
          'Category Name',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
        ),
        children: [
          LowerProducts('random_images/3.jpg'),
          LowerProducts('random_images/2.jpg'),
          LowerProducts('random_images/1.jpg'),
          LowerProducts('random_images/0.jpg'),
          LowerProducts('random_images/3.jpg'),
        ],
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
        // height: 300,
        // width: MediaQuery.of(context).size.width * 0.49,
        // padding: EdgeInsets.all(1),
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black45, width: .8),
          // borderRadius: BorderRadius.all(Radius.circular(12)),
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
                  // SizedBox(
                  //   width: 1,
                  // ),
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
                      // borderRadius: BorderRadius.all(
                      //   Radius.circular(12),
                      // ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8, top: 6),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(12),
                  //   bottomRight: Radius.circular(12),
                  // )
                ),
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
