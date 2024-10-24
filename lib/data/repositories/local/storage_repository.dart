import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepository {
  static ImagePicker picker = ImagePicker();

  Future<XFile?> getPhoto({ImageSource? source}) async {
    final XFile? result = await picker.pickImage(
      source: source ?? ImageSource.camera,
      imageQuality: 50,
      maxWidth: 2000,
      maxHeight: 2000,
    );
    return result;
  }

  Future<File?> getFile() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }
}
