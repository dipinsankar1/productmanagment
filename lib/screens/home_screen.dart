import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsample/bloc/bloc/Authentication/bloc/authentication_bloc.dart';
import 'package:productsample/bloc/bloc/products_bloc.dart';
import 'package:productsample/model/product_model.dart';
import 'package:productsample/screens/login_screen.dart';
import 'package:productsample/services/auth_services.dart';
import 'package:qr_flutter/qr_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(LoadProducts());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ProductsBloc productBloc = BlocProvider.of<ProductsBloc>(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.5),
        actions: [
    IconButton(
      onPressed: () {
       context .read<AuthenticationBloc>().add(AuthenticationSignedOut());
      },
      icon: const Icon(Icons.logout),
    ),],
  ),
         body: BlocBuilder<ProductsBloc, ProductsState>(
           builder: (context, state) {
             if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                final products = state.products;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final productData = products[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){

                        },
                        child: Card(
                          child: ListTile(
                            tileColor: Colors.purple.withOpacity(0.1),
                            contentPadding: const EdgeInsets.only(left: 1,right:1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            title: Text(productData.name,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            subtitle:Text('${productData.mesurment}cm',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),), 
                            trailing: Text('${productData.price}RS',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),), 
                            leading: QrImageView(
                                 data: productData.name,
                                 version: QrVersions.auto,
                                 size: 100.0,
                                 ),
                           
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ProductOperationSuccess) {
                productBloc.add(LoadProducts()); // Reload todos
                return Container(); // Or display a success message
              } else if (state is ProductError) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Container();
              }
           }
           
         ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showAddTodoDialog(context);
            },
            child: const Icon(Icons.add),
          ),
    );
  }
   void _showAddTodoDialog(BuildContext context) {
      final nameController = TextEditingController();
      final mesurmentController = TextEditingController();
      final priceController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const  Text('Add Todo'),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Product Name'),
                ),
                TextField(
                  controller: mesurmentController,
                  decoration: const InputDecoration(hintText: 'Product mesurment'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(hintText: 'Product price'),
                ),
              ],
            ),
            
            actions: [
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  final todo = ProductModel(
                    id: DateTime.now().toString(),
                    name: nameController.text,
                    mesurment: mesurmentController.text,
                    price: priceController.text,
                    qrcode: nameController.text,
                  );
                  BlocProvider.of<ProductsBloc>(context).add(AddProduct(todo));
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
}
  


