<!---
	This file is part of the MuraFoundation5 Theme
--->
<cfcomponent extends="mura.cfobject">

	<!---
			This is the THEME contentRenderer.cfc

			* Add theme-specific methods here
			* Any methods here will be accessible with the following notation:
				$.yourFunctionName()
	--->

	<cfscript>
		// general vars
		this.jsLib = 'jquery';
		this.jsLibLoaded = true;
		this.generalWrapperClass = 'panel';

		// headings
		this.headline = 'h1';
		this.subHead1 = 'h2';
		this.subHead2 = 'h3';
		this.subHead3 = 'h4';
		this.subHead4 = 'h5';

		//images
		this.bodyMetaImageClass="th";

		// nav and list item vars
		this.navWrapperClass = 'panel';
		this.liHasKidsClass = '';
		this.liHasKidsCustomString = '';
		this.liCurrentClass = 'active';
		this.liCurrentCustomString = '';
		this.aHasKidsClass = '';
		this.aHasKidsCustomString = '';
		this.aCurrentClass = 'active';
		this.aCurrentCustomString = '';
		this.ulTopClass = 'side-nav';
		this.ulNestedClass = '';
		this.ulNestedCustomString = '';
		this.liNestedClass = '';

		// pagination vars
		this.ulPaginationClass = 'pagination';
		this.ulPaginationWrapperClass = 'pagination';

		// form vars
		this.formWrapperClass = 'panel';

		// Display Objects
		// Use these variables to pass-in specific classes without having to create custom versions

		// calendar/dsp_showMonth.cfm
		this.calendarWrapperClass="mura-Calendar";
		this.calendarTableClass="";
		//this.calendarTableHeaderClass="";

		// calendar/dspList.cfm
		this.calendarListWrapperClass="mura-Calendar";

		// comments/index.cfm
		this.commentsWrapperClass="mura-Comments";
		this.commentFormWrapperClass="panel";
		this.commentFormClass="";
		this.commentNewClass="small button";
		this.commentFieldWrapperClass="row";
		this.commentFieldLabelClass="large-3 columns";
		this.commentInputWrapperClass="large-9 columns";
		this.commentInputClass="";
		this.commentClass="";
		this.commentPrefsInputWrapperClass="large-9 columns";
		this.commentSubmitButtonWrapperClass="large-12 columns";
		this.commentSubmitButtonClass="small button right";
		this.commentRequiredWrapperClass="large-9 columns";
		//this.commentUserEmailClass="";
		//this.commentDeleteButtonClass="";

		// comments/dsp_comment.cfm
		this.emailLinkClass="small button";
		this.commentsLinkClass="small button";
		this.approveCommentLinkClass="small button";
		this.deleteCommentLinkClass="small button";

		// datacollection/dsp_response.cfm
		this.datacollectionErrorPClass="alert-box warning radius";
		this.datacollectionErrorDivClass="alert-box warning radius";
		this.datacollectionSuccessPClass="alert-box success radius";

		// dataresponses/dsp_detail.cfm
		this.dataResponseListClass="";

		// dataresponses/dsp_list.cfm
		this.dataResponseTableClass="";
		this.dataResponsePaginationClass="pagination";

		// draggablefeeds/index.cfm
		this.draggableBoxWrapperClass="row";
		this.draggableBoxHeaderClass="large-12 columns";
		this.draggableBoxRSSWrapperClass="mura-RSSFeeds";
		this.draggableBoxHeaderButtonClass="small button";
		//this.draggableBoxRSSeditFormClass="";
		this.draggableBoxAddFeedWrapperClass="panel clearfix";
		this.draggableBoxNewFeedFormClass="";
		this.draggableBoxSelectFeedWrapperClass="large-6 columns";
		this.draggableBoxSelectFeedRowClass="row";
		this.draggableBoxSelectFeedMenuClass="";
		this.draggableBoxSelectFeedMenuDivClass="large-10 columns";
		this.draggableFeedMenuSelectFieldClass="";
		this.addFeedButtonWrapperDivClass="";
		this.addFeedButtonWrapperDivInnerClass="large-2columns";
		this.addFeedButtonClass="small button";

		// dsp_categories_nest.cfm
		this.categoriesNestClass="";

		// dsp_content_list.cfm
		this.contentListImageStyles=true;
		this.contentListPropertyMap={
			containerEl={tag="div"},
			itemEl={tag="dl",class="clearfix"},
			labelEl={tag="span"},
			title={tag="dt"},
			date={tag="dt"},
			credits={tag="dd",showLabel=true,rbkey="list.by"},
			tags={tag="dd",showLabel=true,labelDelim=":",rbkey="tagcloud.tags"},
			rating={tag="dd",showLabel=true,labelDelim=":",rbkey="list.rating"},
			'default'={tag="dd"}
		};
		this.contentListWrapperDivClass="";
		this.contentListItemImageLinkClass="clearfix";

		// dsp_folder.cfm
		this.folderWrapperClass="mura-Index";

		// dsp_edit_profile.cfm
		this.editProfileWrapperClass="mura-EditProfile";
		this.editProfileFormClass="";
		this.editProfileFormGroupWrapperClass="row";
		this.editProfileFieldLabelClass="large-3 columns";
		this.editProfileFormFieldsWrapperClass="large-9 columns";
		this.editProfileFormFieldsClass="";
		this.editProfileExtAttributeDownloadClass="large-3 columns";
		this.editProfileHelpBlockClass="";
		this.editProfileExtAttributeFileWrapperClass="large-6 columns";
		this.editProfileExtAttributeDownloadClass="large-3 columns";
		this.editProfileExtAttributeDownloadButtonClass="small button";
		this.editProfileSubmitButtonWrapperClass=" large-9 columns";
		this.editProfileSubmitButtonClass="btn btn-primary";
		this.editProfileSuccessMessageClass="alert-box success radius";

		// dsp_email_.cfm
		this.emailSelectClass="";

		// dsp_event_reminder_form.cfm
		this.eventReminderFormWrapperClass="mura-EventReminderForm";
		this.eventReminderFormClass="panel";
		this.eventReminderFieldWrapperClass="";
		this.eventReminderFormLabelsClass="";
		this.eventReminderSubmitClass="small button";

		// dsp_features.cfm
		this.featuresWrapperClass="mura-SyndLocal mura-Index clearfix";

		// dsp_feed.cfm
		this.localIndexWrapperClass="mura-SyndLocal mura-Feed mura-Index clearfix";
		this.remoteFeedWrapperClass="mura-SyndRemote mura-Index mura-Feed clearfix";

		// dsp_login.cfm
		this.loginWrapperClass="";
		this.loginWrapperInnerClass="";
		this.loginErrorMessageClass="alert-box warning radius";
		this.loginFormClass="";
		this.forgotPasswordFormClass="form-sendlogin";
		this.loginFormGroupWrapperClass="row";
		this.loginFormFieldLabelClass="";
		this.loginFormFieldWrapperClass="";
		this.loginFormFieldClass="";
		this.loginFormPrefsClass="";
		this.loginFormClass="";
		this.loginFormSubmitWrapperClass="";
		this.loginFormSubmitClass="small button";
		this.loginFormAlertClass="alert-box success radius";
		this.loginFormErrorClass="alert-box warning radius";
		this.notRegisteredLinkClass="small button";

		// dsp_mailing_list_master.cfm
		this.mailingListWrapperClass="panel";
		this.mailingListSuccessClass="alert-box success radius";
		this.mailingListErrorClass="alert alert-error";
		this.mailingListFormClass="";
		this.mailingListFormGroupWrapperClass="row";
		this.mailingListFormLabelClass="large-3 columns";
		this.mailingListFormFieldWrapperClass="large-9 columns";
		this.mailingListFormInputClass="text ";
		this.mailingListWrapperClass="large-10 columns";
		this.mailingListClass="";
		this.mailingListSubmitWrapperClass="";
		this.mailingListSubmitClass="submit small button";

		// dsp_nextN.cfm
		this.nextNWrapperClass="container";
		this.nextNInnerClass="row";

		// dsp_search_form.cfm
		this.searchFormClass="navbar-form";
		this.searchFormInputWrapperClass="";
		this.searchFormInputClass="";
		this.searchFormSubmitWrapperClass="-btn";
		this.searchFormSubmitClass="small button";

		// dsp_search_results.cfm
		this.searchResultWrapperClass="mura-SearchResults container";
		this.searchResultInnerClass="";
		this.searchResultsRowClass="";
		this.searchResultsMoreResultsRowClass="";
		this.searchReultsListClass="mura-Index";
		this.searchReultsPagerClass="pager";
		this.searchAgainRowClass="";
		this.searchAgainInnerClass="medium-12 columns";
		this.searchAgainFormClass="";
		this.searchAgainInputWrapperClass="";
		this.searchAgainFormInputClass="";
		this.searchAgainButtonWrapperClass="";
		this.searchAgainSubmitClass="small button";

		// dsp_user_tools.cfm
		this.userToolsLoginWrapperClass="panel clearfix";
		this.userToolsLoginFormClass="";
		this.userToolsFormGroupWrapperClass="row";
		this.userToolsLoginFormLabelClass="large-2 columns";
		this.userToolsLoginFormInputWrapperClass="large-10 columns";
		this.userToolsLoginFormInputClass="";
		this.userToolsLoginFormFieldInnerClass="large-10 columns";
		this.userToolsLoginFormClass="";
		this.userToolsLoginFormSubmitClass="small button";
		this.userToolsNotRegisteredLinkClass="small button";
		this.userToolsWrapperClass="clearfix";
		this.userToolsEditProfileLinkClass="small button";
		this.userToolsLogoutLinkClass="small button";

		// formbuilder/dsp_form.cfm
		this.formBuilderFieldWrapperClass="";
		this.formBuilderButtonWrapperClass="";
		this.formBuilderSubmitClass="small button";

		// formbuilder/fields/dsp_.cfm
		// formbuilder/fields/dsp_.cfm 
		// formbuilder/fields/dsp_file.cfm
		// formbuilder/fields/dsp_radio.cfm
		// formbuilder/fields/dsp_textfield.cfm

		this.formBuilderFormFieldsClass="";

		// formbuilder/fields/field_.cfm
		this.formBuilderTabHeaderClass="";
		this.formBuilderDisabledInputClass="disabled";
		this.formBuilderClass="";

		// gallery/index.cfm
		this.galleryWrapperClass="mura-Gallery";
		this.galleryULClass="clearfix";
		this.galleryThumbnailClass="th";

		// nav/calendarNav/index.cfm
		this.navCalendarWrapperClass="mura-Calendar mura-CalendarNav";

		// nav/calendarNav/navTools.cfc
		this.navCalendarTableClass="";

		// nav/dsp_sequential.cfm
		this.navSequentialWrapperClass="container";
		this.navSequentialInnerClass="row";

		// nav/dsp_tag_cloud.cfm
		this.tagCloudWrapperClass="mura-TagCloud";

		// navArchive
		this.navArchiveWrapperClass="panel";
		//this.navArchiveListClass="";


		// rater/index.cfm
		this.raterObjectWrapperClass="row mura-Ratings clearfix";
		this.raterWrapperClass="large-12 columns";
		this.avgRatingWrapperClass="large-12 columns";

		// sendToLink/SendLink.cfm
		this.sendToFriendSuccessClass="alert-box success radius";
		this.sendToFriendErrorClass="alert-box warning radius";

		// Generic form vars
		this.formWrapperClass = "";
	</cfscript>

	<cffunction name="dspOrbitByFeedName" output="false">
		<cfargument name="feedName" type="string" default="Slideshow" />
		<cfargument name="showCaption" type="boolean" default="true" />
		<cfargument name="cssID" type="string" default="orbit-container" />
		<cfargument name="size" type="string" default="custom" hint="If you want to use a custom height/width, then use 'custom' ... otherwise, you can use 'small, medium, large' OR any other predefined custom image size 'name' you created via the back-end administrator." />
		<cfargument name="width" type="numeric" default="1280" hint="width in pixels" />
		<cfargument name="height" type="numeric" default="500" hint="height in pixels" />
		<cfargument name="interval" type="any" default="5000" hint="Use either milliseconds OR use 'false' to NOT auto-advance to next slide." />
		<cfargument name="autoStart" type="boolean" default="true" />
		<cfargument name="bullets" type="boolean" default="true" />
		<cfargument name="showSummary" type="boolean" default="false" />
		<cfscript>
			var local = {};
			local.imageArgs = {};

			if ( not ListFindNoCase('small,medium,large,custom', arguments.size) and variables.$.getBean('imageSize').loadBy(name=arguments.size,siteID=variables.$.event('siteID')).getIsNew() ) {
				arguments.size = 'custom';
			};

			if ( not Len(Trim(arguments.size)) or LCase(arguments.size) eq 'custom' ) {
				local.imageArgs.width = Val(arguments.width);
				local.imageArgs.height = Val(arguments.height);
			} else {
				local.imageArgs.size = arguments.size;
			};
		</cfscript>
		<cfsavecontent variable="local.str"><cfoutput>
			<!--- BEGIN: Bootstrap Carousel --->
			<!--- IMPORTANT: This will only output items that have associated images --->
			<cfset local.feed = variables.$.getBean('feed').loadBy(name=arguments.feedName)>
			<cfset local.iterator = local.feed.getIterator()>
			<cfif local.iterator.hasNext()>
				<div id="#arguments.cssID#">
					<!--- Wrapper for slides --->
					<ul data-orbit>
						<cfset local.iterator.reset()>
						<cfset local.idx = 0>
						<cfloop condition="local.iterator.hasNext()">
							<cfset local.item=iterator.next()>
							<cfif ListFindNoCase('jpg,jpeg,gif,png', ListLast(local.item.getImageURL(), '.'))>
								<li>
									<img src="#local.item.getImageURL(argumentCollection=local.imageArgs)#" alt="#HTMLEditFormat(local.item.getTitle())#">
									<cfif arguments.showCaption>
											<div class="orbit-caption">
												<div class="large-offset-1 large-10">
													<h3><a href="#local.item.getURL()#">#HTMLEditFormat(local.item.getTitle())#</a></h3>
													<cfif YesNoFormat(arguments.showSummary)>
														#local.item.getSummary()#
														<a class="small button" href="#local.item.getURL()#">Read More</a>
													</cfif>
												</div>
											</div>
									</cfif>
								</li>
								<cfset local.idx++>
							</cfif>
						</cfloop>
					</ul>

					<cfif local.idx>
						<!--- Controls --->
						<cfif local.idx gt 1>
							<a class="left carousel-control" href="###arguments.cssID#" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
							<a class="right carousel-control" href="###arguments.cssID#" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
						</cfif>
					<cfelse>
						<div class="alert alert-info alert-block">
							<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
							<h4>Oh snap!</h4>
							Your feed has no items <em>with images</em>.
						</div>
					</cfif>
				</div>
			<cfelse>
				<div class="alert alert-info alert-block">
					<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
					<h4>Heads up!</h4>
					Your feed has no items.
				</div>
			</cfif>
			<!--- // END: Bootstrap Carousel --->
		</cfoutput></cfsavecontent>

		<cfset local.iterator.reset() />
		<cfif local.iterator.hasNext()>
			<!--- This script needs to be added just before the closing 'body' tag --->
			<cfsavecontent variable="local.htmlfoot"><cfoutput>
				<script>
					$(document).foundation({
						orbit: {
						  animation: 'fade',
						  timer_speed: '#arguments.interval#',
						  pause_on_hover: true,
						  resume_on_mouseout: true,
						  animation_speed: 500,
						  stack_on_small: true,
						  navigation_arrows: true,
						  slide_number: '#arguments.bullets#',
						  container_class: '#arguments.cssID#',
						  stack_on_small_class: 'orbit-stack-on-small',
						  next_class: 'orbit-next',
						  prev_class: 'orbit-prev',
						  timer_container_class: 'orbit-timer',
						  timer_paused_class: 'paused',
						  timer_progress_class: 'orbit-progress',
						  slides_container_class: 'orbit-slides-container',
						  bullets_container_class: 'orbit-bullets',
						  bullets_active_class: 'active',
						  slide_number_class: 'orbit-slide-number',
						  caption_class: 'orbit-caption',
						  active_slide_class: 'active',
						  orbit_transition_class: 'orbit-transitioning',
						  bullets: '#arguments.bullets#',
						  timer: true,
						  next_on_click: false,
						  variable_height: false,
						  before_slide_change: function(){},
						  after_slide_change: function(){}
						 }
					});
				</script>
			</cfoutput></cfsavecontent>
			<cfset $.event('htmlfoot', $.event('htmlfoot') & local.htmlfoot) />
		</cfif>

		<cfreturn local.str />
	</cffunction>

</cfcomponent>