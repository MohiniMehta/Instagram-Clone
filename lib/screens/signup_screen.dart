import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _bioController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2,child: Container(),),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                // ignore: deprecated_member_use
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64,),
               Stack(
                children: [
                 const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ), 
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(onPressed: () {},
                   icon: const Icon(
                    Icons.add_a_photo
                    )
                   )
                   )
                ],
              ),
              const SizedBox(
                  height: 24,
                ),
              TextFieldInput(
                hintText: "Enter your username", 
                textInputType: TextInputType.text,
                 textEditingController: _usernameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                hintText: "Enter your email", 
                textInputType: TextInputType.emailAddress, textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                hintText: "Enter your password", 
                textInputType: TextInputType.text,
                 textEditingController: _passwordController,
                 isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                hintText: "Enter your bio", 
                textInputType: TextInputType.text,
                 textEditingController: _bioController,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)
                      ),
                    ),
                    color: blueColor, 
                    ),
                    child: const Text('Log in'),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(flex: 2,child: Container(),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8
                      ),
                      child: const Text("Dont't have an account?"),
                    ),
                     GestureDetector(
                      onTap: () {
                        
                      },
                       child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8
                        ),
                        child: const Text("Sign up",
                         style: TextStyle(
                          fontWeight: FontWeight.bold,
                         ),
                        ),
                                         ),
                     )
                  ],
                )
            ],
          ),
        ) 
        ),
    );
  }
}
