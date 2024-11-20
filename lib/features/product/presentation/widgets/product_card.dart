part of '_widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        color: BaseColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: FontTheme.poppins10w700black().copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp ${product.price.toString()}",
                    style: FontTheme.poppins12w600black().copyWith(
                      color: BaseColors.success,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Stock: ",
                          style: FontTheme.poppins12w600black(),
                        ),
                        TextSpan(
                          text: product.stock.toString() == '0'
                              ? 'Empty'
                              : product.stock.toString(),
                          style: FontTheme.poppins12w600black().copyWith(
                            color: product.stock.toString() == '0'
                                ? BaseColors.danger
                                : BaseColors.neutral100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Description: ",
                  style: FontTheme.poppins12w500black().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: product.description,
                  style: FontTheme.poppins12w500black(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
