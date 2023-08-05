
import 'package:dio/dio.dart';


// Define an abstract class for the state of some data that can be either success or failure
abstract class DataState<T> {

  // The data field can be null or non-null depending on the state 
  final T? data;

  // The error field can be null or non-null depending on the state 
  final DioError? error;

  // The constructor takes optional named parameters for data and error const
  const DataState({this.data,this.error});
}

// Define a subclass for the success state
class DataSuccess<T> extends DataState<T> {

  // The constructor takes a non-null data parameter and passes it to the super constructo
  const DataSuccess(T data) : super(data: data);
}

// Define a subclass for the failure state
class DataFalied<T> extends DataState<T>{
  
  // The constructor takes a non-null error parameter and passes it to the super constructor
const DataFalied(DioError error) : super(error: error);
}

