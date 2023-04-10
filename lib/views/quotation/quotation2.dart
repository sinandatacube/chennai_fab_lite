import 'package:chennai_fab_lite/main.dart';
import 'package:chennai_fab_lite/pdf/pdf_generate.dart';
import 'package:chennai_fab_lite/views/products/products.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import '../../controllers/util_controllers.dart';

class QuotationAddItems extends StatelessWidget {
  QuotationAddItems({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // floatingActionButton: floatButton(context, width, height),
      appBar: appbar(context, width, height),
      body: body(width),
      bottomNavigationBar: bottom(width, context),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  bottom
  Widget bottom(double width, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      width: width,
      height: 275,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: width,
            margin: const EdgeInsets.only(bottom: 17),
            height: 15,
            child: const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 35,
            ),
          ),
          Container(
            // margin: EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
            child: Column(
              children: [
                billingTile2(
                  width,
                  "Total cost",
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                            "Tax %",
                            textAlign: TextAlign.right,
                            style: TextStyle(
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: UtilControllers().mainColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 0,
                      ),
                      const Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "Tax \nAmount",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          )),
                      const SizedBox(
                        width: 0,
                      ),
                      Expanded(
                        flex: 3,
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: UtilControllers().mainColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                billingTile2(
                  width,
                  "Other charges",
                ),
                const SizedBox(
                  height: 8,
                ),
                billingTile2(
                  width,
                  "Net Amount",
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 18,
                            height: 18,
                            child: Checkbox(value: false, onChanged: (val) {})),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Print without image",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: UtilControllers().mainColor),
                        onPressed: () async {
                          String filePath = await Pdf().createPdf(
                              "custName",
                              "sub",
                              "total",
                              "discount",
                              "date",
                              "orderId",
                              width);
                          // navigatorKey.currentState?.push(
                          //     MaterialPageRoute(builder: (_) => HomeScreen()));
                          await OpenFile.open(filePath);
                        },
                        child: const Text("Save"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  FloatingActionButton

  FloatingActionButton floatButton(
      BuildContext context, double width, double height) {
    return FloatingActionButton.extended(
      isExtended: true,
      backgroundColor: UtilControllers().mainColor,
      label: const Text("Add item"),
      onPressed: () {
        Products().addProduct(
          context,
          width,
        );
      },
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  appbar
  AppBar appbar(BuildContext context, double width, double height) {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: UtilControllers().mainColor,
      title: const Text("Add items"),
      actions: [
        TextButton(
            onPressed: () {
              addProduct(context, width, height);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ))
      ],
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Quotation #",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      const Text(
                        "QTN103",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ],
                  ),
                  const Text(
                    "Page 2/2",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.5,
            ),
            ListView.separated(
                controller: ScrollController(),
                separatorBuilder: (context, index) => SizedBox(
                      width: width,
                      height: 6,
                    ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            productCardTile(
                                "Product Name ", current['productname']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile("code ", current['code']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile(
                                "Sq.ft per windows", current['sqftperwindow']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile(
                                "value per sqft", current['valuepersqft']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile("Unit price", current['price']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile("quantity", current['qty']),
                            const SizedBox(
                              height: 6,
                            ),
                            productCardTile("Amount", current['amount']),
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
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget productCardTile(String title, txt2) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(title)),
        Expanded(flex: 5, child: Text(": " + txt2)),
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
            flex: 5,
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

  // /\/\/\/\/\/\/\/\/\/\/\/\/    billingTile
  Widget billingTile(double width, String title, String trailingTitle) {
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
          Expanded(
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Text(trailingTitle))))
        ],
      ),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/\/ add products
  addProduct(BuildContext context, double width, double height) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
              // titlePadding: EdgeInsets.zero,
              child: SizedBox(
                width: width,
                // height: height - 60,
                //
                child: SingleChildScrollView(
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                      Container(
                        width: width,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Product Details"),
                            const SizedBox(
                              height: 15,
                            ),
                            // /\/\/\/\/\/\//\\ details
                            Container(
                              width: width,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border:
                                      Border.all(color: Colors.grey.shade400)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const Text(" Details"),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  // customer
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Expanded(
                                          flex: 2,
                                          child:
                                              Center(child: Text("Product"))),
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.43,
                                              // height: 40,
                                              child: TextField(
                                                readOnly: true,
                                                onTap: () {
                                                  selectProductPopup(
                                                      context, width);
                                                },
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.black87),
                                                // controller: usernameCtrl,
                                                // keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.all(8),
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      borderSide: BorderSide(
                                                          color:
                                                              UtilControllers()
                                                                  .mainColor)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .shade500)),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Products()
                                                    .addProduct(context, width);
                                              },
                                              icon: const Icon(Icons.add),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  billingTile2(width, "Code"),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // /\/\/\/\/\/\/\/\/\ note
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              "Description",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
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
                                          flex: 5,
                                          // width: width * 0.65,
                                          // height: 40,
                                          child: Center(
                                            child: TextField(
                                              maxLines: 4,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.black87),
                                              // controller: usernameCtrl,
                                              // keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(8),
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    borderSide: BorderSide(
                                                        color: UtilControllers()
                                                            .mainColor)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .shade500)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // // /\/\/\/\/\/\//\\  size(mm)
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     const Expanded(
                                  //       flex: 2,
                                  //       child: Center(
                                  //         child: Text(
                                  //           "Size(mm)    ",
                                  //           style: TextStyle(
                                  //               fontWeight: FontWeight.w400,
                                  //               fontSize: 13,
                                  //               color: Colors.black87),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Expanded(
                                  //       flex: 4,
                                  //       child: Row(
                                  //         children: [
                                  //           SizedBox(
                                  //             width: width * 0.2,
                                  //             // height: 40,
                                  //             child: TextField(
                                  //               style: const TextStyle(
                                  //                   fontWeight: FontWeight.w400,
                                  //                   fontSize: 15,
                                  //                   color: Colors.black87),
                                  //               // controller: usernameCtrl,
                                  //               // keyboardType: TextInputType.number,
                                  //               decoration: InputDecoration(
                                  //                 contentPadding:
                                  //                     const EdgeInsets.all(8),
                                  //                 isDense: true,
                                  //                 filled: true,
                                  //                 fillColor: Colors.white,
                                  //                 border: OutlineInputBorder(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           5.0),
                                  //                   borderSide: BorderSide(
                                  //                       color: Colors
                                  //                           .grey.shade500),
                                  //                 ),
                                  //                 focusedBorder: OutlineInputBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             5.0),
                                  //                     borderSide: BorderSide(
                                  //                         color:
                                  //                             UtilControllers()
                                  //                                 .mainColor)),
                                  //                 enabledBorder:
                                  //                     OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(
                                  //                                     5.0),
                                  //                         borderSide: BorderSide(
                                  //                             color: Colors.grey
                                  //                                 .shade500)),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           const Text(
                                  //             "  W",
                                  //             style: TextStyle(
                                  //                 fontWeight: FontWeight.w400,
                                  //                 fontSize: 15,
                                  //                 color: Colors.black87),
                                  //           ),
                                  //           const SizedBox(
                                  //             width: 10,
                                  //           ),
                                  //           SizedBox(
                                  //             width: width * 0.2,
                                  //             // height: 40,
                                  //             child: TextField(
                                  //               style: const TextStyle(
                                  //                   fontWeight: FontWeight.w400,
                                  //                   fontSize: 15,
                                  //                   color: Colors.black87),
                                  //               // controller: usernameCtrl,
                                  //               // keyboardType: TextInputType.number,
                                  //               decoration: InputDecoration(
                                  //                 contentPadding:
                                  //                     const EdgeInsets.all(8),
                                  //                 isDense: true,
                                  //                 filled: true,
                                  //                 fillColor: Colors.white,
                                  //                 border: OutlineInputBorder(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           5.0),
                                  //                   borderSide: BorderSide(
                                  //                       color: Colors
                                  //                           .grey.shade500),
                                  //                 ),
                                  //                 focusedBorder: OutlineInputBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             5.0),
                                  //                     borderSide: BorderSide(
                                  //                         color:
                                  //                             UtilControllers()
                                  //                                 .mainColor)),
                                  //                 enabledBorder:
                                  //                     OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(
                                  //                                     5.0),
                                  //                         borderSide: BorderSide(
                                  //                             color: Colors.grey
                                  //                                 .shade500)),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           const Text(
                                  //             "  h",
                                  //             style: TextStyle(
                                  //                 fontWeight: FontWeight.w400,
                                  //                 fontSize: 15,
                                  //                 color: Colors.black87),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // // /\/\/\/\/\/\//\\ size(mm) ends here
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  billingTile(width, "Total sqFt", "Pcs"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  billingTile(width, "Unit Price", "Rs"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  billingTile(width, "Quantity", "Pcs"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  billingTile(width, "Amount", "Rs"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            UtilControllers().mainColor),
                                    onPressed: () {
                                      Pdf().createPdf(
                                          "custName",
                                          "sub",
                                          "total",
                                          "discount",
                                          "date",
                                          "orderId",
                                          width);
                                    },
                                    child: const Text("Add")),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade400),
                                    onPressed: () {
                                      navigatorKey.currentState?.pop();
                                    },
                                    child: const Text("Cancel")),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  // /\/\/\/\/\/\/\/\\/\/\/\/\/\/\/ select product popup
  selectProductPopup(BuildContext context, double width) {
    return showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            // height: 300,
            width: width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 7),
                  child: Text(
                    "Select Product",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Divider(),
                ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: 10),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02,
                        ),
                        height: 50,
                        width: width,
                        color: index % 2 == 0
                            ? Colors.grey.shade300
                            : Colors.white,
                        child: const Text("Name of Product"),
                      );
                    }),
              ],
            ),
          );
        });
  }

  final List data = [
    {
      'productname': "Glazing bead saw",
      'code': 'HS-201',
      'sqftperwindow': "101",
      'amount': "200000",
      "valuepersqft": "2000",
      'price': "10.00",
      'qty': "100",
    },
    {
      'productname': "Manual Corner Cleaning Machine ",
      'code': 'HS-202',
      'price': "10.00",
      'qty': "100",
      'sqftperwindow': "101",
      'amount': "200000",
      "valuepersqft": "2000",
    },
    {
      'productname': "Manual Corner Cleaning Machine ",
      'code': 'HS-202',
      'price': "10.00",
      'qty': "100",
      'sqftperwindow': "101",
      'amount': "200000",
      "valuepersqft": "2000",
    },
    {
      'productname': "Manual Corner Cleaning Machine ",
      'code': 'HS-202',
      'price': "10.00",
      'qty': "100",
      'sqftperwindow': "101",
      'amount': "200000",
      "valuepersqft": "2000",
    },
  ];

//   // /\\/\/\/\/\/\/\/\//\ create pdf
//   Future<void> generatePDF() async {
//     // Create a PDF document
//     final pdf = pw.Document();

//     // Add a page to the PDF document
//     pdf.addPage(pw.Page(
//       build: (pw.Context context) => pw.Center(
//         child: pw.Text('Hello, World!'),
//       ),
//     ));
//     checkPermission();
//     // Save the PDF document to a file
//     // final file = File('example.pdf');
//     Directory appDocDirectory = await getApplicationDocumentsDirectory();

//     Directory(appDocDirectory.path + '/' + 'dir')
//         .create(recursive: true)
// // The created directory is returned as a Future.
//         .then((Directory directory) {
//       print('Path of New Dir: ' + directory.path);
//     });
//     // await file.writeAsBytes(await pdf.save());
//   }

//   //check storage permission
//   Future<void> checkPermission() async {
//     final permissionStatus = await Permission.storage.status;
//     if (permissionStatus.isDenied) {
//       await Permission.storage.request();
//     }
  // }
}
