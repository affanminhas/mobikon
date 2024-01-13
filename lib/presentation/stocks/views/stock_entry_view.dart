import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/signup/widgets/radio_selection_widget.dart';
import 'package:mobikon/presentation/stocks/controllers/stock_controller.dart';
import 'package:mobikon/presentation/stocks/widgets/select_product_sheet.dart';
import 'package:mobikon/presentation/stocks/widgets/select_shelf_sheet.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class StockEntryView extends StatelessWidget {
  static const String id = 'stock_entry_view';

  const StockEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Text('Stock Entry', style: robotoCondensedBold.copyWith(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GetBuilder<StockController>(
                builder: (stockController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return const SelectShelfSheet();
                            },
                          );
                        },
                        child: const CustomTextField(
                          //onChanged: (value) => loginController.setEmail(value),
                          hintText: 'Select Shelf',
                          readOnly: true,
                          isEnable: false,
                          keyBoardType: TextInputType.emailAddress,
                          //validator: (value) => Validator.emailValidator(value),
                          outlineColor: AppColors.lightGrey,
                        ),
                      ),
                      const SizedBox(height: 18),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return const SelectProductSheet();
                            },
                          );
                        },
                        child: const CustomTextField(
                          //onChanged: (value) => loginController.setEmail(value),
                          hintText: 'Select Product',
                          readOnly: true,
                          isEnable: false,
                          keyBoardType: TextInputType.emailAddress,
                          //validator: (value) => Validator.emailValidator(value),
                          outlineColor: AppColors.lightGrey,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const CustomTextField(
                        //onChanged: (value) => loginController.setEmail(value),
                        hintText: 'Enter Quantity',
                        keyBoardType: TextInputType.emailAddress,
                        //validator: (value) => Validator.emailValidator(value),
                        outlineColor: AppColors.lightGrey,
                      ),
                      const SizedBox(height: 18),
                      Text('Select Type', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                      const SizedBox(height: 16),
                      RadioSelectionContainer(
                        firstOption: 'Add',
                        secondOption: 'Reduce',
                        groupValue: stockController.stockTypeSelectedOption,
                        onChanged: (value) {
                          stockController.setStockTypeSelectedOption(value!);
                          print(value);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      bgColor: Colors.white,
                      onTap: () {
                        //Navigator.pop(context);
                      },
                      title: 'Save and New',
                      borderColor: AppColors.blueColor,
                      textStyle: robotoCondensedBold.copyWith(color: AppColors.blueColor, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: 'Save',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
