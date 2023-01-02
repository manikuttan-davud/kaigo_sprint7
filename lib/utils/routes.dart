import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kaigo_sprint7/screen/cancel_screen.dart';
import 'package:kaigo_sprint7/withdrawl/screens/withdrawl_screen.dart';

import '../home/home_screen.dart';

const String initialRoute =HomeScreen.route;

List<GetPage<dynamic>>? appRoutes() => [
    GetPage(
        name: CancelScreen.route,
        page: () => const CancelScreen(),
      ),
      GetPage(
        name: WithdrawlScreen.route,
        page: () => const WithdrawlScreen(),
      ),
      GetPage(
        name: HomeScreen.route,
        page: () => const HomeScreen(),
      ),
    
        
        ];