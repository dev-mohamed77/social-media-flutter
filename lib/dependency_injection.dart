import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socailmedia/core/network/connectivity.dart';
import 'package:socailmedia/core/network/network_info.dart';
import 'package:socailmedia/features/auth/data/data_source/auth_cach_data_source.dart';
import 'package:socailmedia/features/auth/data/data_source/auth_remote_data_source_login.dart';
import 'package:socailmedia/features/auth/data/repository/data_repo.dart';
import 'package:socailmedia/features/auth/domin/use_case/use_case_login.dart';
import 'package:socailmedia/features/auth/domin/use_case/use_case_register.dart';
import 'package:socailmedia/features/comments/data/repository/commanet_repo_imp.dart';
import 'package:socailmedia/features/comments/domain/usecase/usecase_add_comment.dart';
import 'package:socailmedia/features/home/data/data_source/home_data_source_remote.dart';
import 'package:socailmedia/features/home/data/data_source/home_data_source_cached.dart';
import 'package:socailmedia/features/home/data/repositries/home_repo_impl.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_add_like_and_remove.dart';
import 'package:socailmedia/features/home/domain/use_case/home_usecase_fetch_post.dart';

import 'features/auth/domin/repository/auth_domain_repo.dart';
import 'features/comments/data/data_source/commant_data_source_remote.dart';
import 'features/comments/domain/repository/comment_repository.dart';
import 'features/comments/domain/usecase/usecase_fetch_comments_for_post.dart';
import 'features/home/domain/repositries/home_repo_domain.dart';
import 'features/home/domain/use_case/home_usecase_fetch_stories.dart';

Future<bool> isConn() {
  return Future.delayed(const Duration(seconds: 1), () {
    return true;
  });
}

GetIt getIt = GetIt.instance;

Future<void> initApp() async {
  //shared Logic
  // // Shared Prefrencese
  final SharedPreferences shared = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => shared);

  // NetworkInfo
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: ConnectivityNetwork.instance));

  // Auth Feature

  // Usecase
  getIt.registerFactory<AuthUseCaseLogin>(
      () => AuthUseCaseLogin(repository: getIt<AuthDomainRepository>()));

  getIt.registerFactory<AuthUsecaseRegister>(
      () => AuthUsecaseRegister(repository: getIt<AuthDataRepositoriesImp>()));

  // Data Source
  getIt.registerLazySingleton<AuthCachedDataSource>(
      () => AuthCachedDataSourceImp(sharedPreferences: getIt()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp());

  // Repository
  getIt.registerLazySingleton<AuthDomainRepository>(() =>
      AuthDataRepositoriesImp(
          authCachedDataSource: getIt(),
          networkInfo: getIt(),
          authRemoteDataSource: getIt()));

  // Home Feature
  // Home Usecase
  getIt.registerFactory<UseCaseFetchPost>(
      () => UseCaseFetchPost(repo: getIt<HomeRepositries>()));

  getIt.registerFactory<UseCaseFetchStories>(
      () => UseCaseFetchStories(repo: getIt<HomeRepositries>()));

  getIt.registerFactory<UseCaseAddLikeAndRemove>(
      () => UseCaseAddLikeAndRemove(repo: getIt<HomeRepositries>()));

  // Home Repositries
  getIt.registerLazySingleton<HomeRepositries>(() => HomeRepositriesImpl(
        homeDataSourceRemote: getIt(),
        homeDataSourceCache: getIt(),
        networkInfo: getIt(),
      ));

  // Home Data Source
  getIt.registerLazySingleton<HomeDataSourceCache>(
      () => HomeDataSourceCacheImp(sharedPreferences: getIt()));

  getIt.registerLazySingleton<HomeDataSourceRemote>(
      () => HomeDataSourceRemoteImp());

  // Comment Feature
  // Comment Usecase
  getIt.registerFactory<UsecaseAddCommant>(
      () => UsecaseAddCommant(repo: getIt<CommentRepository>()));
  getIt.registerFactory<UsecaseFetchCommentsForPost>(
      () => UsecaseFetchCommentsForPost(repo: getIt<CommentRepository>()));

  // Comment Repository
  getIt.registerLazySingleton<CommentRepository>(() => CommentRepositoryImp(
      commentDataSourceRemote: getIt<CommentDataSourceRemote>(),
      networkInfo: getIt<NetworkInfo>()));

  // Comment Data Source
  getIt.registerLazySingleton<CommentDataSourceRemote>(
      () => CommentDataSourceRemoteImp());
}
