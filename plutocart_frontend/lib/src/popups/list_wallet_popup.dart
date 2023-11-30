import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plutocart/src/blocs/wallet_bloc/bloc/wallet_bloc.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:plutocart/src/interfaces/slide_pop_up/slide_popup_dialog.dart';
import 'package:plutocart/src/popups/more_vert_popup.dart';

class ListWalletPopup extends StatefulWidget {
  const ListWalletPopup({Key? key}) : super(key: key);

  @override
  _ListWalletPopupState createState() => _ListWalletPopupState();
}

class _ListWalletPopupState extends State<ListWalletPopup> {
  @override
  void initState() {
    context.read<WalletBloc>().add(GetAllWallet(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wallet",
                    style: TextStyle(
                      color: Color(0xFF15616D),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: SizedBox(
                          child: ImageIcon(
                            AssetImage('assets/icon/cancle_icon.png'),
                          ),
                        ),
                        color: Color(0xFF15616D),
                        iconSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<WalletBloc, WalletState>(
              builder: (context, state) {
                return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: List.generate(state.wallets.length, (index) {
                        return Container(
                          width: 320,
                          height: 57,
                          margin: const EdgeInsets.only(
                              bottom: 10), // Adjust spacing between containers
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF15616D),
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/icon/wallet_icon.png')),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 9),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.wallets[index].walletName}",
                                            style: TextStyle(
                                              color: Color(0xFF15616D),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "${state.wallets[index].walletBalance}",
                                            style: TextStyle(
                                              color: Color(0xFF707070),
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      child: LiteRollingSwitch(
                                          value: state.wallets[index]
                                                  .statusWallet ==
                                              1,
                                          width: 85,
                                          textOn: 'Show',
                                          textOff: 'No',
                                          colorOn: Color(0XFF15616D),
                                          colorOff: Color(0XFF707070),
                                          iconOn: Icons.done,
                                          iconOff: Icons.remove_circle_outline,
                                          textSize: 14.0,
                                          textOnColor: Colors.white,
                                          textOffColor: Colors.white,
                                          animationDuration:
                                              const Duration(milliseconds: 100),
                                          onChanged: (bool status) {
                                            setState(() {
                                              state.wallets[index]
                                                      .statusWallet =
                                                  status ? 1 : 0;
                                            });
                                            // Then trigger the bloc event to update the status
                                            context.read<WalletBloc>().add(
                                                  UpdateStatusWallet(
                                                      1,
                                                      state.wallets[index]
                                                          .walletId),
                                                );
                                          },
                                          onSwipe: () {},
                                          onTap: () {},
                                          onDoubleTap: () {}),
                                    ),
                                    BlocBuilder<WalletBloc, WalletState>(
                                      builder: (context, state) {
                                        return IconButton(
                                          icon: Icon(
                                            Icons.more_vert_outlined,
                                            color: Color(
                                                0XFF15616D), // Set the color here
                                          ),
                                          onPressed: () {
                                            // WalletBloc().add(GetWalletId(state.wallets[index].walletId));
                                            context.read<WalletBloc>().add(
                                                MapEventToState(
                                                    state.wallets[index]
                                                        .walletId,
                                                    state.wallets[index]
                                                        .walletName,
                                                    state.wallets[index]
                                                        .walletBalance));
                                            more_vert();
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }

  more_vert() {
    showSlideDialog(
        context: context,
        child: MoreVertPopup(),
        barrierColor: Colors.white.withOpacity(0.7),
        backgroundColor: Colors.white,
        hightCard: 1.3);
  }
}
