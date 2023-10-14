import 'package:test_dtac/model/information.dart';
import 'package:test_dtac/services/services.dart';

class ListDataViewModel {
  List<DataViewModel>? data;

  Future<void> fetchData() async {
    final apiResult = await Service().fetchData();
    this.data = apiResult.map((e) => DataViewModel(e)).toList();
  }
}

class DataViewModel {
  final Infomation? result;
  DataViewModel(this.result);
}
