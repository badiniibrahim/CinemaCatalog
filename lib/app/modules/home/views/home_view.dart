import 'package:db_movie/app/ui/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/colors.style.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utilities/size_config.dart';
import '../controllers/home_controller.dart';
import '../widgets/genre_widget.dart';
import '../widgets/now_playing.dart';
import '../widgets/slider_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  AppBar _appBar() {
    return AppBar(
      title: const Text("Accueil"),
      titleTextStyle: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
        color: AppColors.white,
        fontFamily: 'muli',
      ),
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: _appBar(),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Obx(
              () => Column(
                children: [
                  controller.state.isLoading
                      ? const CircularProgress()
                      : SliderItem(controller: controller),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenreWidget(controller: controller),
                        const SizedBox(height: 10),
                        Text(
                          'Nouveauté'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'muli',
                          ),
                        ),
                        const SizedBox(height: 10),
                        NowPlaying(controller: controller)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
