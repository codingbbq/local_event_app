import 'package:flutter/material.dart';
import 'package:local_events_app/models/category.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;

  const CategoryWidget({ Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            category.icon,
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            size: 40,
          ),
          SizedBox(height: 10.0,),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Color(0xFFFF4700) : Colors.white
            ),
          )
        ],
      ),
    );
  }
}