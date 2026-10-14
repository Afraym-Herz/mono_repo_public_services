/// Local data-source for report aggregation queries (Drift).
abstract class IReportDatasource {
  Future<int> countPatients({
    DateTime? from,
    DateTime? to,
  });
  Future<int> countVisits({
    DateTime? from,
    DateTime? to,
  });
  Future<int> totalRevenuePiasters({
    DateTime? from,
    DateTime? to,
  });
  Future<int> totalExpensesPiasters({
    DateTime? from,
    DateTime? to,
  });
  Future<int> totalOutstandingPiasters();
  Future<Map<String, int>> revenueByDay({
    required DateTime from,
    required DateTime to,
  });
}