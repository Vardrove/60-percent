class sizefilter{
  List<String> _choices=['Small','Medium','Large','XLarge'];

  int get choicesize{
    return _choices.length;
  }
  List get choices{
    return [..._choices];
  }
}

class colorfilter{
  List<String> _colorchoices=['Blue','Red','Black','Yellow','Green','White','Grey'];

  int get colorchoicesize{
    return _colorchoices.length;
  }
  List get colorchoices{
    return [..._colorchoices];
  }
}
