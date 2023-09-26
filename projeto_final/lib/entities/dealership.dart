class Dealership {
  final String cnpj;
  final String name;
  final String autonomyLevel;
  final String password;
  final int? id;
  final String? photo;

  Dealership({
    required this.cnpj,
    required this.name,
    required this.autonomyLevel,
    required this.password,
    this.id,
    required this.photo,
  });
}
