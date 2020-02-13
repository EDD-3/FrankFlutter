import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/gates/domain/entities/gate.dart';

abstract class GatesRepository {
  Future<Either<Failure,List<Gate>>> getGatesList();
}