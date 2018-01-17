// Récupération id url de page
var url = window.location.search;
var id_offre = url.substring(url.lastIndexOf("=")+1);

$.ajax({
    type: "GET",
    url : "http://192.168.43.175:8080/ATCOVEA_RESTful/webresources/epsi.lemans.demande/" + id_offre,
    data : "",
    headers : {
        accept: "application/json"
    },
    success : function( mydata ) {

    	// console.log(mydata);

			$(".idDemande").append(mydata.idDemande);
        	$(".interet_demande").append(mydata.idInteret.libelleInteret); 
        	$(".date_debut_demande").append(mydata.dateDebutDemande);
        	$(".date_fin_demande").append(mydata.dateFinDemande); 
        	$(".contexte_demande").append(mydata.contexteDemande); 
            $(".code_affaire_demande").append(mydata.codeAffaireDemande); 
			$(".details_prestation_demande").append(mydata.detailsPrestationDemande);
			$(".libelle_demande").append(mydata.libelleDemande);
			$(".nom_interloc_technique").append(mydata.idInterlocTechnique.nomInterlocTechnique);
			$('.nom_acheteur').append(' ');
			$(".nom_interloc_technique").append(mydata.idInterlocTechnique.prenomInterlocTechnique);
			$(".mail_interloc_technique").append(mydata.idInterlocTechnique.mailInterlocTechnique);
			$(".tel_interloc_technique").append(mydata.idInterlocTechnique.telInterlocTechnique);
			$(".nom_acheteur").append(mydata.idAcheteur.nomAcheteur);
			$('.nom_acheteur').append(' ');
			$(".nom_acheteur").append(mydata.idAcheteur.prenomAcheteur);
			// $(".mail_acheteur").append(mydata.idAcheteur.mail_acheteur);
			// $(".tel_acheteur").append(mydata.idAcheteur.tel_acheteur);

        }
}
);


$(".test").prepend('texte à insérer après ouverture');

// 4 boutons principaux

$('#bouton1').on('click', function(){
	$('#demande_detail_demande').show();
	$('#reponse_detail_demande').hide();
	$('#suivi_detail_demande').hide();
	$('#retour_client_detail_demande').hide();
});

$('#bouton2').on('click', function(){
	$('#reponse_detail_demande').show();
	$('#demande_detail_demande').hide();
	$('#suivi_detail_demande').hide();
	$('#retour_client_detail_demande').hide();
});

$('#bouton3').on('click', function(){
	$('#suivi_detail_demande').show();
	$('#demande_detail_demande').hide();
	$('#reponse_detail_demande').hide();
	$('#retour_client_detail_demande').hide();
});

$('#bouton4').on('click', function(){
	$('#retour_client_detail_demande').show();
	$('#demande_detail_demande').hide();
	$('#reponse_detail_demande').hide();
	$('#suivi_detail_demande').hide();
});




// affichage des boutons 2 3 4 si reponse, suivi, retour client  A MODIFIER AVEC CONDITION BDD

// if (reponse) === 1 {
// $('#bouton2').show();
// 	};

// if (suivi) === 1 {
// $('#bouton3').show();
// 	};

// if (retour) === 1 {
// $('#bouton4').show();
// 	};
