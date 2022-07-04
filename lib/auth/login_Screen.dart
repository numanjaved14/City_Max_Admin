import 'package:city_max_admin/main/mainscreen.dart';
import 'package:city_max_admin/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  
  @override
  Widget build(BuildContext context) {
     TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
      bool _isLoading = false;
       @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passController.clear();
  }
    return Scaffold(
      body:SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/splash.png',width: 219,height: 60,),
               Container(
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                 child: TextFormInputField(
                    hintText: 'Enter your Email',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
               ),
                SizedBox(
                  height: 10,
                ),
                Container(
                                  margin: EdgeInsets.only(left: 20,right: 20),

                  child: TextFormInputField(
                    
                    hintText: 'Enter your Password',
                    textInputType: TextInputType.visiblePassword,
                    controller: passController,
                    isPass: true,
                  ),
                ),
                   SizedBox(
                  height: 23,
                ),
                ElevatedButton(
                     onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()));
                     },
                            
                           style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                             primary:  Color(0xff0DC6DF),
                             fixedSize: Size(300, 60)
                           ),
                            child:  Text('Login',style: TextStyle(color: Colors.white),),
                           
                          
                          
                  ),
            ],
          
        ),
      ),
    );
  }
}