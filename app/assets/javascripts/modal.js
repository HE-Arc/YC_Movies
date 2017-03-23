jQuery(document).ready(function() {
    
	$('.launch-modal').on('click', function(e){
    e.preventDefault();

  var href = $(this).attr('href');
	var uid = getUid(href);


    var link = "https://www.youtube.com/embed/"+uid;
    $("#iframe-modal").attr("src", link);
    $( '#' + $(this).data('modal-id') ).modal();
	});

  function getUid(str) {
      return str.split('=')[1];
  }

});
