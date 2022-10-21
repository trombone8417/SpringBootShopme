$(document).ready(function() {
	$("#products").on("click", "#linkAddProduct", function(e) {
		e.preventDefault();
		link = $(this);
		url = link.attr("href");
		
		$("#addProductModal").on("shown.bs.modal", function() {
			$(this).find("iframe").attr("src", url);
		});
		
		$("#addProductModal").modal();
	})
});

function addProduct(productId, productName) {
	$("#addProductModal").modal("hide");
	showWarningModal("Product is not added.");
}

function isProductAlreadyAdded(productId) {
	productExists = false;

	$(".hiddenProductId").each(function(e) {
		aProductId = $(this).val();

		if (aProductId == productId) {
			productExists = true;
			return;
		}
	});

	return productExists;
}









