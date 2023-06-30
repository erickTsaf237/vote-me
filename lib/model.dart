
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class Model{

  static String host = 'http://localhost:3000';
  // static const String host = "https://organisations.adaptable.app";
  // static String host = 'http://localhost:3000';
  static String token='';


  final StreamController _controller = StreamController();

  Stream get stream => _controller.stream;


  Future<bool> save(String path, {String token=''}) async {
    final res = await http.post(Uri.parse("${Model.host}/$path"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        },
        body: jsonEncode(toJson())
    );
    // return await logUserIn(res);
    // print(jsonEncode(res.body));
    // print(res.body);

    return true;
  }

  Future<http.Response> save2(String path, {String token=''}) async {
    final res = await http.post(Uri.parse("${Model.host}/$path"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        },
        body: jsonEncode(toJson())
    );
    // return await logUserIn(res);
    // print(jsonEncode(res.body));
    // print(res.body);

    return res;
  }

  Future<bool> update(String path, {String token=''}) async {
    final res = await http.put(Uri.parse("${Model.host}/$path"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        },
        body: jsonEncode(toJson())
    );
    // return await logUserIn(res);
    // print(jsonEncode(res.body));
    // print(res.body);

    return true;
  }

  static Future<http.Response> getAllByparentId(String path, String id) async {
    var res = await http.get(Uri.parse("${Model.host}/$path/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        }
    );
    // return await logUserIn(res);
    return res;
  }

  getAll(String path, {String? idElement}) async {
    try {
      print("${Model.host}/$path${idElement!=null?'/$idElement':''}");
      var response = await http.get(Uri.parse(idElement!=null?'${Model.host}/$path/$idElement':"${Model.host}/$path"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'authorization': 'Bearer $token'
          }
      );
      // print(response.statusCode);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        _controller.add(response.body);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      _controller.addError(e);
    }
    // return await logUserIn(res);
  }


  static Future<http.Response> delete(String path, String id) async {
    var res = await http.delete(Uri.parse("${Model.host}/$path/$id"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token'
        }
    );
    return res;
  }
   void getOne(String path, String id) async {
    try {
      var response = await http.get(Uri.parse("${Model.host}/$path/$id"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'authorization': 'Bearer $token'
          }
      );
      if (response.statusCode == 200) {
        _controller.add(response.body);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      _controller.addError(e);
    }
    // var res =
    // return res;
  }

   void dispose() {
    _controller.close();
  }

  toJson();
  // toJson2();

  // static getOne(String route, String id){
  //   return http.get('${Model.URLBase}/$route/$id');
  //
  // }


}