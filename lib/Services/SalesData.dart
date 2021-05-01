class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['year'].toString(),
      parsedJson['sales'] as double,
    );
  }
}
