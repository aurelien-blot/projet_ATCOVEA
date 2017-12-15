$.ajax({
 	method: "GET",
    url:  "https://api-adresse.data.gouv.fr/search/?q=",
    data: { },
    success : function(mydata) {
        console.log(mydata);
		/*$.each(mydata.data, function(i, obj) {
		      console.log(obj);
		});*/
    }
});
