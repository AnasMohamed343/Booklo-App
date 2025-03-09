import 'package:booklo/Features/home/presentation/view_models/featured_books_cubit.dart';
import 'package:booklo/Features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:booklo/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:booklo/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FeaturedListViewItem(
                  imageUrl:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                          '',
                ),
              );
            },
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(
            errorMessage: state.errorMessage ?? 'An error occurred');
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
