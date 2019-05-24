import '../config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'params.dart';

class EgoApi {
  String apiUrl = BASE_URL;
  String apiKey = API_KEY;
  String methodSignals = 'vehicle/signals';

  static StreamController<Carparams> notificationController = StreamController.broadcast();

  Future<Carparams> getSignal() async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-Api-Key': apiKey,
      };
      final url = apiUrl + methodSignals;
      final response = await http.get(url, headers: headers);
      final responseJson = json.decode(response.body);
      print(responseJson);
      final params = Carparams.fromJson(responseJson);
      notificationController.add(params);
      return params;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Carparams> patchSignal(Carparams carparams) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'X-Api-Key': apiKey,
      };
      final url = apiUrl + methodSignals;
      final body = json.encode(carparams.getPatch());
      print(body);
      final response = await http.patch(url, body: body, headers: headers);
      final responseJson = json.decode(response.body);
      print(responseJson);
      final params = Carparams.fromJson(responseJson);
      notificationController.add(params);
      return params;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }


}