import 'package:chennai_fab_lite/views/quotation/quotation.dart';
import 'package:chennai_fab_lite/views/sales%20invoice/sales_invoice2.dart';
import 'package:chennai_fab_lite/views/widget%20custom/select_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/quotation_controller.dart';
import '../../controllers/util_controllers.dart';
import '../../main.dart';
import '../customer/customer.dart';
import '../widget custom/popup_name.dart';

class SalesInvoice extends StatelessWidget {
  const SalesInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(),
      body: body(width, context),
    );
  }

  // /\/\/\/\/\/\/\/\/\/\/\/\/  body
  Widget body(double width, BuildContext context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Customer"),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          // height: 40,
                          child: TextField(
                            readOnly: true,
                            onTap: () {
                              PopupCustomerName().namePopup(context, width);
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
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade500)),
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
                      Consumer<QuotationController>(
                          builder: (context, value, child) {
                        return SizedBox(
                          width: width * 0.59,
                          // height: 40,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: TextEditingController(
                                text: value.selectedDate == null
                                    ? "Select Date"
                                    : '${value.selectedDate!.day} - ${value.selectedDate!.month} - ${value.selectedDate!.year}'),
                            readOnly: true,
                            onTap: () {
                              SelectDate().selectDate(context);
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
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                billingTile2(width, "Ref"),
              ],
            ),
          ),
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
