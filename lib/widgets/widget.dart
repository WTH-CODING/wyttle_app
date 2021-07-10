import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wyttle_app/models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  ProductView({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3),
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
                ),
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

class IconAppBar extends StatelessWidget {
  final iconData;
  final double marg;
  final Function tap;
  IconAppBar(this.iconData, this.marg, this.tap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap(),
      child: Container(
          width: 45,
          margin: EdgeInsets.only(right: marg),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.black12,
          ),
          child: Center(
            child: FaIcon(
              iconData,
              color: Colors.black54,
            ),
          )),
    );
  }
}

class MainButton extends StatelessWidget {
  final String text;
  MainButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            backgroundColor: MaterialStateProperty.all(Color(0xff5680E9))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
