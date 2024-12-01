import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/presentation/widgets/most_use_product_widget.dart';
import 'package:nana/features/home/presentation/widgets/recommendation_lit_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          16.verticalSpace,
          const MostUseProductWidget(),
          16.verticalSpace,
          const RecommendationLitWidget(),
        ],
      ),
    );
  }
}
