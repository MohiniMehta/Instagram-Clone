import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
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
  Uint8List? image;
  bool _isLoading=false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }
  void selectImage() async{
  Uint8List im= await pickImage(ImageSource.gallery);
  setState(() {
    image=im; 
  });
  }
  void signUpUser() async{
    setState(() {
      _isLoading=true;
    });
                    String res= await AuthMethods().signUpUser(
                      email: _emailController.text,
                       password: _passwordController.text,
                        username: _usernameController.text,
                         bio: _bioController.text,
                         file: image!,
                         );
                         setState(() {
      _isLoading=false;
    });
                         if(res !="success"){
                          // ignore: use_build_context_synchronously
                          showSnackBar(res, context);
                         }
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
                image!=null?CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(image!),
                    ): const CircleAvatar(
                    radius: 64,
                    backgroundImage:AssetImage('assets/images/userprofile.jpg'),
                  ), 
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
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
                  onTap: signUpUser,  
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
                    ? const Center(child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                    )
                     :const Text('Sign up'),
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
