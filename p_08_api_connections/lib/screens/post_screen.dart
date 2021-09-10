import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:p_08_api_connections/constants.dart';
import 'package:p_08_api_connections/models/post.dart';
import 'package:p_08_api_connections/widgets/custom_alert_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddPostScreen extends StatefulWidget {
  final Post post;
  final String type;
  final String token;

  AddPostScreen({
    required this.post,
    required this.type,
    required this.token,
  });

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late Size size;
  late TextEditingController titleController, descriptionController;
  File file = File('-1');
  String pastImageUrl = '';
  bool showProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    if(widget.type == 'Update'){
      titleController.text = widget.post.title;
      descriptionController.text = widget.post.description;
      if(widget.post.imageUrl.length != 0){
        pastImageUrl = widget.post.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.type} Post',
        ),
      ),
      body: ModalProgressHUD(
        progressIndicator: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey,
          ),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Colors.white,
            ),
          ),
        ),
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Image',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        selectImage();
                      },
                      child: CircleAvatar(
                        child: Icon(
                          (widget.type == 'Add') ? Icons.add : Icons.edit,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if(widget.type=='Update')...[
                      Visibility(
                        visible: file.path != '-1',
                        child: Image.file(
                          file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Visibility(
                        visible: file.path == '-1' && pastImageUrl.length != 0,
                        child: FadeInImage(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/images/default.png'),
                          image: NetworkImage('$kBaseUrl/media/$pastImageUrl'),
                        ),
                      ),
                    ] // add
                    else...[
                      Visibility(
                        visible: file.path != '-1',
                        child: Image.file(
                          file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Title',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'Description',
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  minLines: 4,
                  maxLines: 6,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadPost();
                  },
                  child: Text(
                    '${widget.type}',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectImage() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          selectImageFromGallery: selectImageFromGallery,
          selectImageFromCamera: selectImageFromCamera,
        );
      },
    );
  }

  void selectImageFromGallery() async {
    print('gallery');
    bool status = await selectImageFunction(ImageSource.gallery);
    if (status == true) {
      Navigator.pop(context);
    }
  }

  void selectImageFromCamera() async {
    print('camera');
    bool status = await selectImageFunction(ImageSource.camera);
    if (status == true) {
      Navigator.pop(context);
    }
  }

  Future<bool> selectImageFunction(ImageSource source) async {
    try {
      ImagePicker imagePicker = ImagePicker();
      final XFile pickedImage =
          await imagePicker.pickImage(source: source) ?? XFile('-1');
      print('---------------------------------------');
      print(pickedImage);
      print(pickedImage.path);
      print(pickedImage.name);
      if (pickedImage.path == '-1') {
        return false;
      }
      setState(() {
        file = File(pickedImage.path);
      });
      return true;
    } //
    catch (e) {
      print(e);
      return false;
    }
  }

  uploadPost() async {
    String title = titleController.text;
    String description = descriptionController.text;
    if (title.length <= 3 || description.length <= 3) {
      print('type more');
      return;
    }
    setState(() {
      showProgress = true;
    });
    Map<String, dynamic> newMap = Map();
    newMap['title'] = title;
    newMap['description'] = description;
    if (file.path != '-1') {
      newMap['file'] = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
    }
    Dio dio = Dio();
    FormData formData = FormData.fromMap(newMap);
    String url = '';
    if(widget.type == 'Update'){
      url = '$kBaseUrl/api/post/update/${widget.post.id}/';
      dio
          .put(
        url,
        data: formData,
        options: Options(
          method: 'PUT',
          headers: {
            HttpHeaders.authorizationHeader: widget.token,
          },
          responseType: ResponseType.json,
        ),
      )
          .catchError(
            (error) {
          print(error);
        },
      ).then(
            (Response response) {
          print(response.statusCode);
          print(response.data);
          setState(() {
            showProgress = false;
          });
        },
      );
    } // add
    else{
      url = '$kBaseUrl/api/post/create/';
      dio
          .post(
        url,
        data: formData,
        options: Options(
          method: 'POST',
          headers: {
            HttpHeaders.authorizationHeader: widget.token,
          },
          responseType: ResponseType.json,
        ),
      )
          .catchError(
            (error) {
          print(error);
        },
      ).then(
            (Response response) {
          print(response.statusCode);
          print(response.data);
          reset();
        },
      );
    }
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
    file = File('-1');
    setState(() {
      showProgress = false;
    });
  }
}
