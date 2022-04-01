import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_challange/bloc/event/login_page_event.dart';
import 'package:technical_challange/bloc/state/login_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:technical_challange/network/user_api.dart';

class LoginBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginBloc() : super(InitialLoginpageState()) {
    on<LoginPageEvent>(
      (event, emit) async{
        SharedPreferences sp = await SharedPreferences.getInstance();
        if (event is Login) {
          emit(LoadingState());
          try {
            final data = await UserApi().loginUser(event.email, event.password);
            print(data);
            emit(SuccesLoginState());
          }catch(e){
            emit(FailureState(e.toString()));
          }
        }
        if (event is Register) {
          emit(LoadingState());
          try {
            final data = await UserApi().registeruser(event.name, event.email, event.password);
            print(data);
            emit(SuccesLoginState());
          }catch(e){
            emit(FailureState(e.toString()));
          }
        }
      },
    );
  }
}
