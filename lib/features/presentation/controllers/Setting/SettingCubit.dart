import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/features/data/models/file_model.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingState.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'dart:convert';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(InitState());

  static SettingCubit get(context) => BlocProvider.of(context);
  List<FileModel> files = <FileModel>[];
  late FileModel selectedModel;

  List<dynamic> imageCamera = [];

  //String photoCamera = '/storage/emulated/0/DCIM/Compress/IMG_20230404_103357.jpg';

  Future<void> getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath!) as List;

    files = images.map<FileModel>((e) {
      // if (e['folderName'] == 'Camera') {
      //   imageCamera = e['files'];
      //   print('asdkgnslng${e['files']}');
      //   print('sssadfsfasf${imageCamera[0]}');
      //   return FileModel(file: [], folder: '');
      // } else {
      return FileModel.fromJson(e);
      // }
    }).toList();
    if (files != null && files.length > 0) {
      selectedModel = files[0];
    }
  }
}