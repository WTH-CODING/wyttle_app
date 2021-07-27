import 'package:flutter/material.dart';
import 'package:wyttle_app/Screens/rating_screen.dart';
import 'package:wyttle_app/models/order.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/orderService.dart';
import 'package:wyttle_app/services/userservice.dart';

class MyOrdersScreen extends StatefulWidget {
  static String id = "MyOrdersScreen";

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  List<String> address = [
    "random_images/4.png",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
    "random_images/0.jpg",
    "random_images/3.jpg",
    "random_images/2.jpg",
    "random_images/1.jpg",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool loader = false;
  List<Order> orders = [];
  late User user;
  getData() async {
    setState(() {
      loader = true;
    });
    user = await UserService.getUser();
    orders = await OrderService.getAllOrdersByUserId(user.id);
    setState(() {
      loader = false;
    });
  }

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
      body: loader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.blueGrey[50],
              child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return MyOrdersTile(
                      order: orders[index],
                    );
                  }),
            ),
    );
  }
}

class MyOrdersTile extends StatelessWidget {
  MyOrdersTile({required this.order});
  final Order order;
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
                image: NetworkImage(order.orderItems!.first.item!.imageurl),
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
                    order.orderStatus == "Delivered "
                        ? '  Order Delivered'
                        : '  On the way',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    '   ' + order.id.toString(),
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatingScreen(
                              order.orderItems!.first.item!.imageurl,
                              order.orderItems!.first.item!.name),
                        ),
                      );
                    },
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
