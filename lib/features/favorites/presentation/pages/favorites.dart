import 'package:flutter/material.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/widgets/custom_app_bar.dart';
import 'package:treat/core/widgets/custom_list_title.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTitle(
                  imageUrl:
                      'https://thesefootballtimes.co/wp-content/uploads/2017/05/aboutrika.jpg',
                  title: 'Tacha Beauty Center',
                  subtitle: 'Ryadh',
                  rating: 4.7,
                  distance: '4.7 km',
                  onTap: () {
                    // Handle tap
                    Navigator.pushNamed(
                      context,
                      RoutesManager.branchDetailScreen,
                    );
                  },
                  onFavoritePressed: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
