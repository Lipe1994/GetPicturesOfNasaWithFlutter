import 'package:http/http.dart' as http;

class NasaApiClient extends http.BaseClient {

  final http.Client _client;

  NasaApiClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request);
  }
}



class HttpResponse{
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, required this.statusCode});

  
}