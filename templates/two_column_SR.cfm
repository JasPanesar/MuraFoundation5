<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">

		<div class="off-canvas-wrap">
			<div class="inner-wrap">

				<cfinclude template="inc/navbar.cfm" />

				<header>
					<div class="row">
						<h1 class="hide-for-small">#$.content('title')#</h1>
					</div>
				</header>

				<div class="row">
					<section class="large-9 medium-9 small-8 columns content">
						<cfinclude template="inc/breadcrumb.cfm" />
						#$.dspBody(
							body=$.content('body')
							, pageTitle=''
							, crumbList=false
							, showMetaImage=true
						)#
						#$.dspObjects(2)#
					</section>
				    <aside class="large-3 medium-3 small-4 columns sidebar">
						#$.dspObjects(3)#
					</aside><!-- /aside -->
				</div><!--- /.row --->

		<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>