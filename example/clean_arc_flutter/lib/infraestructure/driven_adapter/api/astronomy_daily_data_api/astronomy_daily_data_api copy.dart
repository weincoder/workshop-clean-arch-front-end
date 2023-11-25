
import 'package:http/http.dart' as http;
import 'package:clean_arc_flutter/domain/models/astronomy_daily_data/astronomy_daily_data.dart';
import '../../../../domain/models/astronomy_daily_data/gateway/astronomy_daily_data_gateway.dart';
import 'errors/astronomy_dayly_data_api_error.dart';

class AstronomyDailyDataApi2 extends AstronomyDailyDataGateway{
  @override
  Future<AstronomyDailyData> getAstronomyDailyData()  async{
    print('soy otra api');
    Uri url = Uri.parse('https://go-apod.herokuapp.com/apod');
    final response = await http.get(url);
    if(response.statusCode == 200 ){
      final astronomyDailyData = astronomyDailyDataFromJson(response.body);
      return astronomyDailyData!;
    }else {
      throw AstronomyDailyDataApiError();
    }
  }
}
