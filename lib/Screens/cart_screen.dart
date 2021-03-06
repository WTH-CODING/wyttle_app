import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wyttle_app/models/order.dart';
import 'package:wyttle_app/models/product.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/orderService.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:wyttle_app/widgets/widget.dart';

class CartScreen extends StatefulWidget {
  static String id = "CartScreen";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  bool loader = false;
  late User user;

  getData() async {
    setState(() {
      loader = true;
    });
    user = await UserService.getUser();
    createTotalCount();
    setState(() {
      loader = false;
    });
  }

  createTotalCount() {
    setState(() {
      total = 0;
    });
    user.cart.forEach((element) {
      total += element.count * element.item.price;
    });
    setState(() {});
  }

  int total = 0;

  @override
  Widget build(BuildContext context) {
    return loader
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: ListView.builder(
              itemCount: user.cart.length,
              itemBuilder: (context, index) {
                return cartProductTile(
                  user.cart[index],
                );
              },
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(10),
              height: 125,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '???$total',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff5680E9),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff5680E9))),
                        onPressed: () async {
                          User user = await UserService.getUser();
                          // user.cart.clear();
                          Order order = Order(
                              itemsPrice: total,
                              shippingPrice: 50,
                              totalPrice: int.parse(total.toString()) + 50,
                              shippingInfo: ShippingInfo(
                                  address: user.address, phoneNo: user.phone),
                              isPaid: false,
                              user: user,
                              orderItems: [
                                OrderItem(item: user.cart.first.item, count: 1)
                              ],
                              transactionId: "hello",
                              orderStatus: "Placed");
                          bool isCreated = await OrderService.createorder(jsonEncode(order.toJson()));
                          // bool isUpdate = await UserService.updateUser(
                          //     jsonEncode(user.toJson()));
                          if (isCreated) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Order added successfully")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("order addition failed")));
                          }
                        },
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  cartProductTile(Cart cart) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 140,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffC1C8E4),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cart.item.imageurl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(top: 20, left: 10, bottom: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.item.name,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "???${cart.item.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      Container(
                        height: 35,
                        width: 104,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (cart.count - 1 <= 0) {
                                  setState(() {
                                    cart.count = 0;
                                  });
                                } else {
                                  setState(() {
                                    cart.count -= 1;
                                  });
                                }
                                createTotalCount();
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Color(0xff5680E9),
                              ),
                            ),
                            Text('${cart.count}'),
                            IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  cart.count += 1;
                                });
                                createTotalCount();
                              },
                              icon: Icon(
                                Icons.add,
                                color: Color(0xff5680E9),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
