edit_record = function(obj){
	var url = $(obj).attr("url");
	$.get(url, function(data){
		$(".single-page-form").html(data);
	});
}

login = function(){
 var email = $("#email").val();
 var password = $("#password").val();
 var data = {
 	"session[email]": email, 
 	"session[password]": password
 }
 $.ajax({
    url: 'http://api.bookmycook.dev:3000/sessions',
    type: 'post',
    data: data,
    dataType: 'json',
    success: function (data) {
    	debugger;
        window.location.href = "/cooks/1/edit_profile?auth_token="+data.auth_token
    }   
});
}
