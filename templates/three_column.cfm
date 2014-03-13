<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#">

		<div class="off-canvas-wrap">
			<div class="inner-wrap">

				<cfinclude template="inc/navbar.cfm" />

				<header>
					<div class="row">
						<h1 class="large-12 columns">#$.content('title')#</h1>
					</div>
				</header>

				<div class="row">
					<aside class="large-3 columns">
						#$.dspObjects(1)#
					</aside>
					<section class="large-6 columns content">
						<cfinclude template="inc/breadcrumb.cfm" />
						#$.dspBody(
							body=$.content('body')
							, pageTitle=''
							, crumbList=false
							, showMetaImage=true
						)#
						#$.dspObjects(2)#
					</section>
					<aside class="large-3 columns">
						#$.dspObjects(3)#
					</aside>
				</div><!--- /.row --->

		<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>