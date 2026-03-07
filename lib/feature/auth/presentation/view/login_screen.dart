import 'package:flutter/material.dart';
import 'package:ticket_system/feature/auth/presentation/view/sign_up_screen.dart';
import 'package:ticket_system/feature/dashboard/presentation/view/dashboard_screen.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/helper/screen_size_helper.dart';
import '../../../dashboard/presentation/view/main_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffe696e),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: ScreenHelper.dynamicHeight(context, 0.95)),
          child: Container(
            padding: EdgeInsets.all(ScreenHelper.dynamicHeight(context, 0.2)),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.surfaceLight
                  : AppColor.surfaceDark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenHelper.dynamicHeight(context, 0.5)),
                  topRight: Radius.circular(ScreenHelper.dynamicHeight(context, 0.5))
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  Text("Login",style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: ScreenHelper.getFontSize(context, 45),fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: ScreenHelper.dynamicHeight(context, 0.25),),
                  Image.asset("assets/images/login_page_logo.png",fit: BoxFit.scaleDown,width: 420,height: 300,),
                  SizedBox(height: ScreenHelper.dynamicHeight(context, 0.15),),
                  TextFormField(
                    // controller: controller,
                    // obscureText: obscureText,
                    // validator: validator,
                    // onChanged: onChanged,
                    cursorColor: Theme.of(context).primaryColor, // Use theme primary color
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black87
                          : Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter the email",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade300
                            : Colors.grey.shade600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 1.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: AppColor.error, // Use your app's error color
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : AppColor.surfaceDark, // Use dark theme surface color
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor, // Use theme primary color
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white54,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    // controller: controller,
                    // obscureText: obscureText,
                    // validator: validator,
                    // onChanged: onChanged,
                    cursorColor: Theme.of(context).primaryColor, // Use theme primary color
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black87
                          : Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter the password",
                      prefixIcon: Icon(Icons.lock, color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade300
                          : Colors.grey.shade600,), // Customizing the icon color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 1.0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: AppColor.error, // Use your app's error color
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : AppColor.surfaceDark, // Use dark theme surface color
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor, // Use theme primary color
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white54,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> MainScreen()));
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> ForgetPasswordScreen()));
                            },
                            child: Text("Forget Password?",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 15,
                              decoration: TextDecoration.underline
                            ),),
                          ),
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
                          Text("Don't have account?",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 15,),),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                            },
                            child: Text("Sign up",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 15,fontWeight: FontWeight.bold,
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
