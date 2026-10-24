import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor.freezed.dart';
part 'vendor.g.dart';

/// Supplier / shop the clinic buys tools, equipment and supplies from.
@freezed
class Vendor with _$Vendor {
  const factory Vendor({
    required int id,
    required String name,
    String? phone,
    String? notes,
    required DateTime createdAt,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
