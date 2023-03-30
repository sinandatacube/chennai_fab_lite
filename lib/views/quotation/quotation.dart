import 'package:chennai_fab_lite/views/customer/customer.dart';
import 'package:chennai_fab_lite/views/quotation/quotation2.dart';
import 'package:flutter/material.dart';

import '../../controllers/util_controllers.dart';
import '../../main.dart';

class Quotation extends StatelessWidget {
  const Quotation({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(width),
      body: SafeArea(bottom: false, child: body(width, height, context)),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width, double height, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.01),
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
                    "Page 1/2",
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
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Billing Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Name"),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.58,
                            // height: 40,
                            child: TextField(
                              readOnly: true,
                              onTap: () {
                                namePopup(context, width);
                              },
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
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: UtilControllers().mainColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500)),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Customers().addPopup(context, width);
                            },
                            icon: const Icon(Icons.add),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  billingTile(width, "Address"),
                  const SizedBox(
                    height: 15,
                  ),
                  // billingTile(width, "GST no     :"),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  billingTile(width, "Mobile"),
                  const SizedBox(
                    height: 15,
                  ),
                  billingTile(width, "Email "),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            billingTile2(width, "Measured By"),
            const SizedBox(
              height: 15,
            ),
            billingTile2(width, "Ref  "),
            const SizedBox(
              height: 15,
            ),
            billingTile2(width, "Prepared by  "),
            const SizedBox(
              height: 15,
            ),
            // /\/\/\/\/\/\//\\// select date
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    width: width * 0.65,
                    // height: 40,
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        selectDate(context);
                      },
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade500)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // billingTile2(width, "Date  "),
            const SizedBox(
              height: 15,
            ),
            // billingTile2(width, "GST No        :"),
            // const SizedBox(
            //   height: 15,
            // ),
            SizedBox(
              width: width * 0.4,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: UtilControllers().mainColor),
                  onPressed: () {
                    navigatorKey.currentState?.push(MaterialPageRoute(
                        maintainState: true,
                        fullscreenDialog: true,
                        builder: (_) => QuotationAddItems()));
                  },
                  child: const Text(
                    "Continue",
                  )),
            )
          ],
        ),
      ),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  appbar
  AppBar appbar(double width) {
    return AppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: UtilControllers().mainColor,
      title: const Text("Quotation"),
      actions: [
        SizedBox(
          width: width * 0.03,
        )
      ],
    );
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
            readOnly: true,
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
            width: width * 0.65,
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

  // /\/\/\/\/\/\/\/\\/\/\/\/\/\/\/ select customer popup
  namePopup(BuildContext context, double width) {
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
                    "Select Customer",
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
                        child: const Text("Name of Customer"),
                      );
                    }),
              ],
            ),
          );
        });
  }

  // /\/\/\/\/\/\\\/\//\ select date

  Future<DateTime?> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      return picked;
    } else {
      return selectedDate;
    }
  }
}
