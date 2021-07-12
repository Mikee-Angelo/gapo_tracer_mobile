import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Privacy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PrivacyState();
  }
}

class PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Adaptive.h(
              double.parse(GlobalConfiguration().get('padding')),
            ),
            vertical: 3.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 2.0.h),
            Text(
              '''
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non finibus metus. Quisque scelerisque velit id ligula hendrerit, eu tempor diam placerat. Ut quis arcu eu nisl dictum venenatis. Vestibulum at mattis ex, quis dignissim tortor. Proin lectus enim, blandit nec ante vitae, malesuada tempus lorem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas euismod, tellus id dapibus scelerisque, ex eros dictum sem, quis condimentum neque purus sit amet turpis. In molestie est et finibus luctus. Duis maximus imperdiet ex pretium pellentesque. Praesent finibus ipsum vel nisi efficitur elementum.
Nam interdum vulputate lacus, sit amet rutrum neque pulvinar id. Suspendisse eget imperdiet turpis. Nunc eget erat neque. Cras sed nisl tortor. Curabitur libero nunc, cursus et dui quis, viverra fermentum libero. Nunc vitae ex in ipsum malesuada ultrices at ut elit. Aliquam lobortis fermentum consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus ut ornare maximus. Vivamus non elit a massa interdum sodales in eu lorem. Praesent placerat, sem at elementum gravida, nisi tellus sollicitudin mi, eget condimentum dolor nisl vel risus. Aliquam faucibus diam et velit egestas, non commodo mauris dictum.
Pellentesque dictum magna tellus, sit amet varius mi ultrices iaculis. Integer vehicula tortor quis eros sodales, quis rutrum mi aliquam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed lacinia nunc eget eros pulvinar vulputate. Aenean semper leo nec ex rhoncus, non ultrices tellus elementum. Fusce ut eros semper, suscipit sapien vitae, vulputate lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer sit amet vulputate justo.
Etiam auctor, lacus ut dictum vulputate, justo quam varius metus, aliquam malesuada tortor quam eu massa. Suspendisse fringilla metus eu lectus varius, vel elementum mauris congue. Praesent tristique arcu ac cursus convallis. Aenean ac lobortis arcu. Sed congue ex non pulvinar accumsan. Duis fermentum lacinia leo, eu fringilla est posuere id. Proin ultrices at nunc et sodales.
Suspendisse sed mollis tortor, eu dapibus turpis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam vitae ultrices erat. Aenean vitae aliquet nisl. Nullam scelerisque massa in nibh dapibus consectetur. Sed sodales ex elit, vitae feugiat eros tempus a. Suspendisse vel vehicula massa. Morbi sagittis libero erat, quis facilisis orci interdum vitae. Curabitur dignissim arcu id pharetra volutpat. Phasellus ullamcorper sem non consequat feugiat.
Vivamus rutrum enim eu nisi luctus commodo. Proin nec pharetra justo, at vulputate tellus. Aenean feugiat blandit ante. Praesent blandit dolor fringilla, lacinia nisi vel, fermentum lacus. Nullam sit amet vulputate erat. Fusce non mattis arcu. Pellentesque diam quam, facilisis finibus ornare et, semper a eros. Curabitur malesuada nec dui id auctor. Morbi nec fringilla sapien. Maecenas placerat viverra quam, vel pretium nisi ornare ac. Suspendisse rhoncus sodales lacus blandit suscipit. Maecenas eget justo velit. Proin eu fermentum diam, nec tincidunt tellus. Aenean erat sapien, commodo id neque a, scelerisque iaculis purus. Nam arcu enim, vehicula at elit id, auctor viverra ipsum. Nulla eget ex eget lectus consequat rutrum a ac orci.
Vestibulum pretium eleifend leo, id condimentum erat pellentesque nec. Donec tincidunt iaculis justo id ultricies. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin vel viverra est, nec scelerisque mauris. Morbi purus tortor, vulputate nec pellentesque et, sodales vitae sapien. Quisque congue purus sed rhoncus hendrerit. Curabitur eu sem faucibus nulla dictum mattis. Aliquam vehicula maximus odio in facilisis. Cras id nulla in ante commodo lacinia at sed metus. Aliquam lorem dolor, interdum sed volutpat eget, malesuada ac nisl. Aliquam erat volutpat. Suspendisse facilisis efficitur velit eget feugiat. Phasellus eleifend nulla vitae neque feugiat euismod. Maecenas rutrum quam in ex blandit porta. Praesent lacinia scelerisque diam, quis fermentum justo laoreet at. Cras quis odio at ligula ultrices placerat.
Sed efficitur, metus et tincidunt vulputate, nulla ligula dictum nisi, eget ullamcorper nulla est nec lectus. Curabitur rhoncus feugiat convallis. Pellentesque sit amet sodales ante. Ut nisi nisl, dapibus vitae pretium sit amet, finibus quis libero. Pellentesque tempus eros et faucibus placerat. Nulla pretium posuere velit eget vestibulum. Vestibulum rhoncus augue quis vestibulum tempor. Aliquam erat volutpat. Vestibulum condimentum urna ornare ante commodo, id pharetra augue egestas. Vestibulum eu tempor lorem. Vestibulum rhoncus a mauris nec elementum. Vestibulum non commodo eros, ut varius velit. Sed sagittis tincidunt felis at tempor. Aenean lacinia at dolor tempor volutpat.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis sapien at nibh venenatis tempus. In scelerisque, mauris sit amet dapibus iaculis, elit magna dapibus turpis, non tempor nibh tellus a ligula. Morbi nec nibh aliquam, pellentesque nulla quis, iaculis massa. Donec ipsum ante, aliquet in tortor ut, eleifend porta est. Vestibulum porta ornare ligula nec tempor. Suspendisse potenti. Donec convallis venenatis sodales. Nulla posuere sagittis turpis, a pulvinar ante eleifend ut. Etiam tempus lorem eu ligula pretium hendrerit. Pellentesque viverra velit non ex pretium, scelerisque ultrices augue sollicitudin. Nullam vel commodo neque, eget elementum nisi. Nunc sit amet dolor in mi blandit consectetur. Nullam dolor mi, elementum et pellentesque eget, vestibulum in risus. Praesent ac ligula ac tortor laoreet feugiat.
Maecenas auctor tincidunt leo, vel pulvinar nulla efficitur vitae. Morbi efficitur sem feugiat, luctus ipsum non, tempor neque. Donec aliquam diam non dui pharetra consectetur. Aliquam iaculis sodales leo, quis accumsan massa lobortis id. Maecenas sed mauris suscipit, faucibus ipsum vitae, iaculis dolor. Sed finibus ornare pharetra. Vestibulum feugiat scelerisque nibh eget laoreet. Curabitur eleifend velit nec nisl vehicula consequat. Curabitur consequat metus ut bibendum tempor. Vestibulum id odio sit amet sem pellentesque placerat. Phasellus dolor tortor, luctus a interdum a, vulputate sit amet erat.
            ''',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
