import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamestore_ui/components.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double _deviceWidth =MediaQuery.of(context).size.width;
    double _deviceHeight =MediaQuery.of(context).size.height;
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: _deviceWidth*0.2,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: _deviceWidth*0.19,
                backgroundImage: AssetImage("assets/profile_image.png"),
              ),
            ),
          ),
          SizedBox(height: _deviceHeight*0.05,),
          Form(
              key:formKey,
              child:
          SizedBox(
            width:_deviceWidth*0.5,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  textAlign:TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
              ),
              hintStyle: TextStyle(color: Colors.white),
              hintText:  "Email",
            ),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  textAlign:TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    hintText:  "Password",
                  ),
                )

              ],

            ),
          )),
          MaterialButton(
            height: _deviceHeight*0.06,
            minWidth: _deviceWidth*0.25,
            color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              onPressed: (){}, child: Text("LOGIN",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
