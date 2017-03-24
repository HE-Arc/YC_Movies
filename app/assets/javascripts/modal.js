jQuery(document).ready(function() {
    
	$('.launch-modal').on('click', function(e){
    e.preventDefault();

  var href = $(this).attr('href');
	var uid = gup("uid",href);


    var link = "https://www.youtube.com/embed/"+uid;
    if(uid == "picture") link = gup("pic",href);
    $("#iframe-modal").attr("src", link);
    $( '#' + $(this).data('modal-id') ).modal();
	});

  function getUid(str) {
      return str.split('=')[1];
  }

  function gup( name, url ) {
    if (!url) url = location.searchs;
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( url );
    return results == null ? null : results[1];
}

});
