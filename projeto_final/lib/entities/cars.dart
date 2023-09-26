class Cars {
  final int id;
  final String model;
  final String brand;
  final String plate;
  final int carYear;
  final String carPic;
  final double buyPrice;
  final DateTime buyDateTime;
  final double idDealership;
  final String? photo;

  Cars({
    required this.id,
    required this.model,
    required this.brand,
    required this.plate,
    required this.carYear,
    required this.carPic,
    required this.buyPrice,
    required this.buyDateTime,
    required this.idDealership,
    required this.photo,
  });
}

// {
//   "price": "string",
//   "brand": "string",
//   "model": "string",
//   "modelYear": 0,
//   "fuel": "string",
//   "codeFipe": "string",
//   "referenceMonth": "string",
//   "vehicleType": 0,
//   "fuelAcronym": "string"
// }