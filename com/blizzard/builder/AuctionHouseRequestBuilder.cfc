<cfcomponent output="false" extends="com.blizzard.builder.AbstractRequestBuilder">

	<cffunction name="constructRequestObject" returntype="com.blizzard.request.AbstractRequest" access="public" output="false">
	
		<cfset var ri		= 0 />
		<cfset var absUrl	= 0 />

		<cfset var reqObj 	= CreateObject( 'component', 'com.blizzard.request.AuctionHouseRequest' ).init( getPublicKey(), getPrivateKey(), getCache() ) />
		<cfset reqObj		= CreateObject( 'component', 'com.blizzard.decorator.LocaleSpecifier' ).init( reqObj ) />		

		<cfset ri 			= reqObj.getResourceIdentifier() & '/' & variables.util.nameToSlug( arguments.realm ) />
		<cfset absUrl		= getBaseUrl() & ri />
		
		<cfset reqObj.setDataFactory( getDataFactory() ) />
		<cfset reqObj.setLocalization( getLocalization() ) />
		<cfset reqObj.setGlobalIdentifier( absUrl ) />
		
		<cfreturn reqObj />
	</cffunction>

	<cffunction name="setDataFactory" returntype="void" access="public" output="false">
		<cfargument name="data_factory" type="com.blizzard.factory.AbstractRequestFactory" required="true" />
	
		<cfset variables.data_factory = arguments.data_factory />
	</cffunction>

</cfcomponent>