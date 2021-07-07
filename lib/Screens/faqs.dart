import 'package:flutter/material.dart';
import 'package:wyttle_app/data/faqdata.dart';

FaqData faqData = new FaqData();

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQs',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
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
      ),
      body: Container(
        color: Colors.blueGrey[50],
        child: ListView.builder(
          itemCount: faqData.faqs.length,
          itemBuilder: (context, index) {
            return FaqView(faqData.faqs[index]);
          },
        ),
      ),
    );
  }
}

class FaqView extends StatelessWidget {
  final Faq faq;
  FaqView(this.faq);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            faq.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            faq.data,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
