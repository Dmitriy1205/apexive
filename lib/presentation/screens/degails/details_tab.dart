import 'package:flutter/material.dart';
import '../../../core/const/strings.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/themes.dart';

class DetailTab extends StatelessWidget {
  const DetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.whiteTransparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.project,
                  style: AppTheme.defaultTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400,
                    fontSize: 12,),
                ),
                const SizedBox(height: 4,),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const VerticalDivider(color: AppColors.yellow,thickness: 2,),
                      Text(
                        'Apexive: Content Planning',
                        style: AppTheme.defaultTheme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Text(
                  AppStrings.deadline,
                  style: AppTheme.defaultTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400,
                    fontSize: 12,),
                ),
                const SizedBox(height: 4,),
                Text(
                  '10/11/2023',
                  style: AppTheme.defaultTheme.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),

                Text(
                  AppStrings.assignedTo,
                  style: AppTheme.defaultTheme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400,
                    fontSize: 12,),
                ),
                const SizedBox(height: 4,),
                Text(
                  'Ivan Zhuikov',
                  style: AppTheme.defaultTheme.textTheme.titleMedium,
                ),

              ],
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.whiteTransparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(
                  AppStrings.description,
                  style: AppTheme.defaultTheme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4,),
                Text(
                  'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
                  style: AppTheme.defaultTheme.textTheme.labelLarge,
                ),


              ],
            ),
          ),
        )
      ],
    );
  }
}
