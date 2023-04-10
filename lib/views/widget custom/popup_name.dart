import 'package:flutter/material.dart';

class PopupCustomerName {
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
}
