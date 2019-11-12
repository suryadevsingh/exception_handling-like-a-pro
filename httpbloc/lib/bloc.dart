import 'dart:async';
import 'package:httpbloc/api_responce.dart';
import 'package:httpbloc/jsonclass.dart';
import 'package:httpbloc/respository.dart';

//class Emloyeesbloc{
//
//  var _employeeStreamController = StreamController<List<Employee>>();
//
//  Stream<List<Employee>> get streamcounter => _employeeStreamController.stream;
//
//  StreamSink<List<Employee>> get employeeeData => _employeeStreamController.sink;
//
//  Emloyeesbloc(){
//    Future<List<Employee>> empLists= fetchEmployee();
//    empLists.then((result){
//      employeeeData.add(result);
//    fetchList();
//    });
//  }
//  Future<List<Employee>> fetchEmployee()async{
//    final surya = await http.get('https://jsonplaceholder.typicode.com/todos');
//
//    return  employeeFromJson(surya.body);
//  }
//  fetchList() async {
//    employeeeData.add(ApiResponse.loading('Fetching stream'));
//    try {
//      List<Employee> daata = await  streamcounter.fetchList();
//      employeeeData.add(ApiResponse.completed(daata));
//    } catch (e) {
//      employeeeData.add(ApiResponse.error(e.toString()));
//      print(e);
//    }
//  }
//  dispose(){
//    _employeeStreamController.close();
//  }
//}

class  Emloyeesbloc {
  MovieRepository Repository;

  StreamController _employeeListController;

  StreamSink<ApiResponse<List<Employee>>> get employeeListSink =>
      _employeeListController.sink;

  Stream<ApiResponse<List<Employee>>> get employeeListStream =>
      _employeeListController.stream;

  Emloyeesbloc() {
   _employeeListController =StreamController<ApiResponse<List<Employee>>>();
   Repository = MovieRepository();
    fetchEmployee();
  }

  fetchEmployee() async {
    employeeListSink.add(ApiResponse.loading('Fetching stream data'));
    try {

      var employees = await Repository.fetchEmployee();
      employeeListSink.add(ApiResponse.completed(employees));
    } catch (e) {
      employeeListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _employeeListController?.close();
  }
}
