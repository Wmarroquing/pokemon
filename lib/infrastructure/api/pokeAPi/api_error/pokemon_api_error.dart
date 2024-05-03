class ApiException implements Exception{
  @override
  String toString(){
    return 'Something went wrong';
  }
}