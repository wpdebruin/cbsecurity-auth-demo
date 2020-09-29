/**
* The base interceptor test case will use the 'interceptor' annotation as the instantiation path to the interceptor
* and then create it, prepare it for mocking, and then place it in the variables scope as 'interceptor'. It is your
* responsibility to update the interceptor annotation instantiation path.
*/
component extends="coldbox.system.testing.BaseInterceptorTest" interceptor="interceptors.JwtCookieInterceptor"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		
		// interceptor configuration properties, if any
		configProperties = {};
		// init and configure interceptor
		super.setup();
		// we are now ready to test this interceptor
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}
	
	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "interceptors.JwtCookieInterceptor", function(){
			
			it( "should configure correctly", function(){
				interceptor.configure();
				// Expectations here.
				expect( false ).toBeTrue();
			});
			
			it( "should execute preProcess", function(){
				// mocks
				var mockEvent = getMockRequestContext();
				var mockData  = {};
				
				// execute preProcess
				interceptor.preProcess( mockEvent, mockData );
				
				// expectations here
				expect( false ).toBeTrue();
			});

			
		});

	}
	
}
