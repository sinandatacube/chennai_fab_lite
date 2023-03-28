import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';
import '../../main.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: UtilControllers().mainColor,
      body: body2(width, height),
    );
  }

  ///\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/ body
  Widget body2(double width, double height) {
    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo1.jpg",
              fit: BoxFit.cover,
              height: 120,
              // width: width * 0.4,
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: usernameCtrl,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: UtilControllers().mainColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                hintText: "username",
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordCtrl,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: UtilControllers().mainColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: UtilControllers().mainColor),
                  onPressed: () {
                    navigatorKey.currentState
                        ?.push(MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
  // Widget body(double width, double height) {
  //   return SingleChildScrollView(
  //       child: Container(
  //     alignment: Alignment.center,
  //     color: Colors.black,
  //     height: height,
  //     width: width,
  //     child: Card(
  //       elevation: 2,
  //       margin: EdgeInsets.symmetric(horizontal: width * 0.1),
  //       child: Container(
  //         width: width,
  //         height: 430,
  //         padding: EdgeInsets.symmetric(horizontal: width * 0.04),
  //         decoration: BoxDecoration(
  //             color: Colors.white, borderRadius: BorderRadius.circular(5)),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             TextField(
  //               controller: usernameCtrl,
  //               // keyboardType: TextInputType.number,
  //               decoration: InputDecoration(
  //                 isDense: true,
  //                 filled: true,
  //                 fillColor: Colors.white,
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   borderSide: BorderSide(color: Colors.grey.shade300),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide:
  //                         BorderSide(color: UtilControllers().mainColor)),
  //                 enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide: BorderSide(color: Colors.grey.shade300)),
  //                 hintText: "username",
  //                 hintStyle: const TextStyle(color: Colors.black),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             TextField(
  //               controller: passwordCtrl,
  //               // keyboardType: TextInputType.number,
  //               decoration: InputDecoration(
  //                 isDense: true,
  //                 filled: true,
  //                 fillColor: Colors.white,
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   borderSide: BorderSide(color: Colors.grey.shade300),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide:
  //                         BorderSide(color: UtilControllers().mainColor)),
  //                 enabledBorder: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                     borderSide: BorderSide(color: Colors.grey.shade300)),
  //                 hintText: "Password",
  //                 hintStyle: const TextStyle(color: Colors.black),
  //               ),
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             SizedBox(
  //               width: width * 0.4,
  //               height: 45,
  //               child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                       backgroundColor: UtilControllers().mainColor,
  //                       foregroundColor: Colors.white),
  //                   onPressed: () {},
  //                   child: const Text(
  //                     "Login",
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  //                   )),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  // }
}
