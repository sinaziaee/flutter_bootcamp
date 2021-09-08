import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:p_08_api_connections/models/post.dart';
import 'package:p_08_api_connections/widgets/custom_alert_dialog.dart';

class AddPostScreen extends StatefulWidget {
  final Post post;
  final String type;

  AddPostScreen({
    required this.post,
    required this.type,
  });

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late Size size;
  late TextEditingController titleController, descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
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
      body: SingleChildScrollView(
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
                onPressed: () {},
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

  void selectImageFromGallery() {
    print('gallery');
  }

  void selectImageFromCamera() {
    print('camera');
  }
}
