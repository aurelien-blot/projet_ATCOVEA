$.ajax(
{
    method: "GET",
	url: "http://192.168.43.175:8080/ATCOVEA_RESTful/webresources/epsi.lemans.demande",
	data: { },
	headers : {
		accept: "application/json"
	},
	success : function( mydata ) {
			console.log(mydata);
	        $.each(mydata, function(i, obj) {
	          $(".code_affaire").append("<option>" + obj.codeAffaireDemande + "</option>" );
	        });
	        }
}
);

$.ajax(
{
    method: "GET",
	url: "http://192.168.43.175:8080/ATCOVEA_RESTful/webresources/epsi.lemans.developpeur",
	data: { },
	headers : {
		accept: "application/json"
	},
	success : function( mydata ) {
			console.log(mydata);
	        $.each(mydata, function(i, obj) {
	          $(".profil_dev").append("<option value ='"+obj.idDeveloppeur+"'>" + obj.nomDeveloppeur + "  " + obj.prenomDeveloppeur + "</option>" );
	        });
	        }
}
);

$(".profil_dev").change(function(){

	//console.log($(".profil_dev").val());

$.ajax(
{
    method: "GET",
	url: "http://192.168.43.175:8080/ATCOVEA_RESTful/webresources/epsi.lemans.developpeur/"+ $(".profil_dev").val(),
	data: { },
	headers : {
		accept: "application/json"
	},
	success : function( mydata ) {
			console.log(mydata);
			$(".mail_dev").empty();
	        $(".mail_dev").append("<p>" + mydata.cv + "</p>" );
	        $(".competence_dev").empty();
	        $(".competence_dev").append("<p>" + mydata.competencesDeveloppeur + "</p>" );
	        }
}
);

}
);