import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/strings.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/widgets/access_level_edit.dart';
import 'package:mobikon/presentation/my_account/widgets/edit_personal_info_sheet.dart';
import 'package:mobikon/widgets/custom_buttons.dart';

class StaffMemberDetailView extends StatefulWidget {
  static const String id = '/staff-member-detail-view';

  const StaffMemberDetailView({super.key});

  @override
  State<StaffMemberDetailView> createState() => _StaffMemberDetailViewState();
}

class _StaffMemberDetailViewState extends State<StaffMemberDetailView> {
  bool _isPersonalDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text('Staff Details', style: robotoCondensedBold.copyWith(fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                //color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              child: const Icon(Icons.person, size: 30),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.edit, color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Robie Nelson', style: robotoCondensedBold.copyWith(fontSize: 20)),
                            Text('Manager', style: robotoCondensedRegular.copyWith(fontSize: 16)),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(Strings.qrCode, width: 48, height: 48),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    children: [
                      const SizedBox(width: 34),
                      GestureDetector(
                        onTap: () => setState(() => _isPersonalDetails = true),
                        child: Text(
                          'Personal Details',
                          style: robotoCondensedMedium.copyWith(
                            fontSize: 16,
                            color:
                                _isPersonalDetails ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.3),
                          ),
                        ),
                      ),
                      const SizedBox(width: 34),
                      GestureDetector(
                        onTap: () => setState(() => _isPersonalDetails = false),
                        child: Text(
                          'Access Level',
                          style: robotoCondensedMedium.copyWith(
                            fontSize: 16,
                            color:
                                _isPersonalDetails ? AppColors.primaryColor.withOpacity(0.3) : AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 1,
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isPersonalDetails = true),
                        child: Container(
                          width: 150,
                          height: _isPersonalDetails ? 2 : 1,
                          color: _isPersonalDetails ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.3),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isPersonalDetails = false),
                        child: Container(
                          width: 130,
                          height: _isPersonalDetails ? 1 : 2,
                          color: _isPersonalDetails ? AppColors.primaryColor.withOpacity(0.3) : AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.primaryColor.withOpacity(0.3),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (_isPersonalDetails)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailWidget(title: 'First Name', value: 'Robie'),
                    DetailWidget(title: 'Last Name', value: 'Nelson'),
                    DetailWidget(title: 'Email Address', value: 'robieenelson@gmail.com'),
                    DetailWidget(title: 'Phone Number', value: '+1 (555) 555 5'),
                  ],
                ),
              ),
            if (!_isPersonalDetails)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailWidget(title: 'Designation', value: 'Manager'),
                    DetailWidget(title: 'Permissions', value: 'Add/Reduce Stock'),
                  ],
                ),
              ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
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
                    child: SecondaryButton(
                      bgColor: AppColors.redColor2,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.remove, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            'Delete Staff',
                            style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SecondaryButton(
                      bgColor: AppColors.blueColor,
                      onTap: () {
                        if (_isPersonalDetails) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: const EditInfoSheet(),
                              );
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: const AccessLevelEdit(),
                              );
                            },
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.edit, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            'Edit Info',
                            style: robotoCondensedBold.copyWith(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
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

class DetailWidget extends StatelessWidget {
  final String title;
  final String value;

  const DetailWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: robotoCondensedMedium.copyWith(fontSize: 16, color: AppColors.black1),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
