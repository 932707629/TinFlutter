
import 'package:event_bus/event_bus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
///普通事件
EventBus eventBus=new EventBus();
///可用于黏性事件
EventBus behaviorBus = EventBus.customController(BehaviorSubject());

///显示Toast消息
void showToast(String message){
  Fluttertoast.showToast(msg: message,gravity: ToastGravity.CENTER);
}

///是否debug环境
final isDebug = !inProduct();

///判断程序当前的运行环境
bool inProduct(){
  return const bool.fromEnvironment("dart.vm.product");
}







