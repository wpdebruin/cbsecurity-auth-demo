component {
    
    function up( schema, query ){
        schema.create( "users", function(table) {
            table.increments( "id" );
            table.string( "email" ).unique();
            table.string( "password" );
            table.string( "permissions" );
        } );
    }
    
    function down( schema, query ){
        schema.drop( "users" );
    }        

}
