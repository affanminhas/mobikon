import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/views/staff_member_detail_view.dart';

class StaffMembersView extends StatelessWidget {
  static const String id = '/staff-members-view';

  const StaffMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                  const SizedBox(width: 16),
                  Text('Staff Members ', style: robotoCondensedBold.copyWith(fontSize: 18)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: AppColors.blueColor),
                        const SizedBox(width: 4),
                        Text(
                          'Add New Staff',
                          style: robotoCondensedBold.copyWith(fontSize: 14, color: AppColors.blueColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, StaffMemberDetailView.id);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: const Icon(Icons.person, size: 30),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                'John Doe',
                                style: robotoCondensedMedium.copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '@robdavid',
                                style: robotoCondensedRegular.copyWith(fontSize: 16, color: AppColors.darkGrey),
                              )
                            ],
                          ),
                          const Spacer(),
                          Text(
                            'View Details',
                            style: robotoCondensedMedium.copyWith(fontSize: 14, color: AppColors.primaryColor),
                          ),
                          const Icon(Icons.keyboard_arrow_right_sharp),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
