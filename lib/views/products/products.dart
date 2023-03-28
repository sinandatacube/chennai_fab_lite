import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';

class Products extends StatelessWidget {
  Products({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatButton(width, context),
      appBar: appbar(),
      body: body(width, height),
    );
  }

  FloatingActionButton FloatButton(double width, BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: UtilControllers().mainColor,
        onPressed: () {
          addProduct(context, width);
        },
        label: Text("Add Product"));
  }

  Widget body(double width, double height) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            child: TextField(
              // controller: usernameCtrl,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: UtilControllers().mainColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade500)),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
              ),
            ),
          ),
          Divider(),
          ListView.separated(
            controller: ScrollController(),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var current = data[index];
              return Stack(
                children: [
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: width * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index % 2 == 0
                            ? Colors.white
                            : Colors.grey.shade200,
                        border: Border.all(color: Colors.grey.shade400)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                                flex: 2, child: Text("Product Name :")),
                            Expanded(
                                flex: 5, child: Text(current['productname'])),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                flex: 2, child: Text("Product code   :")),
                            Expanded(flex: 5, child: Text(current['code'])),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                flex: 2, child: Text("UOM                  :")),
                            Expanded(flex: 5, child: Text(current['code'])),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                flex: 2,
                                child: Text("Price                  :")),
                            Expanded(flex: 5, child: Text(current['price'])),
                          ],
                        ),
                        // Text(current['code']),
                        // Text(current['price']),
                      ],
                    ),
                  ),
                  Positioned(
                      right: width * 0.01,
                      top: 8,
                      child: Icon(
                        Icons.close,
                        color: Colors.red.shade900,
                      )),
                  Positioned(
                      right: width * 0.01,
                      // top: 0,
                      bottom: 12,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue.shade600,
                      ))
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: UtilControllers().mainColor,
      title: const Text("Products"),
    );
  }

  final List data = [
    {'productname': "Glazing bead saw", 'code': 'HS-201', 'price': "10.00"},
    {
      'productname': "Manual Corner Cleaning Machine ",
      'code': 'HS-202',
      'price': "10.00"
    },
    {'productname': "Metal cutter", 'code': 'HS-203', 'price': "10.00"},
    {'productname': "Metal cutter", 'code': 'HS-203', 'price': "10.00"},
    {'productname': "Metal cutter", 'code': 'HS-203', 'price': "10.00"},
    {'productname': "Metal cutter", 'code': 'HS-203', 'price': "10.00"},
  ];

  addProduct(BuildContext context, double width) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: width * 0.08),
            titlePadding: EdgeInsets.zero,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "  Enter item details",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
                ],
              ),
            ),
            content: SizedBox(
              width: width * 0.9,
              // height: 120,
              // color: Colors.blue.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // controller: usernameCtrl,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: UtilControllers().mainColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      hintText: "Product name",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    // controller: usernameCtrl,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: UtilControllers().mainColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      hintText: "code",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    // controller: usernameCtrl,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: UtilControllers().mainColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      hintText: "UOM",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    // controller: usernameCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: UtilControllers().mainColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade500)),
                      hintText: "Unit price",
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: UtilControllers().mainColor),
                      onPressed: () {},
                      child: const Text(
                        'Add Item',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
