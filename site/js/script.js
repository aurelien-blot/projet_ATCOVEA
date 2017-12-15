var intituleDemande;
var statutDemande;
var codeAffaireDemande;
var dateDebutDemande;
var dateFinDemande;

var divDemandes = "<div id=\"exemple1\" class=\"demande\"><h2>"+intituleDemande+"</h2><div class=\"first_line_demande\"><p><span class=\"gras\">Enseigne :</span> <span>COVEA</span></p><p><span class=\"gras\">Statut : </span><span>"+statutDemande+"</span></p></div><p><span class=\"gras\">Code Affaire :</span> <span>"+codeAffaireDemande+"</span></p><div class=\"last_line_demande\"><p>Mise en ligne : <span>"+dateDebutDemande+"</span></p><p>Dâte de clôture : <span>"+dateFinDemande+"</span></p></div></div>";

function creerDivDemande(intituleDemande, statutDemande, codeAffaireDemande, dateDebutDemande, dateFinDemande){

}

$.ajax({
	type: "GET",
	url : "http://192.168.1.20:8080/ATCOVEA_RESTful/webresources/epsi.lemans.demande",
	data : "",
	headers : {
		accept: "application/json"
	},

	success : function( mydata ) {
		for(i=0; i<mydata.length;i++){
            console.log(mydata[i].codeAffaireDemande);
            $("#demandes").append("<div class=\"demande\">"+(mydata[i].codeAffaireDemande)+"</div>");
        }
        //$.each(mydata.data, function(i, obj) {

            //$("#pages").append("<h1>CA MARCHE</h1>")
          //$(".test").append("<div>" + obj.first_name + "</div>");


	}
});
