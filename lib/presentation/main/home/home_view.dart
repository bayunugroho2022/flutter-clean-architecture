import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/presentation/common/cache_image_network.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/main/home/home_viewmodel.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/string_manager.dart';
import 'package:clean_architecture/presentation/resources/styles_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _viewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.start();
              }) ??
              Container();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeData>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _header(),
                  _getBanners(snapshot.data?.banners),
                  // _getSection(AppStrings.services),
                  // _getServices(snapshot.data?.services),
                  _getSection(AppStrings.stores),
                  _getStores(snapshot.data?.stores)
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _header() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        children: [
          const SizedBox(width: 20,),
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.grey.withOpacity(0.1),
              ),
              child: Icon(Icons.person,
                  size: 30.0, color: ColorManager.grey.withOpacity(0.5))),
          const SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Welcome back!',
                style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s14),
              ),
              Text(
                'Bayu Nugroho',
                style: getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s12),
              )
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.green.withOpacity(0.1),
              ),
              child: Icon(Icons.notifications_none,color: ColorManager.green.withOpacity(0.4),)),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }

  Widget _getBanners(List<BannerModel>? banners) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2.5,
      ),
      items: banners!
          .map((item) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: getCacheImageNetwork(
                                height: 100,
                                width: 100,
                                image: item.image!
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${item.title}',
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          AppStrings.loremIpsum,
                          style: getRegularStyle(
                              color: ColorManager.grey, fontSize: FontSize.s12),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _getServices(List<ServiceModel>? services) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: services?.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 9,right: 9,top: 10),
              child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.green.withOpacity(0.1),
                  ),
                  child: Icon(Icons.notifications_none,
                    size: 40,
                    color: ColorManager.green.withOpacity(0.4),)),
            );
          },
      )
    );
  }

  Widget _getStores(List<StoreModel>? stores) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.storeDetailsRoute,
            arguments: {'id': 1});
      },
      child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: stores?.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-photo/profile-shot-stylish-cool-attractive-curly-haired-european-25s-woman-red-dress-turning-camera-smiling-broadly-with-delighted-carefree-expression-having-fun-yellow-background_1258-81974.jpg")
                            )
                        )),
                    Expanded(
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              const SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bayu Store $index',
                                    style: getRegularStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s17),
                                  ),
                                  Text(
                                    'Bayu Nugroho',
                                    style: getRegularStyle(
                                        color: ColorManager.black.withOpacity(0.4),
                                        fontSize: FontSize.s12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: ColorManager.white,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.0, color: ColorManager.grey.withOpacity(0.2),),
                                        borderRadius: BorderRadius.circular(20))),
                                child: Text(
                                  'Detail',
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s12),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              );
            },
          )
    );
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title, style: getBoldStyle(
          color: ColorManager.primary.withOpacity(0.6),
          fontSize: FontSize.s18),
      ),
    );
  }
}
