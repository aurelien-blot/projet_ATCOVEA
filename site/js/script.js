// ATTENTION : modifier l'adresse http de liaison avec le serveur à chaque ligne "url"

// Fonction permettant de creer une demande
function creerDivDemande(intituleDemande, statutDemande, codeAffaireDemande, dateDebutDemande, dateFinDemande){
}

// Connexion au serveur
$.ajax({
	type: "GET",
	url : "http://192.168.43.175:8080/ATCOVEA_RESTful/webresources/epsi.lemans.demande",
	data : "",
	headers : {
		accept: "application/json"
	},

	success : function( mydata ) {
		for(i=0; i<mydata.length;i++){
            $("#demandes").append("<a href =\"html/detail_offre.html?id="+ mydata[i].idDemande +" \" class =\"lien_detail\"><div class=\"demande\"><h2>"+mydata[i].libelleDemande+"</h2><div class=\"first_line_demande\"><p><span class=\"gras\">Enseigne :</span> <span>COVEA</span></p><p><span class=\"gras\">Statut : </span><span>"+mydata[i].idStatut.libelleStatut+"</span></p></div><p><span class=\"gras\">Code Affaire :</span> <span>"+mydata[i].codeAffaireDemande+"</span></p><p>"+ mydata[i].detailsPrestationDemande+"</p><div class=\"last_line_demande\"><p>Mise en ligne : <span>"+mydata[i].dateDebutDemande+"</span></p><p>Dâte de clôture : <span>"+mydata[i].dateFinDemande+"</span></p></div></div></a>");

        }
	}
});
