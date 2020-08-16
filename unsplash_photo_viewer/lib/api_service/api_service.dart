import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/data.dart';

class ApiService {
  static String baseApi = 'https://api.unsplash.com';
  static String clientId =
      'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

  static Future<List<Photo>> fetchPhotos() async {
    var url = '$baseApi/photos?client_id=$clientId';
    var responseApi = await http.get(url);
    var result = [];
    if (responseApi.statusCode == 200) {
      var photos = json.decode(responseApi.body);
      if (photos != null) {
        result = new List<Photo>();
        photos.forEach((p) {
          result.add(new Photo.fromJson(p));
        });
      } else {
        print('Error');
      }
    }
    return result;
  }

  static Future<SearchResult> fetchSearchResult(keyword) async {
    var url = '$baseApi/search/photos?client_id=$clientId&query=$keyword&xp=&per_page=50&page=1';
    var responseApi = await http.get(url);
    var data;
    if (responseApi.statusCode == 200) {
      var resJSON = json.decode(responseApi.body);
      data = SearchResult.fromJson(resJSON);
    } else {
      print('Error');
    }
    return data;
  }
}
