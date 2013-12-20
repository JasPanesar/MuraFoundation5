<cfoutput>
		<nav class="top-bar hide-for-small">
			<ul class="title-area">
		        <!-- Title Area -->
		        <li class="name">
		          <h1><a href="#$.createHREF(filename='')#">#$.siteConfig('site')#</a></h1>
		        </li>
		      </ul>
	
			<section class="top-bar-section">
						<div class="right">
						<cf_CacheOMatic key="dspPrimaryNav#$.content('contentid')#">
							#$.dspPrimaryNav(
								viewDepth=1
								, id='navPrimary'
								, class=''
								, displayHome='Never'
								, closeFolders=false
								, showCurrentChildrenOnly=false
								, ulTopClass=''
								, ulNestedClass='dropdown'
								, liHasKidsClass='has-dropdown not-click'
								, liHasKidsCustomString=''
								, liHasKidsNestedClass=''
								, liNestedClass=''
								, aHasKidsClass=''
								, aHasKidsCustomString=''
								, liCurrentClass='active'
								, aCurrentClass=''
								, siteid=$.event('siteid')
							)#
						</cf_CacheOMatic>
						<!---
							Optional named arguments for Primary Nav are:
							displayHome="Always/Never/Conditional"
							openFolders/closeFolders="contentid,contentid" 
								(e.g. show specific sub-content in dropdown nav)
						--->
						<ul class="right">
						<li class="has-form">
						<form id="searchForm" class="row collapse" role="search">
							<div class="large-8 medium-8 columns">
								<input type="text" name="Keywords" id="txtKeywords" class="" value="#HTMLEditFormat($.event('keywords'))#" placeholder="#$.rbKey('search.search')#">
							</div>
							<div class="large-4 medium-4 columns">
								<button type="submit" class="button expand">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<input type="hidden" name="display" value="search">
							<input type="hidden" name="newSearch" value="true">
							<input type="hidden" name="noCache" value="1">
						</form>
						</li>
					</ul>
						</div>
			</section> <!--- / top-bar-section --->

		</nav><!--- /.navbar --->
		<!--- Mobile Nav --->
		<nav class="tab-bar show-for-small">
	        <a class="left-off-canvas-toggle menu-icon"><span>#$.siteConfig('site')#</span></a>
	    </nav>
	    <aside class="left-off-canvas-menu">
	      		<cf_CacheOMatic key="dspMobileNav#$.content('contentid')#">
							#$.dspPrimaryNav(
								viewDepth=0
								, id='navPrimary'
								, class=''
								, displayHome='Never'
								, closeFolders=false
								, showCurrentChildrenOnly=false
								, ulTopClass='off-canvas-list'
								, ulNestedClass=''
								, liHasKidsClass=''
								, liHasKidsCustomString=''
								, liHasKidsNestedClass=''
								, liNestedClass=''
								, aHasKidsClass=''
								, aHasKidsCustomString=''
								, liCurrentClass='active'
								, aCurrentClass=''
								, siteid=$.event('siteid')
							)#
						</cf_CacheOMatic>
		    </aside>
</cfoutput>