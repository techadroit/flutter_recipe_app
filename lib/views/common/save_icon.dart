
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveIconWidget extends StatefulWidget{


  late VoidCallback callback;
  late bool isSaved;
  SaveIconWidget(this.isSaved,this.callback);

  @override
  State<StatefulWidget> createState() {
   return SaveIconStateWidget();
  }
}

class SaveIconStateWidget extends State<SaveIconWidget>{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          icon: Icon(
            widget.isSaved
                ? Icons.favorite
                : Icons.favorite_border,
            color:
            widget.isSaved ? Colors.red : Colors.grey,
          ),
          onPressed: (){
            widget.callback();
            setState(() {
              widget.isSaved = !widget.isSaved;
            });
          },
    ));
  }

}