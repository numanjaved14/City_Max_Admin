import 'package:flutter/material.dart';

import '../database/database.dart';

class DiscountDetails extends StatefulWidget {
  var snap;
  DiscountDetails({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<DiscountDetails> createState() => _DiscountDetailsState();
}

class _DiscountDetailsState extends State<DiscountDetails> {
  @override
  void initState() {
    discountController.text = widget.snap['discount'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Service Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                'assets/splash.png',
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Service Type',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                widget.snap['servicetype'] == null
                    ? 'No Data Found'
                    : widget.snap['servicetype'],
                style: TextStyle(color: Colors.black, fontSize: 15),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Service Sub Category',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                widget.snap['serviceCategory'] == null
                    ? 'No Data Found'
                    : widget.snap['serviceCategory'],
                style: TextStyle(color: Colors.black, fontSize: 15),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Discount',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: discountController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Discount Percentage',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  updateDiscount();
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Color(0xff0DC6DF),
                    fixedSize: Size(300, 60)),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController discountController = TextEditingController();

  void updateDiscount() async {
    String res = await Database().updateDiscount(
      uuid: widget.snap['uuid'],
      discount: int.parse(discountController.text),
    );

    if (res == 'Success') {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }
}
