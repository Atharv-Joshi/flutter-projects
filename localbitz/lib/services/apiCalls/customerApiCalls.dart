import 'package:dio/dio.dart';
import 'package:localbitz/models/customer.dart';
import 'package:localbitz/services/conversionIntoModels/conversionIntoCustomer.dart';

class CustomerApiCalls{

  final baseUrl = 'https://localbitz.deta.dev';

  Future registerCustomer(email,userName,password) async {
  Response response;
  var dio = Dio();
  try{
    response = await dio.post('$baseUrl/customers' , data: {
      'name' : userName,
      'email' : email,
      'password' : password
    });

    Customer customer = conversionIntoCustomer(response.data);
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
    try{
      response = await dio.post('$baseUrl/customers/login' , data: {
        'email' : email,
        'password' : password
      }
      );
      Customer customer = conversionIntoCustomer(response.data);
      return customer;
    }
    on DioError catch(e){
      if(e.response != null){
        return e.response!.data;
      }
    }
  }

}