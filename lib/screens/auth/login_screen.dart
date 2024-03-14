import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/auth/signup_screen.dart';
import 'package:untitled1/screens/home_screen.dart';
import 'package:untitled1/utilities/toast.dart';
import 'package:untitled1/widgets/round_btn.dart';
import 'package:untitled1/widgets/text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passControler = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passControler.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void isLogin(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passControler.text.toString(),
    ).then((value){
      ToastMsg().toastmsg(value.user!.email.toString());
      setState(() {
        loading = false;
      });

    }).onError((error, stackTrace){
      loading = false;
      ToastMsg().toastmsg(error.toString());
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Login Screen', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        helperText: 'enter Email e.g xyz@gmail.com',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabled: true,
                      ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Email';
                      }else{
                        return null;
                      }
                    },
                    ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    obscureText: true,
                      controller: passControler,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabled: true,
                      ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Password';
                      }else{
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            RoundBtn(
                title: 'Login',
                loading: loading,
                onTap: (){
              if(_formKey.currentState!.validate()){
                setState(() {
                  loading = true;
                });

                isLogin();
              }


            }),

            const SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Dont Have an Account?'),
                const SizedBox(width: 5,),
                TextBtn(title: 'SignUp Now', onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                })

              ],
            )
          ],
        ),
      ),
    );
  }
}
