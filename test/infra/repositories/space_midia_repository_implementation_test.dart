import 'package:clean_arch_with_flutter/core/domain/usecases/erros/exceptions.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/infra/datasources/ispace_media_datasource.dart';
import 'package:clean_arch_with_flutter/infra/models/space_media_model.dart';
import 'package:clean_arch_with_flutter/infra/repositories/space_media_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDataSource extends Mock implements ISpaceMediaDatasource{}

void main(){
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp((){
    datasource = MockSpaceMediaDataSource();
    repository = SpaceMediaRepositoryImplementation(datasource);

  });

  final tSpaceMediaModel = SpaceMediaModel(
    description: '',
    mediaType: '',
    mediaUrl: '',
    title:  '',
  );

  final tDate = DateTime.now();

  test('Should return space media model when calls the datasource', () async {
    //arrange
    when(()=> datasource.getSpaceMediaFromDate(tDate))
      .thenAnswer((invocation) async => tSpaceMediaModel);

    //act
    final result = await repository.getSpaceMediaFromDate(tDate);

    // assert
    expect(result, Right(tSpaceMediaModel));
    verify(()=> datasource.getSpaceMediaFromDate(tDate));
  });

    test('Should return a server failure when the call to datasource is unsucessful', () async {
    //arrange
    when(()=> datasource.getSpaceMediaFromDate(tDate))
      .thenThrow(ServerSocketException());

    //act
    final result = await repository.getSpaceMediaFromDate(tDate);

    // assert
    expect(result, Left(ServerFailure() ));
    verify(()=> datasource.getSpaceMediaFromDate(tDate));
  });


}