import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_tuy/presentation/resources/assets_manager.dart';
import 'package:we_tuy/presentation/resources/color_manager.dart';
import 'package:we_tuy/presentation/resources/strings_manager.dart';
import 'package:we_tuy/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingTitle1,
            ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingTitle2,
            ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingTitle3,
            ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingTitle4,
            ImageAssets.onboardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s1_5,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              //return OnBoardingPage
            }));
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s60,
        ),
        Text(_sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
