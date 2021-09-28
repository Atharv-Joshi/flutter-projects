import 'package:localbitz/models/customer.dart';

Customer conversionIntoCustomer(data){
  Customer customer = Customer(
    name: data['customer']['name'],
    email:  data['customer']['email'],
    password:  data['customer']['password'],
    stateUT:  data['customer']['address']['state_UT'],
    city:  data['customer']['address']['city'],
    postalCode:  data['customer']['address']['postalCode'],
    addressLine1:  data['customer']['address']['addressLine1'],
    addressLine2:  data['customer']['address']['addressLine2'],
    favouriteItems:  data['customer']['favouriteItems'],
    tokens:  data['customer']['tokens'],
    currentToken:  data['currentToken'],
  );

  return customer;

}