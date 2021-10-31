import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/domain/repositories/ispace_media_repository.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUseCase implements UseCase<SpaceMediaEntity, DateTime >{
  final ISpaceMediaRepository repositoy;

  GetSpaceMediaFromDateUseCase(this.repositoy);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repositoy.getSpaceMediaFromDate(date);
  }

}