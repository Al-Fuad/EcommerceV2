import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/common/widgets/app_button.dart';
import 'package:test_project/core/constants/app_assets.dart';
import 'package:test_project/core/constants/app_color.dart';
import 'package:test_project/features/auth/views/signin_screen.dart';
import 'package:test_project/features/onboarding/controllers/onboarding_controller.dart';
import 'package:test_project/features/onboarding/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.put(OnboardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 61,
          bottom: 200,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  onboardingController.updateCurrentIndex(value);
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        onboardingData[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        onboardingData[index].description,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 64),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              onboardingData[index].image,
                              width: 400,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: -25,
                            right: 100,
                            left: 100,
                            child: AppButton(
                              size: Size(200, 50),
                              text: index == onboardingData.length - 1
                                  ? "Get Started"
                                  : "Next",
                              onPressed: () {
                                if (index == onboardingData.length - 1) {
                                  Get.offAll(() => SigninScreen());
                                } else {
                                  onboardingController.updateCurrentIndex(
                                    index + 1,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                AppAssets.onboardingImages.length,
                (index) => Obx(
                  () => Container(
                    height: 7,
                    width: onboardingController.currentIndex.value == index
                        ? 20
                        : 10,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: onboardingController.currentIndex.value == index
                          ? AppColor.primaryColor
                          : AppColor.lightPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
