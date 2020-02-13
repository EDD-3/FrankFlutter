import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/messages/messages.dart';
import 'package:news_app/features/gates/data/datasources/gates_remote_datasource.dart';
import 'package:news_app/features/gates/domain/entities/gate.dart';
import 'package:news_app/features/gates/domain/repositories/gate_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';

class GateRepositoryImpl implements GateRepository {
  final GateRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  GateRepositoryImpl({
    @required this.remoteDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Gate>>> getGatesList() async {
    if (await networkInfo.isConnected) {
      try {
        final gateList = await remoteDatasource.getGatesList();
        return Right(gateList);
      } on ServerException catch (e) {
        return Left(NetworkFailure(message: e.message));
      }
    }
    return Left(NetworkFailure(message: Messages.NO_NETWORK));
  }
}
