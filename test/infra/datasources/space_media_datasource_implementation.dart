import 'package:clean_arch_with_flutter/infra/datasources/endpoints/nasa_endpoints.dart';
import 'package:clean_arch_with_flutter/infra/datasources/ispace_media_datasource.dart';
import 'package:clean_arch_with_flutter/infra/datasources/space_media_datasource_implementation.dart';
import 'package:clean_arch_with_flutter/infra/http/clients/http_client_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../static_mocks/space_media.dart';
import '../../static_mocks/space_media_model.dart';

class NasaEndpointsMocking extends Mock implements NasaEndpoints{
  
}

void main(){
  late ISpaceMediaDatasource datasource;
  late NasaEndpoints nasaEndpoints;

  final tDateTime = DateTime.now();

  setUp((){
    nasaEndpoints = NasaEndpointsMocking();
    datasource = SpaceMediaDatasourceImplementation(nasaEndpoints);
  });
  final dateFormated = tDateTime.toString().split(' ');

  final urlExpected = 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=${dateFormated}';

  test('Should call the get method with correct url', ()async {
    when(()=> nasaEndpoints.getSpaceMediaFromDate(any())).thenAnswer((invocation) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    
    await datasource.getSpaceMediaFromDate(tDateTime);

    verify(()=> nasaEndpoints.getSpaceMediaFromDate(tDateTime)).called(1);
  });

  test('Should return a SpaceMediaModel when is successsful', () async {

    when(()=> nasaEndpoints.getSpaceMediaFromDate(any())).thenAnswer((invocation) async => HttpResponse(data: spaceMediaMock, statusCode: 200));

    final result = await datasource.getSpaceMediaFromDate(tDateTime);

    expect(result, tSpaceMediaModel);
  });

  test('Should throw s ServerException when the call is unccessful', () async{
    when(()=> nasaEndpoints.getSpaceMediaFromDate(any())).thenAnswer((invocation) async => HttpResponse(data: Exception(), statusCode: 500));

    final result = datasource.getSpaceMediaFromDate(tDateTime);

    expect(()=> result, throwsA(Exception()));
  });
}