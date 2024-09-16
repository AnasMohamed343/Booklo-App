import 'package:booklo/Features/home/presentation/views/widgets/bestseller_listview.dart';
import 'package:booklo/Features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:booklo/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booklo/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:booklo/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            FeaturedBooksListView(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Best Seller',
                  style: Styles
                      .textStyle18 //.copyWith(fontWeight: FontWeight.w500,),
                  ),
            ),
            SizedBox(height: 18),
          ],
        )),
        const SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
