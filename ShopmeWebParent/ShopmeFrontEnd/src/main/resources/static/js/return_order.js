var returnModal;
var modalTitle;

$(document).ready(function() {
	returnModal = $("#returnOrderModal");
	modalTitle = $("#returnOrderModalTitle");
	
	$(".linkReturnOrder").on("click", function(e) {
		e.preventDefault();
		handleReturnOrderLink($(this));
	});
})

function handleReturnOrderLink(link){
	orderId = link.attr("orderId");
	returnModal.modal("show");
	modalTitle.text("Return Order ID #" + orderId);
}













