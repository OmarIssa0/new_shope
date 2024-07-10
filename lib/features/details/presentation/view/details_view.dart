import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/widgets/bottom_nav_bar_details_view.dart';
import 'package:new_shope/features/details/presentation/view/widgets/details_view_body.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../search/presentation/manger/provider/product_provider.dart';

class DetailsView extends StatefulWidget {
  static const kDetails = '/kDetailsView';
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  void _sendWhatsAppMessage(
      String name, String description, String? image) async {
    var message = "Name: $name\nDescription: $description\n:";
    var whatsappUrl =
        "https://wa.me/+9647763320598?text=${Uri.encodeComponent(message)}";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("Could not launch $whatsappUrl");
    }
  }

  // void _openWhatsApp() async {
  //   var whatsappUrl = "https://wa.me/?text=Hello%20from%20Flutter!";
  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     print("Could not launch $whatsappUrl");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final productProviderDetails =
        Provider.of<ProductProvider>(context, listen: false);

    // Navigator
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    // ignore: unused_local_variable
    final getCurrentProduct = productProviderDetails.findByProductId(productId);

    final Uri whatsappUrl = Uri.parse(
        'https://wa.me/+9647763320598=?text= تفاصيل المنتح : ${getCurrentProduct?.productDescription} | الاسم  : ${getCurrentProduct?.productTitle} | السعر : ${getCurrentProduct?.productPrice} | فئة : ${getCurrentProduct?.productCategory}');
    // final productModel = Provider.of<ProductModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          // _sendWhatsAppMessage(
          //   getCurrentProduct?.productTitle ?? '',
          //   getCurrentProduct?.productDescription ?? '',
          //   getCurrentProduct?.productImage,
          // );
          launchUrl(whatsappUrl);
        },
        child: Image.asset("assets/images/image_app/callme.png"),
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleTextAppCustom(
          label: 'Details Product',
          fontSize: 20.sp,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        elevation: 5,
      ),
      bottomNavigationBar: BottomNavBarDetailsView(
        productId: productId,
      ),
      body: const DetailsViewBody(),
    );
  }
}


// void _sendWhatsAppMessage(String phoneNumber) {
//   String url = 'https://wa.me/$phoneNumber';
//   launchUrl(Uri.parse(url));
// }

// void _sendSmsMessage(String phoneNumber) async {
//   List<String> recipents = [phoneNumber];
//   String url = 'sms:$phoneNumber?body=Hello';

//   launchUrl(Uri.parse(url));
// }
