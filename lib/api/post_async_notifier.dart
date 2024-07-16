import 'package:retrofil_example/api/post_api.dart';
import 'package:retrofil_example/domain/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_async_notifier.g.dart';

@riverpod
class PostAsyncNotifier extends _$PostAsyncNotifier {
  @override
  FutureOr<List<Post>> build() {
    return getPosts();
  }

  Future<List<Post>> getPosts() async {
    return await ref.read(postApiProvider).getPosts();
  }
}