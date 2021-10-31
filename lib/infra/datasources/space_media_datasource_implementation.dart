

import 'dart:convert';

import 'package:clean_arch_with_flutter/infra/datasources/endpoints/nasa_endpoints.dart';
import 'package:clean_arch_with_flutter/infra/http/clients/http_client_implementation.dart';
import 'package:clean_arch_with_flutter/infra/models/space_media_model.dart';

import 'ispace_media_datasource.dart';

class SpaceMediaDatasourceImplementation implements ISpaceMediaDatasource{
  NasaEndpoints nasaEndpoints;

  SpaceMediaDatasourceImplementation(this.nasaEndpoints);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async{
    var result =  await nasaEndpoints.getSpaceMediaFromDate( date);

    if(result.statusCode == 200){
      return SpaceMediaModel.fromJson(jsonDecode(result.data));
    }

    return throw Exception("Erro ao acessar api externa!");
  }
}