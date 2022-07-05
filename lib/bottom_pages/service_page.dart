import 'package:city_max_admin/add/add_service.dart';
import 'package:city_max_admin/details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset('assets/splash.png',height: 50,),
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (builder) => AddService()));
      },child: Icon(Icons.add),),
      body: SingleChildScrollView(
     child:Column(
          children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('29 Decemeber 2002',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                              ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                       
                        ListTile(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (builder) => ServiceDetail())); 
                          },
                            leading: const Text('Tuesday'),
                            
                                                        trailing:  IconButton(
                              onPressed:(){},
                             icon: Icon(Icons.delete,color: Colors.red,),
                             
                            ),
                            title: Text("Service Type"),
                            subtitle: Text("Selected Area"),),
                            Divider()
                      ],
                    );
                        
                  }),
            ),
          ],
        ),
      ),
    
    );
  }
}