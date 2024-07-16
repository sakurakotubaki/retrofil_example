import 'package:dio/dio.dart';
import 'package:retrofil_example/domain/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:retrofit/http.dart';
part 'post_api.g.dart';

@Riverpod(keepAlive: true)
PostApi postApi(PostApiRef ref) {
  return PostApi(Dio(
    BaseOptions(
      contentType: "application/json",
      connectTimeout: const Duration(seconds: 10),
    )
  ));
}

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostApi {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET('/posts')
  Future<List<Post>> getPosts();
}