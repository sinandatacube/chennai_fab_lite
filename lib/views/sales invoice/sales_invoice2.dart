import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../controllers/util_controllers.dart';

class SalesInvoice2 extends StatelessWidget {
  SalesInvoice2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(),
      body: body(width, context, height),
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

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width, BuildContext context, double height) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const  Text(
                  "Products",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      addPopup(context, width);
                    },
                    child:const Text("Add Products"))
              ],
            ),
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
                                  flex: 2, child: Text("Product Name")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['productname'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  flex: 2, child: Text("Product HSN code")),
                              Expanded(
                                  flex: 5,
                                  child:
                                      Text(": " + current['producthsncode'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("HSN code")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['hsncode'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  flex: 2, child: Text("Sqft per window")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['sqftperwindow'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  flex: 2, child: Text("Value per sqft")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['valuepersqft'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  flex: 2, child: Text("Unit price")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['unitprice'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("Quantity")),
                              Expanded(
                                  flex: 5, child: Text(": " + current['qty'])),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("Amount")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['amount'])),
                            ],
                          ),
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
                    // Positioned(
                    //     right: width * 0.01,
                    //     // top: 0,
                    //     bottom: 12,
                    //     child: Icon(
                    //       Icons.edit,
                    //       color: Colors.blue.shade600,
                    //     ))
                  ],
                );
              },
            ),
            // Container(
            //   width: width,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey.shade300)),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: DataTable(
            //       dataRowHeight: 35,
            //       columns: [
            //         DataColumn(label: Text('Product Name.')),
            //         DataColumn(label: Text('Product HSN code')),
            //         DataColumn(label: Text('HSN code')),
            //         DataColumn(label: Text('sqft per window')),
            //         DataColumn(label: Text('Value per sqft')),
            //         DataColumn(label: Text('Unit price')),
            //         DataColumn(label: Text('Quantity')),
            //         DataColumn(label: Text('Amount')),
            //         DataColumn(label: Text("Delete")),
            //       ],
            //       rows: [
            //         DataRow(cells: [
            //           DataCell(Text('asda')),
            //           DataCell(Text('asda')),
            //           DataCell(Text('asda')),
            //           DataCell(Text('54')),
            //           DataCell(Text('45')),
            //           DataCell(Text('54')),
            //           DataCell(Text('4')),
            //           DataCell(Text('5454')),
            //           DataCell(Icon(
            //             Icons.delete,
            //             color: Colors.red.shade800,
            //           )),
            //         ]),
            //         DataRow(cells: [
            //           DataCell(Text('asda')),
            //           DataCell(Text('asda')),
            //           DataCell(Text('asda')),
            //           DataCell(Text('54')),
            //           DataCell(Text('45')),
            //           DataCell(Text('54')),
            //           DataCell(Text('4')),
            //           DataCell(Text('5454')),
            //           DataCell(Icon(
            //             Icons.delete,
            //             color: Colors.red.shade800,
            //           )),
            //         ]),
            //         // more rows...
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Note"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Paid"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Balance"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "CGST Rate(%)"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "CGST Amount"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "SGST Rate(%)"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "SGST Amount"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Total Cost"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Tax(%)"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Tax Amount"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Transport \nCharge"),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Net Amount"),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: UtilControllers().mainColor),
                  onPressed: () {},
                  child:const Text("Save")),
            )
          ],
        ),
      ),
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

  // /\/\/\/\/\/\/\/\/\ add vendor popup
  addPopup(BuildContext context, double width) {
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
                    "  Enter Product details",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
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
                  textField(
                    "Product Name",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Product HSN code"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("HSN code"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("sqft per window"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField(
                    "value per sqft",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  textField(
                    "Unit price",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Quantity"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Amount"),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: UtilControllers().mainColor),
                      onPressed: () {},
                      child: const Text(
                        'Add ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          );
        });
  }

  Widget textField(String hint) {
    return TextField(
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
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  final List data = [
    {
      'productname': "Glazing bead saw",
      'producthsncode': 'HS-201',
      'hsncode': "45s5456",
      'sqftperwindow': "15",
      'valuepersqft': "10",
      'unitprice': "10",
      'qty': "4",
      'amount': "4",
    },
    {
      'productname': "Glazing bead saw",
      'producthsncode': 'HS-201',
      'hsncode': "45s5456",
      'sqftperwindow': "15",
      'valuepersqft': "10",
      'unitprice': "10",
      'qty': "4",
      'amount': "4",
    },
    {
      'productname': "Glazing bead saw",
      'producthsncode': 'HS-201',
      'hsncode': "45s5456",
      'sqftperwindow': "15",
      'valuepersqft': "10",
      'unitprice': "10",
      'qty': "4",
      'amount': "4",
    },
    {
      'productname': "Glazing bead saw",
      'producthsncode': 'HS-201',
      'hsncode': "45s5456",
      'sqftperwindow': "15",
      'valuepersqft': "10",
      'unitprice': "10",
      'qty': "4",
      'amount': "4",
    },
  ];
}
