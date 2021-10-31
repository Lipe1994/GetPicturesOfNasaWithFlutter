import 'package:clean_arch_with_flutter/core/domain/usecases/erros/failures.dart';
import 'package:clean_arch_with_flutter/core/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:clean_arch_with_flutter/presenter/controllers/home_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../static_mocks/space_media_model.dart';


class MockGetSpaceMediaFromUseCase extends Mock implements GetSpaceMediaFromDateUseCase{}

void main(){
  late HomeStore store;
  late GetSpaceMediaFromDateUseCase useCase;

  var tdate = DateTime.now(); 
  var tFailure = ServerFailure();

  setUp((){
    useCase = MockGetSpaceMediaFromUseCase();
    store = HomeStore(useCase);
  });

  test('Should return a SpaceMedia from the usecase', () async{
    when(()=> useCase.call(tdate)).thenAnswer((invocation) async => Right(tSpaceMediaModel));

    store.getSpaceMediaFromDate(tdate);

    store.observer(
      onState: (state){
        expect(state, tSpaceMediaModel);
        verify(()=> useCase.call(tdate)).called(1);
      }
    );
  });

  test('Should return a failure when usecase is an error', (){

    when(()=> useCase.call(tdate)).thenAnswer((invocation) async => Left(tFailure));

    store.observer(
      onError: (error){
        expect(error, tFailure);
        verify(()=> useCase.call(tdate)).called(1);
      }
    );

  });
}