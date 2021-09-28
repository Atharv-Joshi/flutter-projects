class Customer {
  String? name;
  String? email;
  String? password;
  String? stateUT;
  String? city;
  int? postalCode;
  String? addressLine1;
  String? addressLine2;
  List<dynamic>? favouriteItems;
  List<dynamic>? tokens;
  String? currentToken;

  Customer({
    this.name,
    this.email,
    this.password,
    this.stateUT,
    this.city,
    this.postalCode,
    this.addressLine1,
    this.addressLine2,
    this.favouriteItems,
    this.tokens,
    this.currentToken,
});
}
