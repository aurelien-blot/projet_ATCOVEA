$.ajax({
	type: "GET",
	url : "http://192.168.1.20:8080/ATCOVEA_RESTful/webresources/epsi.lemans.demande",
	data : "",
	headers : {
		accept: "application/json"
	},
	success : function( mydata ) {
		//alert ("j'ai reçu "+ mydata);
	}
});
