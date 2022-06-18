import 'package:clean_architecture/app/locator.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/main/home/home_viewmodel.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/string_manager.dart';
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
        builder: (context, snapshot){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBanners(snapshot.data?.banners),
              _getSection(AppStrings.services),
              _getServices(snapshot.data?.services),
              _getSection(AppStrings.stores),
              _getStores(snapshot.data?.stores)
            ],
          );
    });
  }

  Widget _getBanners(List<BannerModel>? banners) {
    return Text('${banners?.length}');
  }

  Widget _getServices(List<ServiceModel>? services) {
    return Text('${services?.length}');
  }

  Widget _getStores(List<StoreModel>? stores) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.storeDetailsRoute, arguments: {'id': 1});
      },
      child: Container(
        height: 100,
        width: 100,
        color: ColorManager.error,
        child: const Text('go to detail'),
      ),
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
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
