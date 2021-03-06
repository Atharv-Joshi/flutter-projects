import 'package:dio/dio.dart';
import 'package:localbitz/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomerApiCalls{
  final baseUrl = 'https://localbitz.deta.dev';


  Future registerCustomer(email,userName,password) async {
  Response response;
  var dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  try{
    response = await dio.post('$baseUrl/customers' , data: {
      'name' : userName,
      'email' : email,
      'password' : password
    });
    Customer customer = Customer.fromJSON(response.data);
    pref.setString('customerId', customer.id ?? '');
    return customer;
  }
  on DioError catch(e){
    if(e.response != null){
      return e.response!.data;
    }
  }
  }

  Future loginCustomer(email,password) async {
    Response response;
    var dio = Dio();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try{
      response = await dio.post('$baseUrl/customers/login' , data: {
        'email' : email,
        'password' : password
      }
      );
      Customer customer = Customer.fromJSON(response.data);
      pref.setString('customerId', customer.id ?? '');
      return customer;
    }
    on DioError catch(e){
      if(e.response != null){
        return e.response!.data;
      }
    }
  }

}