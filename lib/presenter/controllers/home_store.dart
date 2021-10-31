import 'package:clean_arch_with_flutter/core/domain/entities/space_media_entity.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';

class HomeStore extends NotifierStore<Failure, SpaceMediaEntity>{

  final GetSpaceMediaFromDateUseCase useCase;

  HomeStore(this.useCase) : super(SpaceMediaEntity(mediaType: '', title: '', mediaUrl: '', description: ''));

  getSpaceMediaFromDate(DateTime date) async{
    setLoading(true);
    final result = await useCase.call(date);

    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);

    //executeEither(() =>  useCase(date) as Future<EitherAdapter<Failure, SpaceMediaEntity>>);
  }

} 