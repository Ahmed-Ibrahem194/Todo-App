import 'package:ahmed/modules/counter/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialStateStates());

  static CounterCubit get(context) => BlocProvider.of(context);
  int number = 0 ;

  void minus()
  {
    number --;
    emit(CounterMinusState());
  }

  void plus()
  {
    number ++;
    emit(CounterPlusState());
  }

}