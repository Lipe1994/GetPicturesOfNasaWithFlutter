import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/domain/repositories/ispace_media_repository.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRepositoy extends Mock implements ISpaceMediaRepository{
  
}

void main() async {
  late GetSpaceMediaFromDateUseCase useCase;
  late ISpaceMediaRepository repository;


  setUp((){
    repository = MockSpaceMediaRepositoy();
    useCase = GetSpaceMediaFromDateUseCase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(mediaType: 'image', title: 'title', mediaUrl: 'mediaUrl.jpg', description: 'Teste');
  final tDate = DateTime.now();


  test('should get space media entity for a given date from the repository', () async{
    when(() => repository.getSpaceMediaFromDate(tDate))
    .thenAnswer((_) async => Right<Failure,SpaceMediaEntity>(tSpaceMedia));

    final result = await useCase.call(tDate);

    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate));
  });

    test('should return a failure when don´t succeed', () async{
    when(() => repository.getSpaceMediaFromDate(tDate))
    .thenAnswer((_) async => Left<Failure,SpaceMediaEntity>(ServerFailure()));

    final result = await useCase.call(tDate);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate));
  });
}