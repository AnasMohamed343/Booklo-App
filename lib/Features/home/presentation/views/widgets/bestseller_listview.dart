import 'package:booklo/Features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero, // by default listView has padding
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
              vertical:
                  10), // i made it only (10) Although it is 20 because the upper item will make 10 and the bottom item will make 10 .
          child: BestSellerListViewItem(),
        );
      },
    );
  }
}
