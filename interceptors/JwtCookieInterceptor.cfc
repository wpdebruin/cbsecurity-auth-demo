/**
* I am a jwt cookie to rc interceptor
*/
component{
	
	property name="cookieStorage" inject="provider:cookieStorage@cbstorages";

	void function configure(){
	
	}
	
	void function preProcess( event, interceptData, buffer, rc, prc ){
		if ( len(cookieStorage.get("x-auth-token",""))) {
			rc["x-auth-token"]= cookieStorage.get("x-auth-token");
		}
	}
}

