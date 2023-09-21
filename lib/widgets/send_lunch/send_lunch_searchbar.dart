import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class SendLunchSearchBar extends StatelessWidget {
  const SendLunchSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: 'Search for employee',
        hintStyle: TextStyle(color: ColorUtils.Grey.withOpacity(0.5)),
        suffixIcon: Icon(Icons.search, color: ColorUtils.Grey.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(61)),
        ),
      ),
      onChanged: (value) {
        // Perform search operations based on the entered value
        // Update the search results accordingly
      },
    );
  }
}
