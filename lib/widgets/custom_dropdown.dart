import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final Function onChanged;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      hint: Text(hintText),
      elevation: 5,
      isDense: true,
      dropdownColor: Colors.white,
      style: robotoCondensedRegular.copyWith(color: AppColors.primaryColor, fontSize: 15),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) => onChanged(value),
    );
  }
}
