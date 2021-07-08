import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Image.asset(
              'assets/images/contact.jpg',
              height: 250,
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              'If you need help \n Feel free to contact us',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    height: 100,
                    width: 150,

                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: Color(0xff5680E9),
                          size: 40,
                        ),
                        Text('Mail us at'),
                        Text(
                          'team15@gmail.com',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    height: 100,
                    width: 150,
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help,
                          color: Color(0xff5680E9),
                          size: 40,
                        ),
                        Text('FAQs'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    height: 100,
                    width: 150,
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color(0xff5680E9),
                          size: 40,
                        ),
                        Text('+91 81XX0795X1 '),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    //color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Color(0xff5680E9),
                          size: 40,
                        ),
                        Text('Bhubaneswar, Odisha'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Copyright . 2021 Team15',
              style: TextStyle(color: Color(0xff5680E9)),
            ),
            Text(
              'All Rights Reserved',
              style: TextStyle(color: Color(0xff5680E9)),
            ),
          ],
        ),
      ),
    );
  }
}
