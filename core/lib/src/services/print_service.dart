import 'dart:typed_data';

/// Contract for handing a PDF to the platform's print/share flow.
///
/// Isolated behind an interface so features never depend on the `printing`
/// package directly.
abstract class PrintService {
  /// Opens the native print dialog on mobile/desktop, or a print-ready tab on
  /// web, for the given PDF bytes.
  Future<void> printPdf({required Uint8List bytes, required String fileName});
}
