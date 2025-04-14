import 'package:booklo/Features/home/data/models/BookModel.dart';
import 'package:booklo/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading(''));
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}

sealed class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {
  String message;

  NewestBooksLoading(this.message);
}

class NewestBooksFailure extends NewestBooksState {
  String? errorMessage;

  NewestBooksFailure(this.errorMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  List<BookModel> books;

  NewestBooksSuccess(this.books);
}
