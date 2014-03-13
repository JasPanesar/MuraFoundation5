<cfoutput>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSid($.content('menuTitle'))#" data-spy="scroll" data-target=".subnav" data-offset="50">

		<div class="off-canvas-wrap">
			<div class="inner-wrap">

				<cfinclude template="inc/navbar.cfm" />

				<header>
					<div class="row">
						<h1 class="hide-for-small">#$.content('title')#</h1>
						<h4 class="hide-for-small">#$.siteConfig('tagline')#</h4>
					</div>
				</header>

				<!---
					The Carousel/Slideshow
					Refer to the theme's contentRenderer.cfc for details on this method and its arguments/options
					NOTES: 
						* This theme is designed for Mura 6.1+
						* Only content items with an 'Associated Image' will be rendered
						* You can control the crop of the carousel image by using the custom defined 'carouselimage' image size // 'carouselimage'
				--->
					<div class="row">
						#$.dspOrbitByFeedName(
							feedName='Slideshow'
							, showCaption=true
							, cssID='orbit-container'
							, size='carouselimage'
							, interval=5000
							, autoStart=true
						)#
					</div><!-- // orbit // -->

					<div class="row">
						<section class="large-9 small-12 columns content">
							<!--- The content --->
							#$.dspBody(
								body=$.content('body')
								, pageTitle=''
								, crumbList=false
								, showMetaImage=false
							)#
							<!--- Display Objects assigned to display region 2 (Main Content) --->
							#$.dspObjects(2)#
						</section>
						<aside class="large-3 small-12 columns">
							<!--- Display Objects assigned to display region 3 (Right Column) --->
							#$.dspObjects(3)#
						</aside>
					</div><!-- // content // -->

					<cfinclude template="inc/footer.cfm" />
	<cfinclude template="inc/html_foot.cfm" />
</cfoutput>