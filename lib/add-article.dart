import 'package:article_app_flutter/repository.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({super.key});

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  Repository repository = Repository();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Article'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: _bodyController,
                decoration: InputDecoration(hintText: 'Body'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool response = await repository.postData(
                        _titleController.text, _bodyController.text);

                    if (response) {
                      Navigator.of(context).popAndPushNamed('/home');
                    } else {
                      print('Post data gagal!');
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ));
  }
}
