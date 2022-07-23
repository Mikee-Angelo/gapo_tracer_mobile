import 'package:app/controller/provider/LogsProvider.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Logs extends StatefulWidget {
  const Logs({Key? key}) : super(key: key);

  @override
  _LogsState createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LogsProvider>(context, listen: false).getCivilianLogs();
    Provider.of<LogsProvider>(context, listen: false).getEstablishmentLogs();
    Provider.of<LogsProvider>(context, listen: false).getVehicleLogs();
  }

  @override
  Widget build(BuildContext context) {
    LogsProvider _logs = Provider.of<LogsProvider>(context, listen: true);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Logs'),
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.person_outline,
                size: 2.3.h,
              )),
              Tab(
                  icon: Icon(
                Icons.apartment_outlined,
                size: 2.3.h,
              )),
              Tab(
                  icon: Icon(
                Icons.airport_shuttle_outlined,
                size: 2.3.h,
              )),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _civilian(logs: _logs),
                  _establishment(logs: _logs),
                  _vehicle(logs: _logs),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _civilian({required LogsProvider logs}) {
    if (logs.civilianLogs == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(
            color: Theme.of(context).primaryColor,
            size: 3.h,
          ),
          SizedBox(height: 2.h),
          Text(
            'Loading data ...',
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      );
    }

    if (logs.civilianLogs!.length == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          vertical: 3.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Civilian',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Divider(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'No data found',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.h(
          double.parse(GlobalConfiguration().get('padding')),
        ),
        vertical: 3.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Civilian',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Divider(),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return Container(
                padding: EdgeInsets.all(1.2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('images/avatar.png'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          logs.civilianLogs![i].host!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('MMMM d, y')
                              .format(logs.civilianLogs![i].createdAt!),
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int i) {
              return SizedBox(height: 2.h);
            },
            itemCount: logs.civilianLogs!.length,
          )
        ],
      ),
    );
  }

  Widget _establishment({required LogsProvider logs}) {
    if (logs.establishmentLogs == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(
            color: Theme.of(context).primaryColor,
            size: 3.h,
          ),
          SizedBox(height: 2.h),
          Text(
            'Loading data ...',
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      );
    }

    if (logs.establishmentLogs!.length == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          vertical: 3.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Establishments',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Divider(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'No data found',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.h(
          double.parse(GlobalConfiguration().get('padding')),
        ),
        vertical: 3.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Establishments',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Divider(),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return Container(
                padding: EdgeInsets.all(1.2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('images/avatar.png'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          logs.establishmentLogs![i].host!.name!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          logs.establishmentLogs![i].host!.type!,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          DateFormat('MMMM d, y')
                              .format(logs.establishmentLogs![i].createdAt!),
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int i) {
              return SizedBox(height: 2.h);
            },
            itemCount: logs.establishmentLogs!.length,
          )
        ],
      ),
    );
  }

  Widget _vehicle({required LogsProvider logs}) {
    if (logs.vehicleLogs == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCube(
            color: Theme.of(context).primaryColor,
            size: 3.h,
          ),
          SizedBox(height: 2.h),
          Text(
            'Loading data ...',
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      );
    }

    if (logs.vehicleLogs!.length == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          vertical: 3.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vehicle',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Divider(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'No data found',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.h(
          double.parse(GlobalConfiguration().get('padding')),
        ),
        vertical: 3.0.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Divider(),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return Container(
                padding: EdgeInsets.all(1.2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 7,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('images/avatar.png'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          logs.vehicleLogs![i].host!.bodyNo!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          logs.vehicleLogs![i].host!.type!,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          DateFormat('MMMM d, y')
                              .format(logs.vehicleLogs![i].createdAt!),
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int i) {
              return SizedBox(height: 2.h);
            },
            itemCount: logs.vehicleLogs!.length,
          )
        ],
      ),
    );
  }
}
