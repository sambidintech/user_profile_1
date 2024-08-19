import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier{

  List favList=[];

  addtoList(index){
    favList.add(index);
    notifyListeners();
  }

  removeFav(index){
    favList.remove(index);
    notifyListeners();
  }


}