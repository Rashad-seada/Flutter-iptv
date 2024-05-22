import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/live_tv/views/screens/live_tv_page.dart';
import 'package:smart_soft/features/movies/views/screens/movies_page.dart';
import 'package:smart_soft/features/search/views/screens/search_page.dart';
import 'package:smart_soft/features/settings/views/screens/settings_page.dart';
import 'package:smart_soft/features/tv_shows/views/screens/tv_shows_page.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../utils/pages.dart';


part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  Widget currentPage() {
    return pages[index].page;
  }

  List<PageModel> get pages => [
        PageModel(LocaleKeys.movies.tr(), Icons.movie_creation_outlined, MoviesPage()),
        PageModel(LocaleKeys.tvshows.tr(), Icons.video_collection_outlined, TvShowsPage()),
        PageModel(LocaleKeys.search.tr(), Icons.search,SearchPage()),
        PageModel(LocaleKeys.live_tv.tr(), Icons.tv, LiveTvPage()),
        PageModel(LocaleKeys.settings.tr(), Icons.settings, SettingsPage()),
  ];

  onNavItemTap(index) {
    emit(MainPageChanged());
    this.index = index;
    emit(MainInitial());
  }
}
