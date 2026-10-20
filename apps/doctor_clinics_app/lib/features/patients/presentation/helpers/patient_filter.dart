/// Patient list filters shown as chips on the patients toolbar.
enum PatientFilter {
  all('patients_filter.all'),
  newPatient('patients_filter.new_patient'),
  followUpSoon('patients_filter.follow_up_soon'),
  indebtedness('patients_filter.indebtedness');

  const PatientFilter(this.labelKey);

  /// Translation key resolved by the chip.
  final String labelKey;
}
