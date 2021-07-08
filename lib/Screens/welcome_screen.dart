import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wyttle_app/Screens/addData_screen.dart';
import 'package:wyttle_app/Screens/cart_screen.dart';
import 'package:wyttle_app/Screens/myorders_screen.dart';
import 'package:wyttle_app/Screens/search_screen.dart';
import 'package:wyttle_app/models/product.dart';
import 'package:wyttle_app/models/user.dart';
import 'package:wyttle_app/services/productService.dart';
import 'package:wyttle_app/services/userservice.dart';
import 'package:wyttle_app/widgets/widget.dart';
import 'package:wyttle_app/Screens/wishlist_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late User user;

  bool loader = false;
  bool loader2 = false;
  List<Product> homeProduct = [];
  List<Product> catProduct = [];

  getCatProducts(String catergory, int i) async {
    setState(() {
      loader2 = true;
      catProduct.clear();
      list2.clear();
      cat = [false, false, false, false, false, false];
    });
    catProduct = await ProductService.getProductByCategroy(catergory);
    list2 = List.generate(catProduct.length, (index) => false);
    setState(() {
      cat[i] = true;
      loader2 = false;
    });
  }

  getData() async {
    setState(() {
      loader = true;
      list1.clear();
    });
    homeProduct = await ProductService.gethomeProducts();
    list1 = List.generate(homeProduct.length, (index) => false);
    user = await UserService.getUser();
    switcher();
    getCatProducts("Jerseys", 0);
    setState(() {
      loader = false;
    });
  }

  switcher() async {
    if (user.phone == "") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AddDataScreen(),
        ),
      );
    }
  }

  List<String> bannerImage = [
    "https://img.freepik.com/free-vector/special-offer-modern-sale-banner-template_1017-20667.jpg?size=626&ext=jpg",
    "https://image.freepik.com/free-vector/special-offer-sale-discount-banner_180786-46.jpg",
    "https://image.freepik.com/free-vector/flat-design-mega-sale-discount-banner-template_151676-28.jpg",
  ];

  List<bool> list1 = [];
  List<bool> list2 = [];

  List<bool> cat = [true, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return loader
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.blueGrey[50],
            body: SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hello ${user.name}!',
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
                    'See Latest',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    height: 210,
                    child: ListView.builder(
                      itemCount: homeProduct.length,
                      itemBuilder: (context, index) {
                        return lowerProducts(homeProduct[index], list1[index],
                            () {
                          setState(() {
                            list1[index] = !list1[index];
                          });
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'By Categories',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  catProduct.length > 0
                      ? Container(
                          margin: EdgeInsets.only(top: 7),
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.tshirt, 10, cat[0]),
                                onTap: () {
                                  getCatProducts("Jerseys", 0);
                                },
                              ),
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.dumbbell, 10, cat[1]),
                                onTap: () {
                                  getCatProducts("Equipments", 1);
                                },
                              ),
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.userShield, 10, cat[2]),
                                onTap: () {
                                  getCatProducts("Safety Gears", 2);
                                },
                              ),
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.tools, 10, cat[3]),
                                onTap: () {
                                  getCatProducts("Training Equipments", 3);
                                },
                              ),
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.venus, 10, cat[4]),
                                onTap: () {
                                  getCatProducts("For Men", 4);
                                },
                              ),
                              InkWell(
                                child: IconAppBar1(
                                    FontAwesomeIcons.mars, 10, cat[5]),
                                onTap: () {
                                  getCatProducts("For Women", 5);
                                },
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  catProduct.length > 0
                      ? SizedBox(
                          height: 10,
                        )
                      : Container(),
                  catProduct.length > 0
                      ? Container(
                          margin: EdgeInsets.only(top: 7),
                          height: 210,
                          child: loader2
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: catProduct.length,
                                  itemBuilder: (context, index) {
                                    return lowerProducts(
                                        homeProduct[index], list2[index], () {
                                      setState(() {
                                        list2[index] = !list2[index];
                                      });
                                    });
                                  },
                                  scrollDirection: Axis.horizontal,
                                ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
  }

  lowerProducts(product, bo, func) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 180,
        width: 150,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
            image: NetworkImage(product.imageurl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 90),
                child: MaterialButton(
                  onPressed: func,
                  child: bo
                      ? Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.red,
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
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '₹${product.price}',
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

// ignore: must_be_immutable
// ignore: non_constant_identifier_names
IconAppBar1(iconData, marg, isSelected) {
  return Container(
      width: 45,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.black12,
      ),
      child: Center(
        child: FaIcon(
          iconData,
          color: isSelected ? Colors.cyan.shade700 : Colors.black54,
        ),
      ));
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
            image: NetworkImage(bannerImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
