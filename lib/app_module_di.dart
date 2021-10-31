import 'package:clean_arch_with_flutter/core/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_arch_with_flutter/infra/datasources/endpoints/nasa_endpoints.dart';
import 'package:clean_arch_with_flutter/infra/datasources/space_media_datasource_implementation.dart';
import 'package:clean_arch_with_flutter/infra/http/clients/http_client_implementation.dart';
import 'package:clean_arch_with_flutter/infra/repositories/space_media_repository_implementation.dart';
import 'package:clean_arch_with_flutter/presenter/controllers/home_store.dart';
import 'package:clean_arch_with_flutter/presenter/pages/picture_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AppModuleDI extends Module{

  @override
  List<Bind> get binds => [
    Bind.factory((i) => HomeStore(i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => GetSpaceMediaFromDateUseCase(i())),
    Bind.lazySingleton((i) => SpaceMediaRepositoryImplementation(i())),
    Bind.lazySingleton((i) => SpaceMediaDatasourceImplementation(i())),
    Bind.lazySingleton((i) => NasaApiClient(i())),
    Bind.lazySingleton((i) => NasaEndpoints(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_,__)=> PicturePage())
  ];
}