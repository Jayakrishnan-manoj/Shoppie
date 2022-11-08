import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppie/screens/edit_product_screen.dart';
import '../providers/products_provider.dart';

class UserProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductsScreen.routeName, arguments: id);
            },
            icon: const Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () async {
              try {
                await Provider.of<Products>(context, listen: false)
                    .deleteProduct(id!);
              } catch (error) {
                scaffold.showSnackBar(
                  const SnackBar(
                    content: Text('Deletion failed!'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          )
        ],
      ),
    );
  }
}
