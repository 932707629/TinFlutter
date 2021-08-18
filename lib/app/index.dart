
import 'package:event_bus/event_bus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
///普通事件
EventBus eventBus=new EventBus();
///可用于黏性事件
EventBus behaviorBus = EventBus.customController(BehaviorSubject());

///显示Toast消息
void showToast(String message){
  Fluttertoast.showToast(msg: message,gravity: ToastGravity.CENTER);
}

///log日志打印
var logger=Logger(
  printer: PrettyPrinter(
    printTime: true,
  ),
  filter: LogConsoleFilter(),
);

///判断程序当前的运行环境
bool inProduct(){
  return const bool.fromEnvironment("dart.vm.product");
}

class LogConsoleFilter extends LogFilter{
  @override
  bool shouldLog(LogEvent event) {
    return !inProduct();
  }
}

class FontSize{

  static final size_1=1.0;
  static final size_1_7=1.7;
  static final size_2=2.0;
  static final size_3=3.0;
  static final size_4=4.0;
  static final size_5=5.0;
  static final size_6=6.0;
  static final size_7=7.0;
  static final size_8=8.0;
  static final size_9=9.0;
  static final size_10=10.0;
  static final size_11=11.0;
  static final size_12=12.0;
  static final size_13=13.0;
  static final size_14=14.0;
  static final size_15=15.0;
  static final size_16=16.0;
  static final size_17=17.0;
  static final size_18=18.0;
  static final size_19=19.0;
  static final size_20=20.0;
  static final size_21=21.0;
  static final size_22=22.0;
  static final size_23=23.0;
  static final size_24=24.0;
  static final size_25=25.0;
  static final size_26=26.0;
  static final size_27=27.0;
  static final size_28=28.0;
  static final size_29=29.0;
  static final size_30=30.0;
  static final size_40=40.0;
  static final size_45=45.0;
  static final size_50=50.0;
  static final size_56=56.0;
  static final size_60=60.0;
  static final size_70=70.0;
  static final size_80=80.0;
  static final size_90=90.0;
  static final size_100=100.0;
  static final size_150=150.0;


}










