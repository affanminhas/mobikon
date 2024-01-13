import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_image_builder.dart';
import 'package:mobikon/widgets/custom_loader.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class EditProductSheet extends StatefulWidget {
  const EditProductSheet({super.key});

  @override
  State<EditProductSheet> createState() => _EditProductSheetState();
}

class _EditProductSheetState extends State<EditProductSheet> {
  final GlobalKey<FormState> _editInfoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editInfoFormKey,
      child: GetBuilder<ProductController>(
        builder: (productController) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 80,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Edit Product Details', style: robotoCondensedBold.copyWith(fontSize: 18)),
                  Text(
                    'You can edit your product details here',
                    style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 20),
                  if (productController.productEditThumbnail.path.isEmpty)
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CustomCashedImage(
                          image: productController.selectedProduct.thumbnail,
                          shape: BoxShape.rectangle,
                          width: 140,
                          height: 140,
                        ),
                      ),
                    ),
                  if (productController.productEditThumbnail.path.isNotEmpty)
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(productController.productEditThumbnail.path),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Select Image'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: const Text('Gallery'),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    final ImagePicker picker = ImagePicker();
                                    XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                    productController.setProductEditThumbnail(image!);
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(8.0)),
                                GestureDetector(
                                  child: const Text('Camera'),
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? image = await picker.pickImage(source: ImageSource.camera);
                                    productController.setProductEditThumbnail(image!);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit, color: AppColors.blueColor, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          'Edit Image',
                          style: robotoCondensedMedium.copyWith(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            color: AppColors.black1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    onChanged: (value) => productController.setProductName(value),
                    initialValue: productController.selectedProduct.name,
                    hintText: 'Product Name',
                    keyBoardType: TextInputType.name,
                    validator: (value) => Validator.emailValidator(value),
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => productController.setProductDescription(value),
                    initialValue: productController.selectedProduct.description,
                    hintText: 'Product Description',
                    validator: (value) => Validator.phoneNumberFullValidator(value),
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => productController.setProductType(value),
                    initialValue: productController.selectedProduct.type,
                    hintText: 'Product Type',
                    validator: (value) => Validator.phoneNumberFullValidator(value),
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    onChanged: (value) => productController.setProductID(value),
                    initialValue: productController.selectedProduct.productId == 'Not Set'
                        ? '0'
                        : productController.selectedProduct.productId,
                    hintText: 'Product ID',
                    keyBoardType: TextInputType.phone,
                    validator: (value) => Validator.phoneNumberFullValidator(value),
                    outlineColor: AppColors.lightGrey,
                  ),
                  const SizedBox(height: 16),
                  productController.isLoading
                      ? const CustomLoadingButton(
                          text: 'Updating...',
                        )
                      : PrimaryButton(
                          bgColor: AppColors.blueColor,
                          onTap: () {
                            productController.updateProduct();
                          },
                          title: 'Save Changes',
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
