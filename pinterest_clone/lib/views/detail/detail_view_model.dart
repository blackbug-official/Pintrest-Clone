import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class DetailViewModel extends BaseViewModel {
  Logger log;

  DetailViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
