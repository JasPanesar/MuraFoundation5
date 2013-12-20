<!---
	This file is part of Mura CMS.

	Mura CMS is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, Version 2 of the License.

	Mura CMS is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

	Linking Mura CMS statically or dynamically with other modules constitutes 
	the preparation of a derivative work based on Mura CMS. Thus, the terms 
	and conditions of the GNU General Public License version 2 ("GPL") cover 
	the entire combined work.

	However, as a special exception, the copyright holders of Mura CMS grant 
	you permission to combine Mura CMS with programs or libraries that are 
	released under the GNU Lesser General Public License version 2.1.

	In addition, as a special exception, the copyright holders of Mura CMS 
	grant you permission to combine Mura CMS with independent software modules 
	(plugins, themes and bundles), and to distribute these plugins, themes and 
	bundles without Mura CMS under the license of your choice, provided that 
	you follow these specific guidelines: 

	Your custom code 

	• Must not alter any default objects in the Mura CMS database and
	• May not alter the default display of the Mura CMS logo within Mura CMS and
	• Must not alter any files in the following directories:

		/admin/
		/tasks/
		/config/
		/requirements/mura/
		/Application.cfc
		/index.cfm
		/MuraProxy.cfc

	You may copy and distribute Mura CMS with a plug-in, theme or bundle that 
	meets the above guidelines as a combined work under the terms of GPL for 
	Mura CMS, provided that you include the source code of that other code when 
	and as the GNU GPL requires distribution of source code.

	For clarity, if you create a modified version of Mura CMS, you are not 
	obligated to grant this special exception for your modified version; it is 
	your choice whether to do so, or to make such modified version available 
	under the GNU General Public License version 2 without this exception.  You 
	may, if you choose, apply this exception to your own modified versions of 
	Mura CMS.
--->
<cfcomponent extends="mura.cfobject" output="false">

	<!---
			This is the THEME eventHandler.cfc 

			* Add theme-specific eventHandlers here
			* This file is much like a controller in a MVC application 
			* Reload the application when additions/changes are made to THIS file!
	--->

	<cffunction name="onSiteRequestStart" access="public" output="false" returntype="any">
		<cfargument name="$" hint="mura scope" />
		<cfscript>
			// http://dominicwatson.github.io/cfstatic/full-guide.html (See Configuration section)
			// if in production, set checkForUpdates=false
			arguments.$.static(
				outputDirectory = 'compiled'
				, checkForUpdates = !arguments.$.siteConfig('cache')
				, lessGlobals = ExpandPath($.siteConfig('themeAssetPath') & '/css/less-globals/globals.less')
			);
		</cfscript>
	</cffunction>

	<cffunction name="onSiteCKEditorConfigRender" access="public" output="false" returntype="any">
		<cfargument name="$" hint="mura scope" />
		<cfset var str = '' />
		<cfsavecontent variable="str"><cfoutput>
			// heading vars
			config.format_h1 = { element : 'h2' };
			config.format_h2 = { element : 'h3' };
			config.format_h3 = { element : 'h4' };
			config.format_h4 = { element : 'h5' };
			config.format_h5 = { element : 'h6' };
		</cfoutput></cfsavecontent>
		<cfreturn str />
	</cffunction>

	<cffunction name="onRenderStart" access="public" output="false" returntype="any">
		<cfargument name="$" hint="mura scope" />
		<cfscript>
			var renderer = arguments.$.getContentRenderer();

			// general vars
			renderer.jsLib = 'jquery';
			renderer.jsLibLoaded = true;
			renderer.generalWrapperClass = 'panel';
			
			// headings
			renderer.headline = 'h1';
			renderer.subHead1 = 'h2';
			renderer.subHead2 = 'h3';
			renderer.subHead3 = 'h4';
			renderer.subHead4 = 'h5';
			
			//images
			renderer.bodyMetaImageClass="th";

			// nav and list item vars
			renderer.navWrapperClass = 'panel';
			renderer.liHasKidsClass = '';
			renderer.liHasKidsCustomString = '';
			renderer.liCurrentClass = 'active';
			renderer.liCurrentCustomString = '';
			renderer.aHasKidsClass = '';
			renderer.aHasKidsCustomString = '';
			renderer.aCurrentClass = 'active';
			renderer.aCurrentCustomString = '';
			renderer.ulTopClass = 'side-nav';
			renderer.ulNestedClass = '';
			renderer.ulNestedCustomString = '';
			renderer.liNestedClass = '';

			// pagination vars
			renderer.ulPaginationClass = 'pagination';
			renderer.ulPaginationWrapperClass = 'pagination';

			// form vars
			renderer.formWrapperClass = 'panel';
			
			// Display Objects
			// Use these variables to pass-in specific classes without having to create custom versions
			
			// calendar/dsp_showMonth.cfm
			 renderer.calendarWrapperClass="mura-Calendar";
			 renderer.calendarTableClass="";
			 //renderer.calendarTableHeaderClass="";
			
			// calendar/dspList.cfm
			 renderer.calendarListWrapperClass="mura-Calendar";
			
			// comments/index.cfm
			 renderer.commentsWrapperClass="mura-Comments";
			 renderer.commentFormWrapperClass="panel";
			 renderer.commentFormClass="";
			 renderer.commentNewClass="small button";
			 renderer.commentFieldWrapperClass="row";
			 renderer.commentFieldLabelClass="large-3 columns";
			 renderer.commentInputWrapperClass="large-9 columns";
			 renderer.commentInputClass="";
			 renderer.commentClass="";
			 renderer.commentPrefsInputWrapperClass="large-9 columns";
			 renderer.commentSubmitButtonWrapperClass="large-12 columns";
			 renderer.commentSubmitButtonClass="small button right";
			 renderer.commentRequiredWrapperClass="large-9 columns";
			 //renderer.commentUserEmailClass="";
			 //renderer.commentDeleteButtonClass="";
			
			// comments/dsp_comment.cfm
			 renderer.emailLinkClass="small button";
			 renderer.commentsLinkClass="small button";
			 renderer.approveCommentLinkClass="small button";
			 renderer.deleteCommentLinkClass="small button";
			
			// datacollection/dsp_response.cfm
			 renderer.datacollectionErrorPClass="alert-box warning radius";
			 renderer.datacollectionErrorDivClass="alert-box warning radius";
			 renderer.datacollectionSuccessPClass="alert-box success radius";
			
			// dataresponses/dsp_detail.cfm
			 renderer.dataResponseListClass="";
			
			// dataresponses/dsp_list.cfm
			 renderer.dataResponseTableClass="";
			 renderer.dataResponsePaginationClass="pagination";
			
			// draggablefeeds/index.cfm
			 renderer.draggableBoxWrapperClass="row";
			 renderer.draggableBoxHeaderClass="large-12 columns";
			 renderer.draggableBoxRSSWrapperClass="mura-RSSFeeds";
			 renderer.draggableBoxHeaderButtonClass="small button";
			 //renderer.draggableBoxRSSeditFormClass="";
			 renderer.draggableBoxAddFeedWrapperClass="panel clearfix";
			 renderer.draggableBoxNewFeedFormClass="";
			 renderer.draggableBoxSelectFeedWrapperClass="large-6 columns";
			 renderer.draggableBoxSelectFeedRowClass="row";
			 renderer.draggableBoxSelectFeedMenuClass="";
			 renderer.draggableBoxSelectFeedMenuDivClass="large-10 columns";
			 renderer.draggableFeedMenuSelectFieldClass="";
			 renderer.addFeedButtonWrapperDivClass="";
			 renderer.addFeedButtonWrapperDivInnerClass="large-2columns";
			 renderer.addFeedButtonClass="small button";
			
			// dsp_categories_nest.cfm
			 renderer.categoriesNestClass="";
			
			// dsp_content_list.cfm
			renderer.contentListImageStyles=true;
			renderer.contentListPropertyMap={
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
			 renderer.contentListWrapperDivClass="";
			 renderer.contentListItemImageLinkClass="clearfix";
			
			// dsp_folder.cfm
			renderer.folderWrapperClass="mura-Index";
			
			// dsp_edit_profile.cfm
			 renderer.editProfileWrapperClass="mura-EditProfile";
			 renderer.editProfileFormClass="";
			 renderer.editProfileFormGroupWrapperClass="";
			 renderer.editProfileFieldLabelClass="large-3 columns";
			 renderer.editProfileFormFieldsWrapperClass="large-9 columns";
			 renderer.editProfileFormFieldsClass="";
			 renderer.editProfileExtAttributeDownloadClass="large-3 columns";
			 renderer.editProfileHelpBlockClass="";
			 renderer.editProfileExtAttributeFileWrapperClass="large-6 columns";
			 renderer.editProfileExtAttributeDownloadClass="large-3 columns";
			 renderer.editProfileExtAttributeDownloadButtonClass="small button";
			 renderer.editProfileSubmitButtonWrapperClass=" large-9 columns";
			 renderer.editProfileSubmitButtonClass="btn btn-primary";
			 renderer.editProfileSuccessMessageClass="alert-box success radius";
			
			// dsp_email_.cfm
			 renderer.emailSelectClass="";
			
			// dsp_event_reminder_form.cfm
			 renderer.eventReminderFormWrapperClass="mura-EventReminderForm";
			 renderer.eventReminderFormClass="panel";
			 renderer.eventReminderFieldWrapperClass="";
			 renderer.eventReminderFormLabelsClass="";
			 renderer.eventReminderSubmitClass="small button";
			
			// dsp_features.cfm
			 renderer.featuresWrapperClass="mura-SyndLocal mura-Index clearfix";
			
			// dsp_feed.cfm
			 renderer.localIndexWrapperClass="mura-SyndLocal mura-Feed mura-Index clearfix";
			 renderer.remoteFeedWrapperClass="mura-SyndRemote mura-Index mura-Feed clearfix";
			
			// dsp_login.cfm
			 renderer.loginWrapperClass="";
			 renderer.loginWrapperInnerClass="";
			 renderer.loginErrorMessageClass="alert-box warning radius";
			 renderer.loginFormClass="";
			 renderer.forgotPasswordFormClass="form-sendlogin";
			 renderer.loginFormGroupWrapperClass="row";
			 renderer.loginFormFieldLabelClass="";
			 renderer.loginFormFieldWrapperClass="";
			 renderer.loginFormFieldClass="";
			 renderer.loginFormPrefsClass="";
			 renderer.loginFormClass="";
			 renderer.loginFormSubmitWrapperClass="";
			 renderer.loginFormSubmitClass="small button";
			 renderer.loginFormAlertClass="alert-box success radius";
			 renderer.loginFormErrorClass="alert-box warning radius";
			 renderer.notRegisteredLinkClass="small button";
			
			// dsp_mailing_list_master.cfm
			 renderer.mailingListWrapperClass="panel";
			 renderer.mailingListSuccessClass="alert-box success radius";
			 renderer.mailingListErrorClass="alert alert-error";
			 renderer.mailingListFormClass="";
			 renderer.mailingListFormGroupWrapperClass="row";
			 renderer.mailingListFormLabelClass="large-3 columns";
			 renderer.mailingListFormFieldWrapperClass="large-9 columns";
			 renderer.mailingListFormInputClass="text ";
			 renderer.mailingListWrapperClass="large-10 columns";
			 renderer.mailingListClass="";
			 renderer.mailingListSubmitWrapperClass="";
			 renderer.mailingListSubmitClass="submit small button";
			
			// dsp_nextN.cfm
			 renderer.nextNWrapperClass="container";
			 renderer.nextNInnerClass="row";
			
			// dsp_search_form.cfm
			 renderer.searchFormClass="navbar-form";
			 renderer.searchFormInputWrapperClass="";
			 renderer.searchFormInputClass="";
			 renderer.searchFormSubmitWrapperClass="-btn";
			 renderer.searchFormSubmitClass="small button";
			
			// dsp_search_results.cfm
			 renderer.searchResultWrapperClass="mura-SearchResults container";
			 renderer.searchResultInnerClass="";
			 renderer.searchResultsRowClass="";
			 renderer.searchResultsMoreResultsRowClass="";
			 renderer.searchReultsListClass="mura-Index";
			 renderer.searchReultsPagerClass="pager";
			 renderer.searchAgainRowClass="";
			 renderer.searchAgainInnerClass="medium-12 columns";
			 renderer.searchAgainFormClass="";
			 renderer.searchAgainInputWrapperClass="";
			 renderer.searchAgainFormInputClass="";
			 renderer.searchAgainButtonWrapperClass="";
			 renderer.searchAgainSubmitClass="small button";
			
			// dsp_user_tools.cfm
			 renderer.userToolsLoginWrapperClass="panel clearfix";
			 renderer.userToolsLoginFormClass="";
			 renderer.userToolsFormGroupWrapperClass="row";
			 renderer.userToolsLoginFormLabelClass="large-2 columns";
			 renderer.userToolsLoginFormInputWrapperClass="large-10 columns";
			 renderer.userToolsLoginFormInputClass="";
			 renderer.userToolsLoginFormFieldInnerClass="large-10 columns";
			 renderer.userToolsLoginFormClass="";
			 renderer.userToolsLoginFormSubmitClass="small button";
			 renderer.userToolsNotRegisteredLinkClass="small button";
			 renderer.userToolsWrapperClass="clearfix";
			 renderer.userToolsEditProfileLinkClass="small button";
			 renderer.userToolsLogoutLinkClass="small button";
			
			// formbuilder/dsp_form.cfm
			 renderer.formBuilderFieldWrapperClass="";
			 renderer.formBuilderButtonWrapperClass="";
			 renderer.formBuilderSubmitClass="small button";
			
			// formbuilder/fields/dsp_.cfm
			// formbuilder/fields/dsp_.cfm 
			// formbuilder/fields/dsp_file.cfm
			// formbuilder/fields/dsp_radio.cfm
			// formbuilder/fields/dsp_textfield.cfm
			
			 renderer.formBuilderFormFieldsClass="";
			
			// formbuilder/fields/field_.cfm
			 renderer.formBuilderTabHeaderClass="";
			 renderer.formBuilderDisabledInputClass="disabled";
			 renderer.formBuilderClass="";
			
			// gallery/index.cfm
			 renderer.galleryWrapperClass="mura-Gallery";
			 renderer.galleryULClass="clearfix";
			 renderer.galleryThumbnailClass="th";
			
			// nav/calendarNav/index.cfm
			renderer.navCalendarWrapperClass="mura-Calendar mura-CalendarNav";
			
			// nav/calendarNav/navTools.cfc
			 renderer.navCalendarTableClass="";
			
			// nav/dsp_sequential.cfm
			 renderer.navSequentialWrapperClass="container";
			 renderer.navSequentialInnerClass="row";
			
			// nav/dsp_tag_cloud.cfm
			 renderer.tagCloudWrapperClass="mura-TagCloud";
			
			// navArchive
			 renderer.navArchiveWrapperClass="panel";
			 //renderer.navArchiveListClass="";
			
			
			// rater/index.cfm
			 renderer.raterObjectWrapperClass="row mura-Ratings clearfix";
			 renderer.raterWrapperClass="large-12 columns";
			 renderer.avgRatingWrapperClass="large-12 columns";
			
			// sendToLink/SendLink.cfm
			 renderer.sendToFriendSuccessClass="alert-box success radius";
			 renderer.sendToFriendErrorClass="alert-box warning radius";
			
			// Generic form vars
				renderer.formWrapperClass = "";

			// for code syntax highlighting
			try {
				arguments.$.loadPrettify();
			} catch(any e) {
				// Mura CMS version is probably older than 6.1
			}
		</cfscript>
	</cffunction>

</cfcomponent>