import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherforecast/blocs/help/help_event.dart';
import 'package:weatherforecast/blocs/help/help_state.dart';
import 'package:weatherforecast/repositories/help_repository.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc();

  HelpRepository helpRepository = HelpRepository();

  @override
  HelpState get initialState => HelpUninitialized();

  @override
  Stream<HelpState> mapEventToState(
    HelpEvent event,
  ) async* {
    if (event is HelpStarted) {
      yield HelpLoading();
      
      final htmlData = await helpRepository.fetchHTMLFile("assets/html/help.html");
      yield HelpLoaded(htmlData: htmlData);
    }
  }
}
