import 'package:flutter/material.dart';

class ApointmentDetailsWidget extends StatefulWidget {
  var snap;
  ApointmentDetailsWidget({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<ApointmentDetailsWidget> createState() =>
      _ApointmentDetailsWidgetState();
}

class _ApointmentDetailsWidgetState extends State<ApointmentDetailsWidget> {
  @override
  void initState() {
    debugPrint(widget.snap.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Text(
              'Service Type: ${widget.snap['serviceType']}',
            ),
            Text(
              'Service Category: ${widget.snap['serivceCategory']}',
            ),
            Text(
              'Service Sub Category: ${widget.snap['serivceSubCat']}',
            ),
          ],
        ),
        subtitle: Column(
          children: [
            Text(
              'Quantity: ${widget.snap['quantity']}',
            ),
            Text(
              'Price: ${widget.snap['price']}',
            ),
          ],
        ),
      ),
    );
  }
}
