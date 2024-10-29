import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamestore_ui/components.dart';
import 'package:gamestore_ui/home_page.dart';

class AnimatedProfile extends StatefulWidget {
  const AnimatedProfile({super.key});

  @override
  State<AnimatedProfile> createState() => _AnimatedProfileState();
}

class _AnimatedProfileState extends State<AnimatedProfile> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds:400),
      vsync: this,
    );
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return LoginPage(controller);
  }
}

class LoginPage extends StatelessWidget {
late AnimationController controller;
late EnterAnimaition _animaition;

LoginPage(this.controller){
  controller=controller;
  _animaition = EnterAnimaition(controller);
  controller.forward();
}
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
            child: AnimatedBuilder(
              animation: _animaition.controller,
              builder: (BuildContext context, Widget? _widget){
                return Transform(
                  transform: Matrix4.diagonal3Values(_animaition.circleSize.value, _animaition.circleSize.value, 1),
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
                );
              },

            ),
          ),
        Text("Game Store",style: TextStyle(fontSize: 30,fontFamily: "Source Code Pro Black",color: Colors.white),),
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
              onPressed: () async{
              if (controller.isCompleted) {
    await controller.reverse();
    Navigator.pushReplacement(context, FadePageRoute(HomePage()));
    }}, child: Text("LOGIN",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
class EnterAnimaition {
  EnterAnimaition(this.controller) {
    circleSize = Tween<double>(
      begin: 0, end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }
  AnimationController controller;
  late Animation<double> circleSize;
}


