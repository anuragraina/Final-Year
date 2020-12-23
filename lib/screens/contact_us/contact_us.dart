import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Email us : help@mail.com',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text('OR', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Text('Contact us : 9876543210',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
