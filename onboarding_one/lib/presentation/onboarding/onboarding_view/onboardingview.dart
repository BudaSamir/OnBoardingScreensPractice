import 'package:flutter/material.dart';
import 'package:onboarding_one/domain/models.dart';
import 'package:onboarding_one/presentation/onboarding/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:onboarding_one/presentation/resources/color_manager.dart';
import 'package:onboarding_one/presentation/resources/fonts_manager.dart';
import 'package:onboarding_one/presentation/resources/string_manager.dart';
import 'package:onboarding_one/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

late final PageController _pageController;
final OnboardingViewModel _viewModel = OnboardingViewModel();

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
    _pageController = PageController();
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outputSlidersData,
        builder: (context, snapshot) => _getContentWidget(snapshot.data));
  }

  Widget _getContentWidget(SlidersData? slidersData) {
    AppSizeConfig().init(context);
    double width = AppSizeConfig.screenW!;
    double height = AppSizeConfig.screenH!;
    if (slidersData == null) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
          backgroundColor: slidersData.onboardingSliderInstances.color,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: AppSize.s3,
                    child:
                        OnboardingSlidersContent1(slidersData, width, height)),
                Expanded(
                    flex: AppSize.s1,
                    child:
                        OnboardingSlidersContent2(slidersData, width, height))
              ],
            ),
          ));
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnboardingSlidersContent1 extends StatelessWidget {
  SlidersData slidersData;
  double width;
  double height;

  OnboardingSlidersContent1(this.slidersData, this.width, this.height,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (value) {
          _viewModel.onPageChanged(value);
        },
        itemCount: slidersData.numOfSliders,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p40),
            child: Column(
              children: [
                Image.asset(slidersData.onboardingSliderInstances.image,
                    height: AppSizeConfig.blockV! * AppSize.s35),
                SizedBox(
                  height: (height >= AppSize.s840) ? AppSize.s60 : AppSize.s30,
                ),
                Text(
                  slidersData.onboardingSliderInstances.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppSize.s15,
                ),
                Text(
                  slidersData.onboardingSliderInstances.desc,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          );
        }));
  }
}

class OnboardingSlidersContent2 extends StatelessWidget {
  SlidersData slidersData;
  double width;
  double height;

  OnboardingSlidersContent2(this.slidersData, this.width, this.height,
      {super.key});

  AnimatedContainer _dosts(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: AppSize.s200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s50)),
        color: ColorManager.animatedContainerColor,
      ),
      margin: const EdgeInsets.all(AppMargin.m5),
      height: AppSize.s10,
      curve: Curves.easeIn,
      width: currentPage == index ? AppSize.s20 : AppSize.s10,
    );
  }

  @override
  Widget build(BuildContext context) {
    double ifSize = (width <= AppSize.s550) ? AppSize.s13 : AppSize.s17;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(slidersData.numOfSliders,
              (index) => _dosts(index, slidersData.currentSlider))),
      // if the third dute = the third page
      slidersData.currentSlider + 1 == slidersData.numOfSliders
          ? Padding(
              padding: const EdgeInsets.all(AppPadding.p40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: (width <= AppSize.s550)
                        ? const EdgeInsets.symmetric(
                            horizontal: AppSize.s100, vertical: AppSize.s20)
                        : EdgeInsets.symmetric(
                            horizontal: width * 0.2, vertical: AppSize.s25),
                    textStyle: TextStyle(fontSize: ifSize)),
                child: const Text(AppString.startButton),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(AppPadding.p40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          elevation: AppSize.s0,
                          textStyle: TextStyle(
                              fontWeight: FontWeightManager.semiBold,
                              fontSize: ifSize)),
                      child: const Text(
                        AppString.skipButton,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration:
                                  const Duration(milliseconds: AppSize.s200),
                              curve: Curves.easeIn);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s50)),
                            elevation: AppSize.s0,
                            padding: (width <= 550)
                                ? const EdgeInsets.symmetric(
                                    horizontal: AppSize.s30,
                                    vertical: AppSize.s20)
                                : const EdgeInsets.symmetric(
                                    horizontal: AppSize.s30,
                                    vertical: AppSize.s25),
                            textStyle: TextStyle(fontSize: ifSize)),
                        child: const Text(AppString.nextButton)),
                  ]),
            ),
    ]);
  }
}
