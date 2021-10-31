

import 'package:clean_arch_with_flutter/core/util/date_formater.dart';
import 'package:clean_arch_with_flutter/env.dart';
import 'package:clean_arch_with_flutter/infra/http/clients/http_client_implementation.dart';

class NasaEndpoints{
  final NasaApiClient client;
  String get baseUrl => Env.urlApiNasa;

  NasaEndpoints(this.client);

  Future<HttpResponse> getSpaceMediaFromDate(DateTime date) async  {

    String dateFormated = DateFormater.dateToDateyMMd(date);

    final res =  await client.get(Uri.parse('${Env.urlApiNasa}?api_key=${Env.keyApiNasa}&date=$dateFormated')); 
    return HttpResponse(data: res.body, statusCode: res.statusCode);
  }

}