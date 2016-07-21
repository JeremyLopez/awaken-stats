function fixSorting() {
	$(".fa-sorting").children("i").remove();
	
	$(".dataTables_scrollHead").find(".sorting_asc").append("<i class='fa fa-sort-amount-asc' aria-hidden='true'></i>");
	$(".dataTables_scrollHead").find(".sorting_desc").append("<i class='fa fa-sort-amount-desc' aria-hidden='true'></i>");
	$(".dataTables_scrollHead").find(".sorting_asc").addClass("fa-sorting");
}

$(document).on("turbolinks:load", function() {
	
	$("#timecard-index").DataTable({
		scrollX: true,
		columnDefs: [ {
			targets: [0],
			width: "100px"
		} ]
	});
	
	$(".paginate_button").css("display", "inline-block");
	
	$('#timecard-index').on( 'draw.dt', function () {
    console.log( 'Table redrawn' );
		
		$(".paginate_button").css("display", "inline-block");
	});
	
});