class FileModel {
  late List<String> file;
  late String folder;

  FileModel({
    required this.file,
    required this.folder,
  });

  FileModel.fromJson(Map<String, dynamic> json) {
    file = json['files'].cast<String>();
    folder = json['folderName'];
  }
}
