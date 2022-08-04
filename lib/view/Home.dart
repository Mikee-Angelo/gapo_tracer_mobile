import 'package:app/controller/provider/AuthProvider.dart';
import 'package:app/controller/provider/StatsProvider.dart';
import 'package:app/view/AppDrawer.dart';
import 'package:app/view/Logs.dart';
import 'package:app/view/QrScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:number_display/number_display.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var _profile = Hive.box('profile');
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void initState() {
    // TODO: implement initState
    super.initState();
    _onLoading();
  }

  _onLoading() {
    Provider.of<AuthProvider>(context, listen: false).status();
    Provider.of<StatsProvider>(context, listen: false).getStatsPh();
    Provider.of<StatsProvider>(context, listen: false).getStatsOlongapo();
    Provider.of<StatsProvider>(context, listen: false).getStatsWorld();

    if (mounted) setState(() {});

    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _onLoading();
    print('Refreshing...');
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    var status = Provider.of<AuthProvider>(context, listen: true).statusValue;
    var message = Provider.of<AuthProvider>(context, listen: true).message;
    var statsPH = Provider.of<StatsProvider>(context, listen: true).statsPH;
    var statsGapo = Provider.of<StatsProvider>(context, listen: true).statsGapo;
    var statsWorld =
        Provider.of<StatsProvider>(context, listen: true).statsWorld;
    final display = createDisplay(length: 8, placeholder: ',');

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBarMain(context: context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Drawer(
          child: AppDrawerMobile(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          right: Adaptive.h(
            double.parse(GlobalConfiguration().get('padding')),
          ),
          bottom: 2.0.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Logs()));
                },
                minWidth: double.infinity,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 6.h,
                elevation: 0.0,
                child: Text(
                  'Show Activities',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 1.h),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => QrScreen()),
                  );
                },
                minWidth: double.infinity,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 6.h,
                elevation: 0.0,
                child: Text(
                  'Scan QR Code',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: null,
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.h(
                    double.parse(GlobalConfiguration().get('padding')),
                  ),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        QrImage(
                          data: _profile.get('user')['guid'],
                          version: QrVersions.auto,
                          size: 25.h,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                          ),
                          child: Text(
                            'SCAN THIS CODE FOR CONTACT TRACING',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor('#707070'),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 3.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            status == null
                                ? SpinKitThreeBounce(
                                    color: Theme.of(context).primaryColor,
                                    size: 1.h,
                                  )
                                : Text(
                                    status,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: HexColor('#FF9800'),
                                    ),
                                  ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            message == null
                                ? SpinKitThreeBounce(
                                    color: Theme.of(context).primaryColor,
                                    size: 1.h,
                                  )
                                : Text(
                                    message,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: HexColor('#FF9800'),
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 0.5.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'World',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.h(
                          double.parse(GlobalConfiguration().get('padding')),
                        ),
                        vertical: 2.0.h,
                      ),
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
                      child: statsWorld == null
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Theme.of(context).primaryColor,
                                size: 1.h,
                              ),
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Confirmed Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsWorld == null
                                          ? ''
                                          : display(statsWorld.cases!),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Active Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsWorld == null
                                          ? ''
                                          : display(statsWorld.cases),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recovered Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      display(statsWorld.recovered),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 3.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Philippines',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.h(
                          double.parse(GlobalConfiguration().get('padding')),
                        ),
                        vertical: 2.0.h,
                      ),
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
                      child: statsPH == null
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Theme.of(context).primaryColor,
                                size: 1.h,
                              ),
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Confirmed Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsPH == null
                                          ? ''
                                          : display(statsPH.infected!),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Active Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsPH == null
                                          ? ''
                                          : statsPH.activeCases.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recovered Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                        statsPH == null
                                            ? ''
                                            : statsPH.recovered.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 3.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Olongapo',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.h(
                          double.parse(GlobalConfiguration().get('padding')),
                        ),
                        vertical: 2.0.h,
                      ),
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
                      child: statsGapo == null
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Theme.of(context).primaryColor,
                                size: 1.h,
                              ),
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Confirmed Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsGapo == null
                                          ? ''
                                          : display(statsGapo.confirmed!),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Active Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsGapo == null
                                          ? ''
                                          : statsGapo.active.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Recovered Case',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsGapo == null
                                          ? ''
                                          : statsGapo.recovered.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Death',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      statsGapo == null
                                          ? ''
                                          : statsGapo.death.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
