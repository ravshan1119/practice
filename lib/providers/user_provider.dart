import 'package:flutter/foundation.dart';
import 'package:practice/data/model/from_status.dart';
import 'package:practice/data/model/user_model.dart';
import 'package:practice/data/network/api_provider.dart';
import 'package:practice/data/network/universal_data.dart';

class UserProvider with ChangeNotifier {
  UserProvider({required this.apiProvider}) {
    getDataInfo();
  }

  final ApiProvider apiProvider;

  FormStatus status = FormStatus.pure;

  List<UserModel>? userModel;
  String errorText = "";

  getDataInfo() async {
    notify(FormStatus.loading);
    UniversalData universalData = await apiProvider.getData();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      userModel = universalData.data;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}
