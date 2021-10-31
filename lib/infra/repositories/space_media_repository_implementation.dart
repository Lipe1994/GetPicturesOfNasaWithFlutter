import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/domain/repositories/ispace_media_repository.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/exceptions.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/infra/datasources/ispace_media_datasource.dart';
import 'package:dartz/dartz.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource dataSource;

  SpaceMediaRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async{
    
    try
    {
      final result = await dataSource.getSpaceMediaFromDate(date);
      return Right(result);
      
    }on ServerSocketException{
      return Left(ServerFailure());
    }on Exception{
      return Left(ServerFailure());
    }
  }
  
}