import 'package:booklo/Features/home/presentation/views/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      // use safeArea to avoid the notch, and make ui beginning after the status bar
      child: Scaffold(
        body: BookDetailsViewBody(),
      ),
    );
  }
}
