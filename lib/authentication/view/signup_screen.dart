import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button + Login text
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),

                  // Welcome Back
                  Text(
                    "Create\nAccount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.04),

                  // Email label
                  Text(
                    "Your Email",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),

                  // Email field
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFF1E1E1E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Password label
                  Text(
                    "Password",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFF1E1E1E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      // Custom styled Checkbox
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        checkColor: Colors.white,
                        // checkmark color
                        activeColor: Colors.green,
                        // when checked (background color)
                        side: BorderSide(
                          color: Colors.green, // border color when unchecked
                          width: 2,
                        ),
                      ),

                      // Terms & Conditions Text
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white, // default text color
                            ),
                            children: [
                              TextSpan(text: "I agree to the "), // white
                              TextSpan(
                                text: "Terms and Conditions",
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: "\n"), // line break
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ✅ Valid form
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Logging in...")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Divider with OR
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Google Sign in button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Icon(Icons.g_mobiledata,
                          color: Colors.white, size: 28),
                      label: Text(
                        "Sign up with Google",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Apple Sign in button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Icon(Icons.apple, color: Colors.white, size: 28),
                      label: Text(
                        "Sign up with Apple",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 65,
                  ),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
