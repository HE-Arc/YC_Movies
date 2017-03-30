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


  function gup( name, url ) {
        url = url.substring(1);
       var vars = url.split("&");
       var i = 0;
       while(vars[i]) {
       var splitted = vars[i].split("=");

         if(splitted[0] == name)
          {
            return splitted[1];
          }
          i++;
       }
       return false;
}

});
