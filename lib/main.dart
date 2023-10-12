import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/app_router.dart';

void main() {
  runApp(
    const MyShopeApp(),
  );
}

class MyShopeApp extends StatelessWidget {
  const MyShopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}