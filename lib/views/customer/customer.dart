import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';

class Customers extends StatelessWidget {
  Customers({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(),
      body: body(width, height),
      floatingActionButton: floatButton(context, width),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  flaotbutton
  Widget floatButton(BuildContext context, double width) {
    return FloatingActionButton(
      backgroundColor: UtilControllers().mainColor,
      onPressed: () {
        addPopup(context, width);
      },
      child: Icon(Icons.add),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  appbar
  AppBar appbar() {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: UtilControllers().mainColor,
      title: const Text("Customers"),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width, double height) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customer Details",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
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
                      borderSide:
                          BorderSide(color: UtilControllers().mainColor)),
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
                              const Expanded(flex: 2, child: Text("Name")),
                              Expanded(
                                  flex: 5, child: Text(": " + current['name'])),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("Address")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['address'])),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("Mobile")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['mobile'])),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("Email")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['email'])),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 2, child: Text("GstNo")),
                              Expanded(
                                  flex: 5,
                                  child: Text(": " + current['GstNo'])),
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
            //         DataColumn(label: Text('Name.')),
            //         DataColumn(label: Text('Address')),
            //         DataColumn(label: Text('Mobile')),
            //         DataColumn(label: Text('Email')),
            //         DataColumn(label: Text('GstNo')),
            //         DataColumn(label: Text('Edit')),
            //         DataColumn(label: Text('Delete')),
            //       ],
            //       rows: [
            //         DataRow(cells: [
            //           DataCell(Text('sadsd')),
            //           DataCell(Text('sdfds')),
            //           DataCell(Text('45554454554')),
            //           DataCell(Text('abc@gmail.com')),
            //           DataCell(Text('sdf5454545df')),
            //           DataCell(Icon(
            //             Icons.edit,
            //             color: Colors.blue.shade800,
            //           )),
            //           DataCell(Icon(
            //             Icons.delete,
            //             color: Colors.red.shade800,
            //           )),
            //         ]),
            //         DataRow(cells: [
            //           DataCell(Text('sadsd')),
            //           DataCell(Text('sdfds')),
            //           DataCell(Text('45554454554')),
            //           DataCell(Text('abc@gmail.com')),
            //           DataCell(Text('sdf5454545df')),
            //           DataCell(Icon(
            //             Icons.edit,
            //             color: Colors.blue.shade800,
            //           )),
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
          ],
        ),
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
                    "  Enter Customer details",
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
                  textField("Name"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Address"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Mobile"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("Email"),
                  const SizedBox(
                    height: 12,
                  ),
                  textField("GstNo"),
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
      'name': "Glazing bead saw",
      'address': 'HS-201',
      'mobile': "987654123",
      'email': "sda@gmail.com",
      'GstNo': "445sd4s45",
    },
    {
      'name': "Glazing bead saw",
      'address': 'HS-201',
      'mobile': "987654123",
      'email': "sda@gmail.com",
      'GstNo': "445sd4s45",
    },
    {
      'name': "Glazing bead saw",
      'address': 'HS-201',
      'mobile': "987654123",
      'email': "sda@gmail.com",
      'GstNo': "445sd4s45",
    },
    {
      'name': "Glazing bead saw",
      'address': 'HS-201',
      'mobile': "987654123",
      'email': "sda@gmail.com",
      'GstNo': "445sd4s45",
    },
  ];
}
