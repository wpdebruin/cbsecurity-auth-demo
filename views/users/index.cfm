<cfoutput>
<h1>Users.index</h1>
<div class="row">
	<div class="col-lg-9">
		<section id="eventHandlers">
			<div class="pb-2 mt-4 mb-2 border-bottom">
				<h2>
					Login Section
				</h2>
			</div>
			<p>
				<cfif jwtAuth().isLoggedIn()>
					You are logged in as #jwtAuth().getUser().getEmail()#. Click here to login as:
				<cfelse>
					you are NOT logged in. Click here to login as:
				</cfif>
			<ul>
			<cfloop list="admin,manager,employee" index="myname">
				<cfset myEmail = urlEncodedFormat("#myname#@mycompany.com") >
			<li><a href="#event.buildLink( to ="auth.login", querystring="email=#myEmail#" )#">#myname#</a></li>
			</cfloop>
			</ul>
			<cfif jwtAuth().isLoggedIn()>
				Or click here to <a href="#event.buildLink( to ="auth.logout")#">logout</a> again
			</cfif>
		</p>
        </section>
    </div>
</div>

#writedump(prc.users)#
</cfoutput>