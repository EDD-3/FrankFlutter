import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/usecases/no_params.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/gates/domain/entities/gate.dart';
import 'package:news_app/features/gates/domain/repositories/gate_repository.dart';
import 'package:meta/meta.dart';

class GetGateList implements UseCase<List<Gate>, NoParams> {
  final GateRepository repository;

  GetGateList({@required this.repository});

  @override
  Future<Either<Failure, List<Gate>>> call(NoParams params) async {
    return await repository.getGatesList();
  }
}