import 'package:flutter_test/flutter_test.dart';

import 'package:core/core.dart';
import 'package:doctor_clinics_app/app.dart';

/// Smoke test for the monorepo wiring (no Firebase, no EasyLocalization).
void main() {
  testWidgets('DoctorClinicsApp boots with placeholder router', (
    WidgetTester tester,
  ) async {
    await initDependencies();
    await tester.pumpWidget(const DoctorClinicsApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(DoctorClinicsApp), findsOneWidget);
  });
}
