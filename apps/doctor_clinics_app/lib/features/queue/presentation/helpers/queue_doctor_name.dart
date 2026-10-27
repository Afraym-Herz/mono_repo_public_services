import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../cubit/queue_cubit.dart';

/// Doctor name for the active locale, falling back to Arabic when the English
/// template name is empty.
String queueDoctorName(BuildContext context, QueueState state) {
  if (context.locale.languageCode == AppConstants.printLanguageAr) {
    return state.doctorNameAr;
  }
  return state.doctorNameEn.isEmpty ? state.doctorNameAr : state.doctorNameEn;
}
