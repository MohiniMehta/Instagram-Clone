import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool _isLoading=false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
   void loginUser() async{
    setState(() {
      _isLoading=true;
    });
    String res=await AuthMethods().loginUser(
      email: _emailController.text, 
      password: _passwordController.text,
      );
      if(res=="success"){

      }
      else{
        // ignore: use_build_context_synchronously
        showSnackBar(res, context);
      }
      setState(() {
      _isLoading=false;
    });
   }

void navigateToSignup(){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context)=>const SignupScreen()
      )
      );
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
                InkWell(
                  onTap: loginUser,
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
                    child:_isLoading
                    ?const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                      )
                       :const Text('Log in'),
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
                      onTap: navigateToSignup,
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