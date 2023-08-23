class Sale {
  final int id;
  final String cpfClient;
  final String nameClient;
  final DateTime saleDateTime;
  final double salePrice;
  final double priceDealership;
  final double priceAnderson;
  final double priceSafety;
  final int idCar;

  Sale({
    required this.id,
    required this.cpfClient,
    required this.nameClient,
    required this.saleDateTime,
    required this.salePrice,
    required this.priceDealership,
    required this.priceAnderson,
    required this.priceSafety,
    required this.idCar,
  });
}
