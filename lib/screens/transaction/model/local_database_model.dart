import 'package:hive/hive.dart';
part 'local_database_model.g.dart';
@HiveType(typeId: 1)
class WatchListData {
  @HiveField(0)
  String? currency;
  @HiveField(1)
  bool? isSelected;

  WatchListData({
    this.currency,
    this.isSelected,
  });
}
