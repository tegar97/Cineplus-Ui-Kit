import 'package:flutter/material.dart';

import '../config/theme.dart';

import 'package:flutter/material.dart';
import '../config/theme.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.isActive})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: maxWidth * 0.25,
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isActive ? primaryColor : Color(0xff222222),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: widget.isActive
              ? headingTextStyle.copyWith(fontSize: 14)
              : regularText,
        ),
      ),
    );
  }
}
