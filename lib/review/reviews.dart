import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/splash.png',
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '29 Decemeber 2002',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: const Text('Tuesday'),
                                trailing: Text(
                                  "5 Stars",
                                  style: TextStyle(color: Colors.yellow),
                                ),
                                title: Text("Fawad Kaleem "),
                                subtitle: Text("Eden Garden Lahore"),
                              ),
                              Divider()
                            ],
                          );
                        }),
                  ),
                ],
              );
            }),
      ),
    );
    ;
  }
}
