/**
* I am the UserService for cbauth and cbsecurity
*/
component singleton accessors="true"{
	
	// Properties
	property name="wirebox"   inject="wirebox";
    property name="query" inject="provider:QueryBuilder@qb";	
	property name="populator" inject="wirebox:populator";

	/**
	 * Constructor
	 */
	UserService function init(){
		
		return this;
	}
	
	/**
	 * list array of users
	 */
	function listArray(){
		return query.from("users")
			.get();
	}
	/**
	 * function get
	 */
	function get( required numeric Id ){
		var q = query.from("users")
			.where("id", arguments.id)
			.first();
		return populator.populateFromStruct(
			target = new(),
			memento = q
		);
	}

	/**
	 * new user
	 */
	function new(){
		return wirebox.getInstance("User");
	}

	/**
	 * create user
	 * @User
	 */
	function create( User oUser){
		var q=query.from("users")
			.insert({
				"email": oUser.getEmail(),
				"password": oUser.getPassword(),
				"permissions": oUser.getPermissions()
			});
		return oUser.setId(q.result.generatedKey);
	}
	/**
	 * update User
	 * @User
	 */
	function update( User oUser){
		query.from("users")
			.where("id", oUser.getId())
			.update(
				{
					"email": oUser.getEmail(),
					"password": oUser.getPassword(),
					"permissions": oUser.getPermissions()
				}
			);
	}

	/**
	 * delete user
	 * @User
	 */
	function delete( User oUser ){
		query.from("users")
			.where("id", oUser.getId())
			.delete();
	}

	/************************************************************************************/
	/************** METHODS FOR cbsecurity.interfaces.IUserService  *********************/
	/************************************************************************************/
	/**
	 * Verify if the incoming username/password are valid credentials.
	 *
	 * @username The username
	 * @password The password
	 */
	boolean function isValidCredentials( required username, required password ) {
		// if you are using bcrypt the locic is different.
		// in that case you retrieve user based on username and validates password in the userObject which has a comparison function for bcrypt
		// but this is plaintext (stupid) password storage
		var q = query.from( "users" )
			.where( "email", arguments.UserName ) //email address in our case
			.andwhere( "password", arguments.password )
			.first();
		return !q.isEmpty();
	}

	/**
	 * Retrieve a user by username
	 *
	 * @return User that implements JWTSubject and/or IAuthUser
	 */
	function retrieveUserByUsername( required username ) {
		var sUser = query.from( "users" )
			.where( "email", arguments.username )
			.first();
		return get( sUser.id );
	};

	/**
	 * Retrieve a user by unique identifier
	 *
	 * @id The unique identifier
	 *
	 * @return User that implements JWTSubject and/or IAuthUser
	 */
	function retrieveUserById( required id ) {
		return get( arguments.id )
	};

}