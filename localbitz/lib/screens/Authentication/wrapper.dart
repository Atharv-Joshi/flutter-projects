// import 'package:flutter/material.dart';
// import 'package:localbitz/screens/Authentication/getting_started.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:localbitz/screens/home.dart';
// import 'package:get/get.dart';
//
// class Wrapper extends StatefulWidget {
//   const Wrapper({Key? key}) : super(key: key);
//   @override
//   State<Wrapper> createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//    String? customerId;
//
//   void checkIfLoggedIn() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     customerId = pref.getString('customerId');
//     if(customerId != null){
//       Get.to(() => Home(), duration: Duration(seconds: 1), transition: Transition.native);
//     }
//     else{
//       Get.to(() => SignupSignIn());
//     }
//   }
//
//   @override
//   void initState() {
//     checkIfLoggedIn();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//       ),
//     );
//   }
// }
