import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_wallet/wallet_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WalletProvider>(
      create:(context)=>WalletProvider(),
      child:const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final walletProvider = Provider.of<WalletProvider>(context);

    return MaterialApp(
      title:'Crypto Wallet',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crypto Wallet'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{
                final mnemonic = walletProvider.generateMnemonic();
                final privateKey = await walletProvider.getPrivateKey(mnemonic);
                final publicKey = await walletProvider.getPublicKey(privateKey);

                print('Mnemonic: $mnemonic');
                print('Private Key: $privateKey');
                print('Public Key: $publicKey');
              }, child: Text('Generate Wallet'))
            ],
          ),
        ),
      ),
    );
  }
}

