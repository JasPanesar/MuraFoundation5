<cfoutput>
	<hr>
	<footer class="row">
		<div class="large-10 columns">
			<ul class="inline-list">
				<li>&copy; #HTMLEditFormat($.siteConfig('site'))# #year(now())#</li>
				<li><a href="#$.createHref(filename='site-map')#">Site Map</a></li>
				<li><a href="#$.createHref(filename='font-awesome')#">Font Awesome</a></li>
				<li><a href="http://foundation.zurb.com/">Foundation</a></li>
				<li><a href="##" data-reveal-id="myModal">Sample Modal Window</a></li>
			</ul>
		</div>
		<cfset backToTop = '<a href="##"><i class="icon-circle-arrow-up"></i> Back to top</a>' />
		<div class="large-2 columns">
			<p class="hide-for-small pull-right">#backToTop#</p>
		</div>
	</footer>
	#$.dspThemeInclude('display_objects/examples/sampleModalWindow.cfm')#
</cfoutput>