import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class StoreDetailUseCase extends BaseUseCase<int, StoreDetailModel>{

  final Repository _repository;
  StoreDetailUseCase(this._repository);

  @override
  Future<Either<Failure, StoreDetailModel>> execute(int id) async{
    return await _repository.getStoreDetail(id);
  }
}
