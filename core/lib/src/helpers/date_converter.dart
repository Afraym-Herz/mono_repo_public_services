import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat(
      'yyyy-MM-ddTHH:mm:ss.SSS',
    ).parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm aa').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(time));
  }

  static String dateTimeStringToMonthAndTime(String dateTime) {
    return DateFormat(
      'dd MMM yyyy HH:mm',
    ).format(isoStringToLocalDate(dateTime));
  }

  static String invoiceDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  static String refDate(DateTime dateTime) {
    return DateFormat('MMddhhmmyyyy').format(dateTime);
  }

  static String orderDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String invoiceDateForQr(String dateTime) {
    DateTime now = DateTime.parse(dateTime);
    String formattedDate = DateFormat('yyyy-MM-ddTHH:mm:ss.sss').format(now);
    return formattedDate;
  }

  /// Long weekday date (e.g. `الخميس 15 أكتوبر 2025` / `Thursday 15 October 2025`)
  /// for [localeTag], with digits rendered in that locale's own numerals.
  static String localizedFullDate(DateTime date, String localeTag) =>
      withLocalizedDigits(
        DateFormat('EEEE d MMMM yyyy', localeTag).format(date),
        localeTag,
      );

  /// Compact day + month (e.g. `١٥ أكتوبر` / `15 Oct`) for [date].
  static String localizedShortDate(DateTime date, String localeTag) =>
      withLocalizedDigits(
        DateFormat('d MMM', localeTag).format(date),
        localeTag,
      );

  /// Weekday + day + month (e.g. `السبت ١٧ أكتوبر` / `Saturday 17 Oct`).
  static String localizedWeekdayDate(DateTime date, String localeTag) =>
      withLocalizedDigits(
        DateFormat('EEEE d MMMM', localeTag).format(date),
        localeTag,
      );

  /// Short weekday (e.g. `السبت` / `Sat`) for calendar column headers.
  static String localizedWeekdayShort(DateTime date, String localeTag) =>
      withLocalizedDigits(DateFormat('EEE', localeTag).format(date), localeTag);

  /// Month + year (e.g. `أكتوبر ٢٠٢٥` / `October 2025`) for the month planner.
  static String localizedMonthYear(DateTime date, String localeTag) =>
      withLocalizedDigits(
        DateFormat('MMMM yyyy', localeTag).format(date),
        localeTag,
      );

  /// Clock time (e.g. `٩:٠٠ ص` / `9:00 AM`) for [date] in [localeTag].
  static String localizedTime(DateTime date, String localeTag) =>
      withLocalizedDigits(DateFormat.jm(localeTag).format(date), localeTag);

  /// Clock time for a stored `HH:mm` slot (`22:30` → `١٠:٣٠ م`) in [localeTag].
  /// Returns [slot] unchanged (digits localized) when it is not `HH:mm`.
  static String localizedSlot(String slot, String localeTag) {
    final match = RegExp(r'^(\d{1,2}):(\d{2})').firstMatch(slot.trim());
    if (match == null) return withLocalizedDigits(slot, localeTag);
    return localizedTime(
      DateTime(
        2020,
        1,
        1,
        int.parse(match.group(1)!),
        int.parse(match.group(2)!),
      ),
      localeTag,
    );
  }

  /// Maps western digits to Arabic-Indic ones for Arabic locales, leaving other
  /// locales untouched (intl's bundled `ar` symbols use western digits).
  static String withLocalizedDigits(String input, String localeTag) {
    if (!localeTag.toLowerCase().startsWith('ar')) return input;
    const western = '0123456789';
    const arabic = '٠١٢٣٤٥٦٧٨٩';
    final buffer = StringBuffer();
    for (final rune in input.runes) {
      final char = String.fromCharCode(rune);
      final index = western.indexOf(char);
      buffer.write(index == -1 ? char : arabic[index]);
    }
    return buffer.toString();
  }
}
