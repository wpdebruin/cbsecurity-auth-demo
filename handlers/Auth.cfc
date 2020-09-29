/**
* I am a new handler
*/
component{
	
	//DI
	property name="cookieStorage" inject="cookieStorage@cbstorages";

	/**
	* login
	*/
	function login( event, rc, prc ){
		param rc.email="admin@mycompany.com";
		var myToken = jwtAuth().attempt( rc.email, "changeme");
		cookieStorage.set("x-auth-token", myToken);
		relocate("Users.index")
	}

	/**
	* logout
	*/
	function logout( event, rc, prc ){
		jwtAuth().logout();
		cookieStorage.delete("x-auth-token");
		relocate("Users.index")
	}


	
}
