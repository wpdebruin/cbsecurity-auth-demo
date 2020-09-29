/**
* I am a new handler
*/
component{
	
	property name="UserService" inject;	
	/**
	* index
	*/
	function index( event, rc, prc ){
		if (jwtAuth().isLoggedIn()){
			var token = jwtAuth().getToken();
			writeDump( jwtAuth().decode(token));
		} else {
			writedump("NOT loggedIn");
		}
		prc.users = UserService.listArray();
		event.setView( "Users/index" );
	}

	/**
	* show
	*/
	function show( event, rc, prc ){
		param rc.id = 1;
		prc.user = UserService.get(rc.id);
		event.setView( "Users/show" );
	}

	/**
	* create
	*/
	function create( event, rc, prc ){
		prc.user = UserService.create(oUser);
		event.setView( "Users/create" );
	}

	/**
	* update
	*/
	function update( event, rc, prc ){
		event.setView( "Users/update" );
	}

	/**
	* delete
	*/
	function delete( event, rc, prc ){
		event.setView( "Users/delete" );
	}

	function createSomeUsers( event,rc,prc ){

		var oUser = UserService.new();
		populateModel( 
			model = oUser, 
			memento ={
				"email": "admin@mycompany.com",
				"password": "changeme",
				"permissions": "admin"
			});
		UserService.create(oUser);

		var oUser = UserService.new();
		populateModel( 
			model = oUser, 
			memento ={
				"email": "manager@mycompany.com",
				"password": "changeme",
				"permissions": "manager"
			});
		UserService.create(oUser);

		var oUser = UserService.new();
		populateModel( 
			model = oUser, 
			memento ={
				"email": "employee@mycompany.com",
				"password": "changeme",
				"permissions": "employee"
			});
		UserService.create(oUser);

	}
}
