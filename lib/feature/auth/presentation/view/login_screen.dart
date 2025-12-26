import 'package:flutter/material.dart';
import 'package:ticket_system/feature/auth/presentation/view/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffe696e),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Container(
            padding: EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35.0),topRight: Radius.circular(35.0))
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  Text("Login",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Image.asset("assets/images/login_page_logo.png",fit: BoxFit.scaleDown,width: 420,height: 300,),
                  SizedBox(height: 10,),
              TextFormField(
                // controller: controller,
                // obscureText: obscureText,
                // validator: validator,
                // onChanged: onChanged,
                cursorColor: Colors.deepPurple, // Customizing the cursor color
                style: const TextStyle(color: Colors.black87), // Customizing the input text style
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter the email",
                  prefixIcon: Icon(Icons.mail, color: Colors.grey.shade300), // Customizing the icon color
                  border: OutlineInputBorder( // Customizing the default border
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  // enabledBorder: OutlineInputBorder( // Customizing the border when enabled
                  //   borderRadius: BorderRadius.circular(15.0),
                  //   borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                  // ),
                  // focusedBorder: OutlineInputBorder( // Customizing the border when focused
                  //   borderRadius: BorderRadius.circular(15.0),
                  //   borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
                  // ),
                  errorBorder: OutlineInputBorder( // Customizing the border when error
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white, // Customizing the background color
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  labelStyle: const TextStyle(color: Color(0xFFffe696e)), // Customizing the label text style
                  hintStyle: const TextStyle(color: Colors.black),  // Customizing the hint text style
                ),
              ),
                  SizedBox(height: 10,),
                  TextFormField(
                    // controller: controller,
                    // obscureText: obscureText,
                    // validator: validator,
                    // onChanged: onChanged,
                    cursorColor: Colors.deepPurple, // Customizing the cursor color
                    style: const TextStyle(color: Colors.black87), // Customizing the input text style
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter the password",
                      prefixIcon: Icon(Icons.lock, color: Colors.grey.shade300), // Customizing the icon color
                      border: OutlineInputBorder( // Customizing the default border
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      // enabledBorder: OutlineInputBorder( // Customizing the border when enabled
                      //   borderRadius: BorderRadius.circular(15.0),
                      //   borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                      // ),
                      // focusedBorder: OutlineInputBorder( // Customizing the border when focused
                      //   borderRadius: BorderRadius.circular(15.0),
                      //   borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
                      // ),
                      errorBorder: OutlineInputBorder( // Customizing the border when error
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
                      ),
                      filled: true,
                      fillColor: Colors.white, // Customizing the background color
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      labelStyle: const TextStyle(color: Color(0xFFffe696e)), // Customizing the label text style
                      hintStyle: const TextStyle(color: Colors.grey), // Customizing the hint text style
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFFffe696e),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Forget Password?",style: TextStyle(
                              fontSize: 15,color: Colors.black,
                            decoration: TextDecoration.underline
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("Don't have account?",style: TextStyle(
                              fontSize: 15,color: Colors.black,),),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                            },
                            child: Text("Sign up",style: TextStyle(
                              fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
