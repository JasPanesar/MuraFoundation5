<cfoutput>
			</div><!-- // off-canvas-wrap // -->
		</div><!-- // inner-wrap // -->

		<!--- Foundation JavaScript --->
		<script src="#$.siteConfig('themeAssetPath')#/assets/foundation/js/foundation.min.js"></script>
		<script>$(document).foundation();</script>

		<!--- CfStatic JS --->
		<cf_CacheOMatic key="globalfooterjs">
			#$.static().include('/js/theme/').renderIncludes('js')#
		</cf_CacheOMatic>
	</body>
</html>
</cfoutput>