/**
* I am a new handler
*/
component{
		
	/**
	* goAdmin
	*/
	function goAdmin( event, rc, prc ){
		event.setView( "RulesSecuredHandler/goAdmin" );
	}

	/**
	* goManager
	*/
	function goManager( event, rc, prc ){
		event.setView( "RulesSecuredHandler/goManager" );
	}

	/**
	* goEmployee
	*/
	function goEmployee( event, rc, prc ){
		event.setView( "RulesSecuredHandler/goEmployee" );
	}

	/**
	* goAdminAndManager
	*/
	function goAdminAndManager( event, rc, prc ){
		event.setView( "RulesSecuredHandler/goAdminAndManager" );
	}


	
}
