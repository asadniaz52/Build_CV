import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportService {
  Future<File> exportPng(GlobalKey boundaryKey, {String fileName = 'cv_a4'}) async {
    final bytes = await _captureBytes(boundaryKey);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.png');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<File> exportPdf(GlobalKey boundaryKey, {String fileName = 'cv_a4'}) async {
    final bytes = await _captureBytes(boundaryKey);
    final document = pw.Document();
    final image = pw.MemoryImage(bytes);

    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (_) {
          return pw.Center(
            child: pw.Image(
              image,
              fit: pw.BoxFit.contain,
            ),
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.pdf');
    await file.writeAsBytes(await document.save(), flush: true);
    return file;
  }

  Future<Uint8List> _captureBytes(GlobalKey boundaryKey) async {
    final boundary = boundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      throw Exception('Preview boundary is not ready.');
    }

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Unable to export image bytes.');
    }
    return byteData.buffer.asUint8List();
  }
}
