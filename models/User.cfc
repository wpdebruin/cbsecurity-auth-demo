/**
* I am the user object for cbsecurity. 
*/
component accessors="true"{
	
	// DI
	property name="auth" inject="authenticationService@cbauth";
	property name="bcrypt" inject="@BCrypt";

	property name="id";
	property name="email";
	property name="password";
	property name="permissions";

	/**
	 * Constructor
	 */
	User function init(){
		
		return this;
	}
	
	/************************************************************************************/
	/************** METHODS FOR cbsecurity.interfaces.IAuthUser.cfc  *********************/
	/************************************************************************************/

	boolean function hasPermission( required permission ) {
		return arguments.permission
			.listToArray()
			.some( ( item ) => {
				return listFindNoCase( this.getPermissions(), item );
			} )
	}

	boolean function isLoggedIn() {
		return auth.isLoggedIn();
	};

	/************************************************************************************/
	/************** METHODS FOR cbsecurity.interfaces.IAuthUser.cfc  *********************/
	/************************************************************************************/
	/**
	 * A struct of custom claims to add to the JWT token
	 */
	struct function getJwtCustomClaims() {
		return {
		}
	};

	/**
	 * This function returns an array of all the scopes that should be attached to the JWT token that will be used for authorization.
	 */
	array function getJwtScopes() {
		// I am returning EACH permission as a scope. This is absolutely not required!
		return listToArray(this.getPermissions());
	};
}