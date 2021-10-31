import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRepository{

  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);

}