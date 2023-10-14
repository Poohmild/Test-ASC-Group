import 'dart:convert';

import 'package:test_dtac/model/information.dart';
import 'package:http/http.dart' as http;

class Service {
  
  Future<List<Infomation>> fetchData() async {
  String url = 'https://randomuser.me/api?results=10';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    if (json['results'] is List) {
      List<Infomation> listResult = (json['results'] as List).map((e) {
        return Infomation.fromJson(e as Map<String, dynamic>);
      }).toList();
      return listResult;
    } else {
      throw Exception('Data is not in the expected format');
    }
  } else {
    throw Exception('Error fetching data');
  }
}

}
