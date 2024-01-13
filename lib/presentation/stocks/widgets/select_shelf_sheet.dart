import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class SelectShelfSheet extends StatelessWidget {
  const SelectShelfSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 70,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.lightGrey3,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Select Shelf', style: robotoCondensedBold.copyWith(fontSize: 18)),
          const SizedBox(height: 16),
          const CustomTextField(
            //onChanged: (value) => loginController.setEmail(value),
            hintText: 'Search',
            readOnly: true,
            radius: 10,
            isEnable: false,
            keyBoardType: TextInputType.emailAddress,
            //validator: (value) => Validator.emailValidator(value),
            outlineColor: AppColors.lightGrey,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //stockController.setContainerSelectedOption(index);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Container # ${index + 1} / Shelf ${index + 1}',
                    style: robotoCondensedRegular.copyWith(fontSize: 20),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
