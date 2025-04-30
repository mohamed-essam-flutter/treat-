import 'package:flutter/material.dart';
import 'package:treat/core/routes/routes_manager.dart';
import 'package:treat/core/utils/colors.dart';
import 'package:treat/core/widgets/custom_list_title.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key, required this.isLocationTab});
   final bool isLocationTab;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();       
}

class _CategoryTabsState extends State<CategoryTabs> {
  bool colorIcor=false; 

  final List<String> categories = ["حلاقة","kkkk","ggggg","fffff"];

  final List<Widget> tabContents = [
    ListView.builder(
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
            Navigator.pushNamed(context, RoutesManager.branchDetailScreen);
          },
          onFavoritePressed: () {
            
          },
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          // التابات الأفقية
          TabBar(
            isScrollable: true,
            dividerHeight: 0.2,
            tabs: categories.map((cat) => Tab(text: cat)).toList(),
            indicatorColor: ColorsManager.primary,  
            labelColor: ColorsManager.primary, 
            unselectedLabelColor: Color(0xffAFAFAF), 
          ),
          // المحتوى تحت التابات
          Expanded(child: TabBarView(
            children:[
              ...tabContents,
              ...tabContents,
              ...tabContents,
              ...tabContents,
            ]
             
            
             )),
          
        ],
      ),
    );
  }
}
