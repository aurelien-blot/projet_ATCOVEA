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
