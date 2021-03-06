<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="#HTMLEditFormat($.content('metaDesc'))#">
	<meta name="keywords" content="#HTMLEditFormat($.content('metaKeywords'))#">
	<cfif len($.content('credits'))><meta name="author" content="#HTMLEditFormat($.content('credits'))#"></cfif>
	<meta name="generator" content="Mura CMS #$.globalConfig('version')#">

	<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>

	<!--- Foundation core CSS --->
	<!--- <link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/foundation/css/foundation.min.css"> --->

	<!--- Foundation core CSS --->
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/foundation/css/foundation.min.css">

	<!--- Font Awesome --->
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/assets/font-awesome/css/font-awesome.css">
	<!--- Mura CMS --->
	<link rel="stylesheet" href="#$.siteConfig('assetPath')#/css/mura.6.1.1.min.css">
	
	<!--- Open Sans Google Font --->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	
	<!--- CfStatic THEME CSS --->
	<cf_CacheOMatic key="globalheadercss">
		#$.static()
			.include('/css/theme/')
			.renderIncludes('css')#
	</cf_CacheOMatic>
	
	<!--[if IE]>
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/ie/ie.css">
	<![endif]-->

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="#$.siteConfig('themeAssetPath')#/js/html5shiv/html5shiv.js"></script>
	<![endif]-->

	<!--- jQuery --->
	<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"></script>

	<!--- FAV AND TOUCH ICONS --->
	<link rel="shortcut icon" href="#$.siteConfig('assetPath')#/images/favicon.ico">
	<!--- <link rel="apple-touch-icon-precomposed" sizes="144x144" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="#$.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-57-precomposed.png"> --->

	<!--- MURA FEEDS --->
	<cfset rs=$.getBean('feedManager').getFeeds($.event('siteID'),'Local',true,true) />
	<cfloop query="rs"><link rel="alternate" type="application/rss+xml" title="#HTMLEditFormat($.siteConfig('site'))# - #HTMLEditFormat(rs.name)#" href="#XMLFormat('http://#listFirst(cgi.http_host,":")##$.globalConfig('context')#/tasks/feed/?feedID=#rs.feedID#')#"></cfloop>
</head>
</cfoutput>