/**
 * WeatherDetailBloc
*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_event.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_state.dart';
import 'package:weatherforecast/models/weather.dart';

import 'package:weatherforecast/repositories/weather_repository.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  WeatherDetailBloc();

  @override
  WeatherDetailState get initialState => WeatherDetailUninitialized();

  @override
  Stream<WeatherDetailState> mapEventToState(WeatherDetailEvent event) async* {
    if (event is WeatherDetailFetch) {
      WeatherRepository weatherRepository = WeatherRepository();

      yield WeatherDetailFetching();

      try {
        AggregatedWeatherInfoList result =
            await weatherRepository.fiveDaysWeatherForecast(event.cityId);
        if (result.infos.length == 0) {
          yield WeatherDetailEmpty();
        } else {
          yield WeatherDetailFetched(infos: result.infos);
        }
      } catch (error) {
        yield WeatherDetailFailure(error: error.toString());
      }
    }
  }
}
