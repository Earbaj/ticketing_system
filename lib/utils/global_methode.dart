
import 'package:flutter/cupertino.dart';

double getDynamicSize(BuildContext context, double size){
  return MediaQuery.of(context).size.width * size;
}