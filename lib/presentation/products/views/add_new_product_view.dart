import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/products/views/image_preview.dart';
import 'package:mobikon/utilities/validators.dart';
import 'package:mobikon/widgets/custom_buttons.dart';
import 'package:mobikon/widgets/custom_loader.dart';
import 'package:mobikon/widgets/custom_text_field.dart';

class AddNewProductView extends StatefulWidget {
  static const String id = '/add-new-product-view';

  const AddNewProductView({super.key});

  @override
  State<AddNewProductView> createState() => _AddNewProductViewState();
}

class _AddNewProductViewState extends State<AddNewProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GetBuilder<ProductController>(builder: (productController) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  title: 'Cancel',
                  textStyle: robotoCondensedMedium.copyWith(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  bgColor: AppColors.lightGrey4,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: productController.isLoading
                    ? const CustomLoadingButton(
                        text: 'Creating ...',
                      )
                    : SecondaryButton(
                        bgColor: AppColors.blueColor,
                        disabledColor: AppColors.primaryColor50,
                        onTap: productController.isFormValid
                            ? () {
                                productController.createProduct();
                              }
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add, color: Colors.white),
                            const SizedBox(width: 4),
                            Text(
                              'Add Product',
                              style: robotoCondensedBold.copyWith(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
              )
            ],
          ),
        );
      }),
      body: SafeArea(
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Add New Product',
                      style: robotoCondensedBold.copyWith(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.04),
                      border: Border(bottom: BorderSide(color: AppColors.primaryColor.withOpacity(0.1))),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Details',
                          style: robotoCondensedBold.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Fill the details below to add product',
                          style: robotoCondensedRegular.copyWith(fontSize: 14, color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Image',
                          style: robotoCondensedRegular.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            if (productController.productThumbnail.path.isEmpty) {
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
                                            productController.setProductThumbnail(image!);
                                          },
                                        ),
                                        const Padding(padding: EdgeInsets.all(8.0)),
                                        GestureDetector(
                                          child: const Text('Camera'),
                                          onTap: () async {
                                            Navigator.of(context).pop();
                                            final ImagePicker picker = ImagePicker();
                                            final XFile? image = await picker.pickImage(source: ImageSource.camera);
                                            productController.setProductThumbnail(image!);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: DottedBorder(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            radius: const Radius.circular(5),
                            strokeWidth: 1,
                            borderType: BorderType.RRect,
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: productController.productThumbnail.path.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            productController.productThumbnail.name.length > 35
                                                ? "${productController.productThumbnail.name.substring(0, 35)}..."
                                                : productController.productThumbnail.name,
                                            style: robotoCondensedMedium.copyWith(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) => AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  content: SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Image.asset(
                                                          Strings.deleteIcon,
                                                          width: 50,
                                                          height: 50,
                                                          color: AppColors.redColor2,
                                                        ),
                                                        const SizedBox(height: 32),
                                                        Center(
                                                          child: Text(
                                                            'Deleting Image?',
                                                            style: robotoCondensedBold.copyWith(fontSize: 20),
                                                          ),
                                                        ),
                                                        RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: 'By clicking on ',
                                                                style: robotoCondensedRegular.copyWith(
                                                                  fontSize: 14,
                                                                  color: AppColors.darkGrey,
                                                                  height: 1.7,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'Yes, Delete',
                                                                style: robotoCondensedMedium.copyWith(
                                                                  fontSize: 14,
                                                                  color: AppColors.black1,
                                                                  height: 1.7,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: ' product image will be deleted permanently',
                                                                style: robotoCondensedRegular.copyWith(
                                                                  fontSize: 14,
                                                                  color: AppColors.darkGrey,
                                                                  height: 1.7,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 24),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: GestureDetector(
                                                                onTap: () => Navigator.pop(context),
                                                                child: Container(
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                    color: AppColors.lightGrey.withOpacity(0.5),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Cancel',
                                                                      style: robotoCondensedMedium.copyWith(
                                                                        fontSize: 16,
                                                                        color: AppColors.black1.withOpacity(0.5),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 16),
                                                            Expanded(
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  productController.setProductThumbnail(XFile(''));
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                    color: AppColors.redColor2.withOpacity(0.1),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Yes, Delete',
                                                                      style: robotoCondensedMedium.copyWith(
                                                                        fontSize: 16,
                                                                        color: AppColors.redColor2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Delete',
                                              style: robotoCondensedMedium.copyWith(
                                                fontSize: 16,
                                                color: AppColors.redColor2,
                                                decoration: TextDecoration.underline,
                                                decorationColor: AppColors.redColor2,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                ImagePreview.id,
                                                arguments: ImagePreviewArguments(
                                                  image: productController.productThumbnail.path,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'View',
                                              style: robotoCondensedMedium.copyWith(
                                                fontSize: 16,
                                                color: AppColors.blueColor,
                                                decoration: TextDecoration.underline,
                                                decorationColor: AppColors.blueColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.add, color: AppColors.primaryColor),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Add Image',
                                          style: robotoCondensedMedium.copyWith(
                                              fontSize: 14, color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          onChanged: (value) => productController.setProductName(value),
                          hintText: 'Product Name',
                          keyBoardType: TextInputType.emailAddress,
                          validator: (value) => Validator.emailValidator(value),
                          outlineColor: AppColors.lightGrey,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                onChanged: (value) => productController.setProductID(value),
                                hintText: 'Product ID',
                                keyBoardType: TextInputType.number,
                                showErrorMessage: false,
                                outlineColor: AppColors.lightGrey,
                                validator: (value) => Validator.validateOnly(value),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                onChanged: (value) => productController.setProductType(value),
                                hintText: 'Product Type',
                                showErrorMessage: false,
                                outlineColor: AppColors.lightGrey,
                                validator: (value) => Validator.validateOnly(value),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          onChanged: (value) => productController.setProductDescription(value),
                          maxLines: 3,
                          hintText: 'Product Description',
                          keyBoardType: TextInputType.emailAddress,
                          validator: (value) => Validator.emailValidator(value),
                          outlineColor: AppColors.lightGrey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
