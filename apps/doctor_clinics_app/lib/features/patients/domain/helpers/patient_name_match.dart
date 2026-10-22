import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// How strongly a typed name points at a patient that is already on file.
enum PatientNameRank { none, contact, likely, exact }

/// Order-sensitive comparison between a typed name and a stored one.
///
/// Names are compared part by part (first, father, grandfather, family): a
/// reordered name belongs to a different person, so parts never match as a set.
/// A single typed part is never enough to flag a duplicate — otherwise every
/// patient sharing a first name would be listed.
abstract final class PatientNameMatch {
  /// Queries shorter than this cannot tell two patients apart.
  static const int minQueryLength = 2;

  /// [PatientNameRank.exact] when both names have the same parts in the same
  /// order, [PatientNameRank.likely] when the typed parts open the stored name,
  /// [PatientNameRank.contact] when a phone or file number matches.
  static PatientNameRank rank(String typed, Patient patient) {
    if (typed.trim().length < minQueryLength) return PatientNameRank.none;
    final query = parts(typed);
    final stored = parts(patient.fullName);
    if (query.length >= 2 && stored.length >= 2) {
      if (stored.length == query.length && _same(query, stored)) {
        return PatientNameRank.exact;
      }
      final opensName =
          stored.length >= query.length &&
          query.last.length >= minQueryLength &&
          _opens(query, stored);
      if (opensName) return PatientNameRank.likely;
    }
    return _contact(typed, patient)
        ? PatientNameRank.contact
        : PatientNameRank.none;
  }

  /// Normalized name parts, Arabic-aware (hamza/alef variants, ta marbuta).
  static List<String> parts(String value) => normalize(
    value,
  ).split(' ').where((part) => part.isNotEmpty).toList(growable: false);

  /// Lower-cases, drops tashkeel/tatweel, unifies alef/ya/ta-marbuta and turns
  /// punctuation into spaces so `أحمد  محمد` and `احمد محمد` compare equal.
  static String normalize(String value) => value
      .toLowerCase()
      .replaceAll(_marks, '')
      .replaceAll(_alefs, 'ا')
      .replaceAll('ى', 'ي')
      .replaceAll('ة', 'ه')
      .replaceAll(_punctuation, ' ')
      .replaceAll(_spaces, ' ')
      .trim();

  static final RegExp _marks = RegExp('[\u064B-\u0652\u0670\u0640]');
  static final RegExp _alefs = RegExp('[أإآٱ]');
  static final RegExp _punctuation = RegExp(r'[^\p{L}\p{N}\s]', unicode: true);
  static final RegExp _spaces = RegExp(r'\s+');

  static bool _same(List<String> query, List<String> stored) {
    for (var index = 0; index < query.length; index++) {
      if (query[index] != stored[index]) return false;
    }
    return true;
  }

  /// Typed parts must equal the stored parts position by position, except the
  /// last one, which is still being written (`Moh` → `Mohamed`).
  static bool _opens(List<String> query, List<String> stored) {
    for (var index = 0; index < query.length; index++) {
      final isLast = index == query.length - 1;
      final matches = isLast
          ? stored[index].startsWith(query[index])
          : stored[index] == query[index];
      if (!matches) return false;
    }
    return true;
  }

  static bool _contact(String typed, Patient patient) {
    final query = normalize(typed).replaceAll(' ', '');
    if (query.length < 3) return false;
    final phones = [
      _digits(patient.phone),
      _digits(patient.phone2),
    ].where((phone) => phone.length >= 3);
    return patient.fileNumber.toLowerCase().contains(query) ||
        phones.any((phone) => phone.contains(query));
  }

  static String _digits(String? value) =>
      (value ?? '').replaceAll(RegExp('[^0-9]'), '');
}
