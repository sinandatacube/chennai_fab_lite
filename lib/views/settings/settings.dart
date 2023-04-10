import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/util_controllers.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(),
      body: body(width, context),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\\\/\/\/\/  appbar
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: UtilControllers().mainColor,
      title: Text("Settings"),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\\\/\/\/\/  body
  Widget body(double width, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: width,
            margin:
                EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 10),
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 10),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Organization Details",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                billingTile(width, "Organisation Name"),
                const SizedBox(
                  height: 20,
                ),
                billingTile(width, "Address"),
                const SizedBox(
                  height: 20,
                ),
                billingTile(width, "Mobile"),
                const SizedBox(
                  height: 20,
                ),
                billingTile(width, "Email"),
                const SizedBox(
                  height: 25,
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: UtilControllers().mainColor),
                        onPressed: () {},
                        child: const Text("Update")))
              ],
            ),
          )
        ],
      ),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/    billingTile
  Widget billingTile(
    double width,
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            // width: width * 0.65,
            // height: 40,
            child: Center(
              child: TextField(
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black87),
                // controller: usernameCtrl,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey.shade500),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          BorderSide(color: UtilControllers().mainColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade500)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
