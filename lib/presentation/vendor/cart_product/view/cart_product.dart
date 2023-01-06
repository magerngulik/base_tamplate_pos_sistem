import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing_local_storage/bloc/product/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_local_storage/data/model/card_model.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int allTotal = 0;

  hitungTotal(CartModel item) {
    var total = item.qty! * int.parse(item.item!.price);
    return total;
  }

  //selected payment
  List<String> listPayment = <String>['Cash', 'Debit', 'Ovo', 'Dana', 'Gopay'];
  String paymentSelected = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = context.read<ProductBloc>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Cart Product"),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state.listCart.isEmpty) {
                      return Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Lottie.asset(
                                      "assets/lottie/no_data_checout.json")),
                              Text(
                                "Belum ada data checkout",
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.listCart.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CartModel item = state.listCart[index];
                        var totalHarga = hitungTotal(item);
                        allTotal = allTotal + totalHarga as int;

                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: CachedNetworkImage(
                                  imageUrl: item.item!.image,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context, url,
                                          downloadProgress) =>
                                      Center(
                                          child: CircularProgressIndicator(
                                              value:
                                                  downloadProgress.progress)),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            title: Text(item.item!.name),
                            subtitle: Text(totalHarga.toString()),
                            trailing: SizedBox(
                              width: 120.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      productBloc.add(RemoveQtyEvent(item));
                                    },
                                    child: Card(
                                      color: Colors.grey[800],
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "${item.qty}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      productBloc.add(AddQtyEvent(item));
                                    },
                                    child: Card(
                                      color: Colors.grey[800],
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(10.0),
            height: 250.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: context.read<ProductBloc>().state.listCart.isNotEmpty
                ? Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Metode Pembayaran",
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Form(
                            key: _formKey,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonFormField<String>(
                                validator: (value) => value == null
                                    ? 'Silahkan Pilih Metode Pembayaran'
                                    : null,
                                hint: Text(
                                  'Pilih Metode Pembayaran',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                decoration: InputDecoration(
                                  errorStyle: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Color(0xffE5E5E5)),
                                  ),
                                  disabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Color(0xffE5E5E5)),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Color(0xffE5E5E5)),
                                  ),
                                ),
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                items: listPayment
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  paymentSelected = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total Harga",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Rp. $allTotal",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    productBloc.add(DeleteCheckoutEvent());
                                    Navigator.pop(context);
                                    allTotal = 0;
                                  }
                                },
                                child: const Text("Checkout"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container()));
  }
}
