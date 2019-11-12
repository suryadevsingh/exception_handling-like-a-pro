import 'package:httpbloc/api_base_helper.dart';

import 'package:httpbloc/jsonclass.dart';

class MovieRepository {

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Employee>> fetchEmployee()async{
    final surya = await _helper.get('todos');
    return  List<Employee>.from(surya.map((x) => Employee.fromJson(x)));
  }

}