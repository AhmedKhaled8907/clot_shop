import 'package:clot_shop/common/helper/bloc/button/button_state_cubit.dart';
import 'package:clot_shop/common/widgets/button/basic_reactive_button.dart';
import 'package:clot_shop/data/order/models/order_registration_req.dart';
import 'package:clot_shop/domain/order/entity/product_ordered_entity.dart';
import 'package:clot_shop/domain/order/usecases/order_registration_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/helper/cart/cart_helper.dart';
import '../../../common/helper/functions/my_validators.dart';
import '../../../common/helper/navigator/app_navigator.dart';
import '../../../common/widgets/app_bar/basic_app_bar.dart';
import 'order_placed_page.dart';

class Checkout extends StatefulWidget {
  final List<ProductOrderedEntity> products;

  const Checkout({super.key, required this.products});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _addressController;
  late TextEditingController _paymentController;
  late FocusNode _addressFocusNode;
  late FocusNode _paymentFocusNode;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _paymentController = TextEditingController();
    _addressFocusNode = FocusNode();
    _paymentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _paymentController.dispose();
    _addressFocusNode.dispose();
    _paymentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String subtotalPrice =
        CartHelper.calculateSubTotal(widget.products).toString();

    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: const BasicAppBar(
            title: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const OrderPlacedPage(),
                );
              }
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: Builder(builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _addressField(context),
                                const SizedBox(height: 16),
                                _paymentField(context),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(height: 24),
                          ),
                          SizedBox(
                            height: height / 3.5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 6,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _subtotal(subtotalPrice),
                                  _shippingCost(),
                                  _tax(),
                                  _total(subtotalPrice),
                                  _placeOrder(
                                    subtotalPrice,
                                    widget.products,
                                    context,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextFormField(
      controller: _addressController,
      focusNode: _addressFocusNode,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: 'Shipping Address',
        suffixIcon: Icon(
          Icons.keyboard_arrow_right_rounded,
          size: 36,
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        return MyValidators.displayNameValidator(value);
      },
      onFieldSubmitted: (value) {
        return FocusScope.of(context).requestFocus(_paymentFocusNode);
      },
    );
  }

  Widget _paymentField(BuildContext context) {
    return TextFormField(
      controller: _paymentController,
      focusNode: _paymentFocusNode,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(
        hintText: 'Payment Method',
        suffixIcon: Icon(
          Icons.keyboard_arrow_right_rounded,
          size: 36,
        ),
      ),
      validator: (value) {
        return MyValidators.displayNameValidator(value);
      },
      onFieldSubmitted: (value) {},
    );
  }

  Widget _subtotal(String subtotalPrice) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Subtotal',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$subtotalPrice',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _shippingCost() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shipping Cost',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${8}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _tax() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tax',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${0}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _total(String subtotalPrice) {
    var total = (double.parse(subtotalPrice) + 8).toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$total',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _placeOrder(
    String subtotalPrice,
    List<ProductOrderedEntity> products,
    BuildContext context,
  ) {
    var total = (double.parse(subtotalPrice) + 8);

    return BasicReactiveButton(
      height: 55,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          FocusScope.of(context).unfocus();
          context.read<ButtonStateCubit>().execute(
                usecase: OrderRegistrationUsecase(),
                params: OrderRegistrationReq(
                  shippingAddress: _addressController.text,
                  paymentMethod: _paymentController.text,
                  products: products,
                  createdAt: DateTime.now().toString(),
                  itemsCount: products.length,
                  totalPrice: total,
                ),
              );
        }
      },
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$total',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Place Order',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
