class Customer {
  String? name;
  String? id;
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
    this.id,
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

  factory Customer.fromJSON(Map<String, dynamic> json){
    return Customer(
      name: json['customer']['name'],
      id: json['customer']['_id'],
      email:  json['customer']['email'],
      password:  json['customer']['password'],
      stateUT:  json['customer']['address']['state_UT'],
      city:  json['customer']['address']['city'],
      postalCode:  json['customer']['address']['postalCode'],
      addressLine1:  json['customer']['address']['addressLine1'],
      addressLine2:  json['customer']['address']['addressLine2'],
      favouriteItems:  json['customer']['favouriteItems'],
      tokens:  json['customer']['tokens'],
      currentToken:  json['currentToken'],
    );
  }
}
