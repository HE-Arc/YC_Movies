jQuery(document).ready(function() {
  //Il faut attacher la fonction au document ou a un élément parent !!
  //Sinon lorsqu'on applique un filtre, il n'éxecute plus la fenêtre modal
	$(document).on("click", ".launch-modal", function(e){
    e.preventDefault();

  var href = $(this).attr('href');
	var uid = gup("uid",href);


    var link = "https://www.youtube.com/embed/"+uid;
    if(uid == "picture") 
      {
        link = gup("pic",href);
         $("#object-id").attr("data", link);
        $('#modal-picture').modal();
      }
      else
      {
       $("#iframe-modal").attr("src", link);
       $( '#' + $(this).data('modal-id') ).modal();
      }
        //Pour que la vidéo s'arrête
      $("#modal-video").on('hidden.bs.modal', function (e) {
      $("#modal-video iframe").attr("src", $("#modal-video iframe").attr("src"));
        });
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
