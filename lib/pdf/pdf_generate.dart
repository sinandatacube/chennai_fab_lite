import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:image/image.dart' as img;

class Pdf {
  final pdf = pw.Document();
  Future<String> createPdf(String custName, String sub, String total,
      String discount, String date, String orderId, double width) async {
//load image
    final imageByteData = await rootBundle.load('assets/images/logo6.jpg');
    // Convert ByteData to Uint8List
    final imageUint8List = imageByteData.buffer
        .asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes);

    final image = pw.MemoryImage(imageUint8List);

    pw.Widget buildTable() {
      return pw.Table.fromTextArray(
        headers: ['Name of Customer', 'Mr Robin', 'Date:13.02.2023'],
        data: [
          ['Place', 'Chalakudy', ' PI NO:-D22136'],
        ],
        headerStyle: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: const pw.TextStyle(
          fontSize: 10,
        ),
        cellAlignment: pw.Alignment.center,
        headerAlignment: pw.Alignment.center,
        border: pw.TableBorder.all(),
        // Optional column widths
        columnWidths: {
          0: pw.FixedColumnWidth(15),
          1: pw.FixedColumnWidth(65),
          2: pw.FixedColumnWidth(20),
        },
      );
    }

    pw.Widget buildTable2() {
      return pw.Table.fromTextArray(
        headers: ['Sl No', 'DESCRIPTION', ' QNTY', 'UNIT PRICE', 'TOTAL'],
        data: [
          ['1', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['2', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['3', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['4', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['5', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['6', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
          ['7', 'Kitchen Bottom', ' 74.12ft', '750.00', '55590.00'],
        ],
        // headerCellDecoration: pw.BoxDecoration(color: PdfColor(10, 20, 30)),
        headerStyle: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: const pw.TextStyle(
          fontSize: 10,
        ),
        cellAlignment: pw.Alignment.center,
        headerAlignment: pw.Alignment.center,
        border: pw.TableBorder.all(),
        // Optional column widths
        columnWidths: {
          0: const pw.FixedColumnWidth(15),
          1: const pw.FixedColumnWidth(30),
          2: const pw.FixedColumnWidth(20),
          3: const pw.FixedColumnWidth(15),
          4: const pw.FixedColumnWidth(20),
        },
      );
    }

    pw.Widget buildTable3() {
      return pw.Table.fromTextArray(
        headers: [
          '',
          'Total',
          ' 407209.00',
        ],
        data: [],
        // headerCellDecoration: pw.BoxDecoration(color: PdfColor(10, 20, 30)),
        headerStyle: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: const pw.TextStyle(
          fontSize: 10,
        ),
        cellAlignment: pw.Alignment.center,
        headerAlignment: pw.Alignment.centerRight,
        border: pw.TableBorder.all(),
        // Optional column widths
        columnWidths: {
          0: pw.FixedColumnWidth(15),
          1: pw.FixedColumnWidth(65),
          2: pw.FixedColumnWidth(20),
        },
      );
    }

    //pdf design statrs here
    pdf.addPage(pw.MultiPage(
      margin: const pw.EdgeInsets.all(20),
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Container(
            width: 560,
            height: 170,
            padding: pw.EdgeInsets.all(15),
            color: PdfColors.black,
            child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Image(image, height: 150, width: 250),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("+91 9876543210",
                            style: pw.TextStyle(
                                color: PdfColors.white, fontSize: 16)),
                        pw.SizedBox(height: 10),
                        pw.Text("abcd@gmail.com",
                            style: pw.TextStyle(
                                color: PdfColors.white, fontSize: 16))
                      ]),
                ])),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: []),
        pw.SizedBox(
          height: 20,
        ),
        pw.Text("Quotation of Modular kitchen With Acp sheet",
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              decoration: pw.TextDecoration.underline,
              fontWeight: pw.FontWeight.bold,
              fontSize: 17,
            )),
        pw.SizedBox(
          height: 20,
        ),
        buildTable(),
        buildTable2(),
        buildTable3(),
        pw.SizedBox(
          height: 15,
        ),
        pw.Container(
            width: width,
            alignment: pw.Alignment.centerLeft,
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("* Terms and Conditions",
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 15,
                      )),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Text(
                      "1 Customer Will be billed after indicating acceptance of this quote.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        // decoration: pw.TextDecoration.underline,
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Text(
                      "2 Payment will due prior to delivery of service and goods.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        // decoration: pw.TextDecoration.underline,
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Text(
                      "3 Final estimate will be according to the actual site measurements.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Text("* Specifications",
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Text("1 Powder coating aluminium profiles.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Text("2 10 year guarantee sheets.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Text("3 Auto close hinges.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                  pw.Text("4 SS baskets.",
                      textAlign: pw.TextAlign.center,
                      style: const pw.TextStyle(
                        fontSize: 13,
                      )),
                  pw.SizedBox(
                    height: 5,
                  ),
                ])),
        pw.SizedBox(
          height: 20,
        ),
        pw.Center(child: pw.Text("----------------------------")),
        pw.Center(child: pw.Text("Thank you for your business"))
      ],
    ));
    //generate
    final output = await getTemporaryDirectory();
    String filename = 'my_pdf_${DateTime.now().millisecondsSinceEpoch}.pdf';
    var filePath = '${output.path}/$filename';
    final file = File(filePath);

    await file.writeAsBytes(await pdf.save());

    return filePath;
  }
}
