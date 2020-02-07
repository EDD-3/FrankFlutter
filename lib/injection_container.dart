import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/features/news/data/datasources/news_article_remote_datasource.dart';
import 'package:news_app/features/news/data/repositories/news_article_repository_impl.dart';
import 'package:news_app/features/news/domain/repositories/news_article_repository.dart';
import 'package:news_app/features/news/domain/usecases/get_news_list.dart';
import 'package:news_app/features/news/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Features
  _news();
  //!Core
  _core();
  //!External-Dependencies
  _external();
}

void _news() {
  //Bloc
  sl.registerFactory<NewsBloc>(() => NewsBloc(getNewsList: sl()));
  //Use-cases
  sl.registerLazySingleton<GetNewsList>(() => GetNewsList(repository: sl()));
  //Repositories
  sl.registerLazySingleton<NewsArticleRepository>(() =>
      NewsArticleRepositoryImpl(networkInfo: sl(), remoteDatasource: sl()));
  //Datasources
  sl.registerLazySingleton<NewsArticleRemoteDatasource>(
      () => NewsArticleRemoteDatasourceImp(client: sl()));
}

void _core() {
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
}

void _external() {
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
