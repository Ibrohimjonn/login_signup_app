import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepref/model/user_model.dart';
import 'package:sharepref/pages/singup_page.dart';
import 'package:sharepref/services/pref_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {

  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void _doLogin () {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email:email,password:password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {
      print(user!.email),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height:40,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color:Colors.lightBlue[50],
                        borderRadius: BorderRadius.only(
                            bottomLeft:Radius.circular(70),
                            bottomRight: Radius.circular(40)
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/ic_image.png',fit: BoxFit.cover,),
              ),
              Transform.translate(
                  offset: Offset(0,-15),
                child: Column(
                  children:[
                    Text('Welcome back!',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Text('Log in to your existant account of Q Allure',style:TextStyle(color:Colors.grey[500],fontSize: 15),),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                padding: EdgeInsets.only(left: 30, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 2,color: Colors.blue),
                  color: Colors.white,

                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Jhonewilliams@gmail.com',
                    hintStyle: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    icon: Icon(Icons.person_outlined,color: Colors.blue,)
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                padding: EdgeInsets.only(left: 30, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300,blurRadius:50,offset: Offset(0,1))
                  ]

                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    icon: Icon(Icons.lock_open,color: Colors.grey,),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('forget password',style: TextStyle(color: Colors.grey[600]),),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 90),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlue.shade100,blurRadius: 20,offset: Offset(0,10)),
                  ],
                  color: Colors.blue[900],
                ),
                child: FlatButton(
                  onPressed: _doLogin,
                  child: Text("LOG IN",style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(height: 30,),
              Text('Or connect using ',style: TextStyle(color: Colors.grey[500],fontSize: 18),),

              SizedBox(height:15,),
              Container(
                height:45,
                margin:EdgeInsets.symmetric(horizontal: 45),
                child:Row(
                  children: [
                    //facebook button
                    Expanded(flex: 7,
                      child:Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:Colors.blue[800],
                        ),
                        child:Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.facebookF,color:Colors.white,size: 15,),
                              SizedBox(width:10,),
                              Text('Facebook',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1,),
                    //#google button
                    Expanded(flex: 7,
                      child:Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:Colors.redAccent,
                        ),
                        child:Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google,color:Colors.white,size: 15,),
                              SizedBox(width:10,),
                              Text('Google',style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account"),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignupPage.id);
                      },
                      child: Text('Sign Up',style: TextStyle(color: Colors.blue[900],fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
