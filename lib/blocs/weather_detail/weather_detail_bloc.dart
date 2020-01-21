  /**
 * WeatherDetailBloc
*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_event.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_state.dart';
import 'package:weatherforecast/models/weather.dart';

import 'package:weatherforecast/repositories/weather_repository.dart';

class WeatherDetailBloc
    extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  final WeatherRepository weatherRepository;

  WeatherDetailBloc({
    @required this.weatherRepository,
  }) : assert(weatherRepository != null);

  @override
  WeatherDetailState get initialState => WeatherDetailUninitialized();

  @override
  Stream<WeatherDetailState> mapEventToState(
      WeatherDetailEvent event) async* {
    if (event is WeatherDetailFetch) {
      yield WeatherDetailFetching();

      try {
        List<AggregatedWeatherInfo> infos = await weatherRepository.getWeatherDetail(1);
        if (infos.length == 0) {
          yield WeatherDetailEmpty();
        } else {
          yield WeatherDetailFetched(infos: infos);
        }
      } catch (error) {
        yield WeatherDetailFailure(error: error.toString());
      }
    }
  }
}
