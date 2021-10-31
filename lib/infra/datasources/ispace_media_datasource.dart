import 'package:clean_arch_with_flutter/infra/models/space_media_model.dart';

abstract class ISpaceMediaDatasource{
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}