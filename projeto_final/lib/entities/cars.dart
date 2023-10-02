class Cars {
  final int? id;
  final String model;
  final String brand;
  final String plate;
  final String carYear;
  final String? carPic;
  final String buyPrice;
  final DateTime buyDateTime;
  final int? idDealership;

  Cars({
    this.id,
    required this.model,
    required this.brand,
    required this.plate,
    required this.carYear,
    required this.carPic,
    required this.buyPrice,
    required this.buyDateTime,
    this.idDealership,
  });
}