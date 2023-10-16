class Cars {
  final int? id;
  final String model;
  final String brand;
  final String plate;
  final int? carYear;
  final String? carPic;
  final double? buyPrice;
  final DateTime? buyDateTime;

  Cars({
    this.id,
    required this.model,
    required this.brand,
    required this.plate,
    this.carYear,
    this.carPic,
    this.buyPrice,
    this.buyDateTime,
  });
}