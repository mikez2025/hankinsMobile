<cfcomponent output="false">

	<!--- Application name, should be unique --->
	<cfset this.name = "hspwbMobile2019">
    <cfset application.dsnnameMySQL = "hspwb19">

	<cfset this.applicationTimeout = createTimeSpan(0,3,0,0)>
	<cfset this.clientManagement = false>
	<cfset this.clientStorage = "registry">
	<cfset this.loginStorage = "session">
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,3,0,0)>
	<cfset this.setClientCookies = true>
	<cfset this.setDomainCookies = false>
	<cfset this.scriptProtect = "none">
	<cfset this.secureJSON = false>
	<cfset this.secureJSONPrefix = "">
	<cfset this.welcomeFileList = "">
	<cfset this.mappings = structNew()>
	<cfset this.customtagpaths = "">

  
   
	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">
        
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		<cfinclude template="#arguments.thePage#">
	</cffunction>


	<cfset This.welcomeFileList="index.cfm"> 
 
<!--- Runs when your session starts --->
<cffunction name="onSessionStart" returnType="void" output="false">
	<cfscript>
		application.dsnnameMySQL = "hspwb19";
		session.e_server = "mail.mxserver16.com";
		session.e_user = "errors195@mxserver16.com";
		session.e_pass = "07Q8jYBqWR1";
		session.e_port = "587";
		session.e_ClientEmail = "support@emaxed.com";
		session.e_bccEmail = "support@emaxed.com";
	</cfscript>
</cffunction>


<!--- Runs when session ends --->
<cffunction name="onSessionEnd" returnType="void" output="false">
	<cfargument name="sessionScope" type="struct" required="true">
	<cfargument name="appScope" type="struct" required="false">
</cffunction>




<cffunction name="onError"> 
    <cfargument name="Exception" required=true/> 
    <cfargument type="String" name="EventName" required=true/> 
     <!--- Log all errors. ---> 
    <cflog file="#This.Name#" type="error"  
            text="Event Name: #Arguments.Eventname#" > 
    <cflog file="#This.Name#" type="error"  
            text="Message: #Arguments.Exception.message#"> 
    <cflog file="#This.Name#" type="error"  
        text="Root Cause Message: #Arguments.Exception.rootcause.message#"> 
    <cfif NOT (Arguments.EventName IS "onSessionEnd") OR (Arguments.EventName IS "onApplicationEnd")> 
		<cfset errorType = "SiteError">
        
        <cfinclude template = "error.cfm"> 
    </cfif> 
</cffunction>

		
</cfcomponent>