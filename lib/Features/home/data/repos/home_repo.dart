import 'package:booklo/Features/home/data/models/BookModel.dart';
import 'package:booklo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  //بحدد الفيتشر دي هتعمل ايه  لكن مبحددش هنا هتعملو ازاي
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}
