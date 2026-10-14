import 'dart:typed_data';

import 'package:printing/printing.dart';
import 'package:agreements/core/services/print_service.dart';

class PrintServiceImpl implements PrintService {
  const PrintServiceImpl();

  @override
  Future<void> printPdf({
    required Uint8List bytes,
    required String fileName,
  }) {
    return Printing.layoutPdf(
      onLayout: (_) async => bytes,
      name: fileName,
    );
  }
}
