import 'package:dio/dio.dart';
import 'package:localbitz/models/customer.dart';
import 'package:localbitz/services/conversionIntoModels/conversionIntoCustomer.dart';

class CustomerApiCalls{
  Future registerCustomer(email,userName,password) async {
  Response response;
  var dio = Dio();
  try{
    response = await dio.post('https://localbitz.deta.dev/customers' , data: {
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
}