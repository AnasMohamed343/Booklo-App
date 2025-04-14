import 'package:booklo/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklo/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(
      Dio())); //make ApiService singleton to be used in whole app as a single instance
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      apiService: getIt.get<ApiService>())); // make HomeRepoImpl singleton
}
