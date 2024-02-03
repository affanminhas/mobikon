import 'package:flutter/material.dart';
import 'package:mobikon/constants/app_colors.dart';
import 'package:mobikon/constants/typography.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/edit_staff_member.dart';
import 'package:mobikon/presentation/my_account/views/staff_member/staff_member_detail_view.dart';
import 'package:mobikon/widgets/custom_appbar.dart';

class StaffMembersView extends StatelessWidget {
  static const String id = '/staff-members-view';

  const StaffMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SecondaryAppBar(
              title: 'Staff Members',
              routeName: EditStaffMember.id,
              actionText: 'Add New Staff',
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            radius: 30,
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
            ),
          ],
        ),
      ),
    );
  }
}
