import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture/app/locator.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/string_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:clean_architecture/presentation/store_detail/store_detail_viewmodel.dart';
import 'package:flutter/material.dart';

class StoreDetailView extends StatefulWidget {
  const StoreDetailView({Key? key}) : super(key: key);

  @override
  State<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends State<StoreDetailView> {
  final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
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
            return Scaffold(
              body: snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.start();
              }) ?? Container(),
            );
          },
        ));
  }
  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(AppStrings.storeDetails),
          elevation: AppSize.s0,
          iconTheme: IconThemeData(
            //back button
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primary,
          centerTitle: true,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: StreamBuilder<StoreDetailModel>(
              stream: _viewModel.outputStoreDetails,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return _getItems(snapshot.data);
                }else{
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  Widget _getItems(StoreDetailModel? storeDetails) {
    if (storeDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: storeDetails.image!,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          _getSection(AppStrings.details),
          _getInfoText(storeDetails.details!),
          _getSection(AppStrings.services),
          _getInfoText(storeDetails.services!),
          _getSection(AppStrings.about),
          _getInfoText(storeDetails.about!)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: Text(title, style: Theme.of(context).textTheme.headline3));
  }

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodyText2),
    );
  }
}
