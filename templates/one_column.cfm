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
					<section class="content large-12 columns">
						<cfinclude template="inc/breadcrumb.cfm" />
						#$.dspBody(body=$.content('body'),pageTitle='',crumbList=0,showMetaImage=1)#
						#$.dspObjects(2)#
					</section>
				</div>

		<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>