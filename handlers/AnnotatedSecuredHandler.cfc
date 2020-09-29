/**
* I am a new handler
*/
component{
	
	/**
	* goAdmin
	*/
	function goAdmin( event, rc, prc )  secured="admin" {
		event.setView( "AnnotatedSecuredHandler/goAdmin" );
	}

	/**
	* goManager
	*/
	function goManager( event, rc, prc )  secured="manager"{
		event.setView( "AnnotatedSecuredHandler/goManager" );
	}

	/**
	* goEmployee
	*/
	function goEmployee( event, rc, prc ) secured="employee"{
		event.setView( "AnnotatedSecuredHandler/goEmployee" );
	}

	/**
	* goAdminAndManager
	*/
	function goAdminAndManager( event, rc, prc )  secured="admin,manager"{
		event.setView( "AnnotatedSecuredHandler/goAdminAndManager" );
	}


	
}
