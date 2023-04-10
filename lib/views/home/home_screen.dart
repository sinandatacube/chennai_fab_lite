import 'package:chennai_fab_lite/views/customer/customer.dart';
import 'package:chennai_fab_lite/views/report/report.dart';
import 'package:chennai_fab_lite/views/settings/settings.dart';
import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';
import '../../main.dart';
import '../products/products.dart';
import '../quotation/quotation.dart';
import '../sales invoice/sales_invoice.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List cardData = [
    {'icon': 'product.png', 'title': 'Products'},
    // {'icon': 'stocks.png', 'title': 'Stock'},
    {'icon': 'quotation.png', 'title': 'Quotation'},
    // {'icon': 'vendor.png', 'title': 'Vendor'},
    // {'icon': 'purchase.png', 'title': 'Purchase'},
    // {'icon': 'ledger.png', 'title': 'Ledger'},
    {'icon': 'customers.png', 'title': 'Customer'},
    {'icon': 'sales_invoice.png', 'title': 'Sales invoice'},
    {'icon': 'report.png', 'title': 'Reports'},
    {'icon': 'settings.png', 'title': 'Settings'},
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: body(width, height, context)),
      backgroundColor: UtilControllers().mainColor,
    );
  }

  ///\/\//\/\/\/\/\/\/\/\/\/\/\/\/\/\/ body
  Widget body(double width, double height, BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.5,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1F8996),
                  Color.fromARGB(255, 43, 176, 194),
                  Color.fromARGB(255, 65, 203, 221)
                ],
              ),
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Column(
            children: [
              Container(
                width: width,
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/logo4.png',
                  height: 60,
                  width: 140,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 155,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/images/user.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: GridView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.03),
                itemCount: cardData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: width * 0.03,
                    mainAxisSpacing: height * 0.02),
                itemBuilder: (context, index) {
                  var current = cardData[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        navigatorKey.currentState?.push(
                            MaterialPageRoute(builder: (_) => Products()));
                      } else if (index == 1) {
                        navigatorKey.currentState?.push(
                            MaterialPageRoute(builder: (_) => Quotation()));
                      } else if (index == 2) {
                        navigatorKey.currentState?.push(
                            MaterialPageRoute(builder: (_) => Customers()));
                      } else if (index == 3) {
                        navigatorKey.currentState?.push(MaterialPageRoute(
                            builder: (_) => const SalesInvoice()));
                      } else if (index == 4) {
                        navigatorKey.currentState?.push(
                            MaterialPageRoute(builder: (_) => const Report()));
                      } else if (index == 5) {
                        navigatorKey.currentState?.push(MaterialPageRoute(
                            builder: (_) => const Settings()));
                      }
                      //else if (index == 3) {
                      //   navigatorKey.currentState
                      //       ?.push(MaterialPageRoute(builder: (_) => Vendor()));
                      // } else if (index == 4) {
                      //   navigatorKey.currentState
                      //       ?.push(MaterialPageRoute(builder: (_) => Purchase()));
                      // } else if (index == 5) {
                      //   navigatorKey.currentState
                      //       ?.push(MaterialPageRoute(builder: (_) => Ledger()));
                      // } else if (index == 6) {
                      //   navigatorKey.currentState?.push(
                      //       MaterialPageRoute(builder: (_) => Customers()));
                      // } else if (index == 7) {
                      //   navigatorKey.currentState?.push(MaterialPageRoute(
                      //       builder: (_) => const SalesInvoice()));
                      // }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/${current['icon']}',
                              height: 55,
                              width: 55,
                            ),
                            Text(
                              current['title'],
                              style: TextStyle(
                                  color: UtilControllers().mainColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            )
                          ]),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }

  // /\/\/\/\/\/\/\/\\/\/\/\ logut dialog
  logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                width: 260.0,
                height: 120.0,
                decoration: const BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'No',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              // willLeave = true;
                              // Navigator.of(context).pop();
                              // SystemNavigator.pop();
                            },
                            child: const Text(
                              'yes',
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
