/*
	This file is part of the MuraFoundation5 Theme
*/
component extends="mura.cfobject" output="false" {

	/*
			This is the THEME eventHandler.cfc 

			* Add theme-specific eventHandlers here
			* This file is much like a controller in a MVC application 
			* Reload the application when additions/changes are made to THIS file!
	*/

	public any function onSiteRequestStart($) {
		// http://dominicwatson.github.io/cfstatic/full-guide.html (See Configuration section)
		// if in production, set checkForUpdates=false
		arguments.$.static(
			outputDirectory = 'compiled'
			, checkForUpdates = !arguments.$.siteConfig('cache')
			, lessGlobals = ExpandPath($.siteConfig('themeAssetPath') & '/css/less-globals/globals.less')
		);
	}

	public any function onRenderStart($) {
		// for code syntax highlighting
		try {
			arguments.$.loadPrettify();
		} catch(any e) {
			// Mura CMS version is probably older than 6.1
		}
	}

	public any function onRenderEnd($) {
		var response = ReplaceNoCase($.event('__muraresponse__'), '</body>', '#$.event('htmlfoot')#</body>');
		$.event('__muraresponse__', response);
	}


}