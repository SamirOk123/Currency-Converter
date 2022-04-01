import 'package:currency_converter/models/db_model.dart';
import 'package:currency_converter/models/history_model.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  DatabaseConnect databaseConnect = DatabaseConnect();

  
  Future<int> addToHistory(String value, String date) async {
    final History history = History(date: date, value: value);
    final List<History> historyList = [history];
    return await databaseConnect.addToHistory(historyList);
  }

  Future<void> deleteHistory(int id) async {
    await databaseConnect.deleteHistory(id);
    update();
  }
}
