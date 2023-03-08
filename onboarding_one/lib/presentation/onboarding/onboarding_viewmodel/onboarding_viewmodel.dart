import 'dart:async';

import 'package:onboarding_one/domain/models.dart';
import 'package:onboarding_one/presentation/base/base_modelview.dart';
import 'package:onboarding_one/presentation/resources/assets_manager.dart';
import 'package:onboarding_one/presentation/resources/color_manager.dart';
import 'package:onboarding_one/presentation/resources/string_manager.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInput, OnboardingViewModelOutput {
  final StreamController _streamController = StreamController<SlidersData>();
  late final List<OnboardingSlider> _list;
  int _currentSlider = 0;
  List<OnboardingSlider> _getSliderInstances() => [
        OnboardingSlider(
            title: AppString.onBoardingTitle1,
            desc: AppString.onBoardingDesc1,
            image: ImageAssets.onboardingImage1,
            color: ColorManager.slider1),
        OnboardingSlider(
            title: AppString.onBoardingTitle2,
            desc: AppString.onBoardingDesc2,
            image: ImageAssets.onboardingImage2,
            color: ColorManager.slider2),
        OnboardingSlider(
            title: AppString.onBoardingTitle3,
            desc: AppString.onBoardingDesc3,
            image: ImageAssets.onboardingImage3,
            color: ColorManager.slider3),
      ];
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderInstances();
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentSlider = index;
    _postDataToView();
  }

  void _postDataToView() {
    inputSlidersData.add(SlidersData(
        onboardingSliderInstances: _list[_currentSlider],
        numOfSliders: _list.length,
        currentSlider: _currentSlider));
  }

  @override
  Sink get inputSlidersData => _streamController.sink;

  @override
  Stream<SlidersData> get outputSlidersData =>
      _streamController.stream.map((slidersData) => slidersData);
}

// StreamControll Sink
abstract class OnboardingViewModelInput {
  void onPageChanged(int index);

  Sink get inputSlidersData;
}

// StreamControll Stream
abstract class OnboardingViewModelOutput {
  Stream<SlidersData> get outputSlidersData;
}
