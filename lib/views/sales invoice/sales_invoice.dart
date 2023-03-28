import 'package:chennai_fab_lite/views/sales%20invoice/sales_invoice2.dart';
import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';
import '../../main.dart';

class SalesInvoice extends StatelessWidget {
  const SalesInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(),
      body: body(width),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width) {
    return SingleChildScrollView(
        child: Container(
      width: width,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sales",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Sales Invoice # ",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black87),
              ),
              SizedBox(
                width: width * 0.3,
                // height: 40,
                child: TextField(
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 10),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Billing Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "Name"),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "Address"),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "Mobile"),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "Email"),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "GstNo")
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          billingTile2(width, "Measured By "),
          const SizedBox(
            height: 15,
          ),
          billingTile2(width, "Ref"),
          const SizedBox(
            height: 15,
          ),
          billingTile2(width, "Prepared by"),
          const SizedBox(
            height: 15,
          ),
          billingTile2(width, "Date "),
          const SizedBox(
            height: 15,
          ),
          billingTile2(width, "GST No "),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: UtilControllers().mainColor),
                onPressed: () {
                  navigatorKey.currentState?.push(
                      MaterialPageRoute(builder: (_) => SalesInvoice2()));
                },
                child: const Text("Continue")),
          )
        ],
      ),
    ));
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  billingTile
  Widget billingTile(double width, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black87),
        ),
        SizedBox(
          width: width * 0.7,
          // height: 40,
          child: TextField(
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
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
                  borderSide: BorderSide(color: UtilControllers().mainColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey.shade500)),
            ),
          ),
        ),
      ],
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/    billingTile2
  Widget billingTile2(double width, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black87),
          ),
          SizedBox(
            width: width * 0.6,
            // height: 40,
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
                    borderSide: BorderSide(color: UtilControllers().mainColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.grey.shade500)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  appbar
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: UtilControllers().mainColor,
      title: const Text("Sales Invoice"),
    );
  }
}
