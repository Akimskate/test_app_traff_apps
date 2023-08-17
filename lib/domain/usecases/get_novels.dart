import '../entities/novel.dart';

abstract class GetNovels {
  Future<List<Novel>> call();
}
