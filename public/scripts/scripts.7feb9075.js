"use strict";angular.module("zomockFeApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngMaterial","config","cl.paging"]).config(["$routeProvider","$locationProvider","$httpProvider",function(a,b,c){a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/about",{templateUrl:"views/about.html",controller:"AboutCtrl",controllerAs:"about"}).when("/404",{templateUrl:"404.html",controller:"Four04Controller"}).otherwise({redirectTo:"/"}),c.defaults.useXDomain=!0,delete c.defaults.headers.common["X-Requested-With"]}]),angular.module("zomockFeApp").controller("MainCtrl",["$scope","$routeParams","$location","$http","ENV","CategoryService","CollectionService","CuisineService","EstablishmentService","AuthenticateService","RestaurantListService","$timeout","$interval","MenuImageService","UpdateLocationService","$mdToast","$mdDialog","UserContactService","UserGroupService","GeneratePollService","ShareService",function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u){function v(){null!=a.reveal&&(a.hash=C(),a.hash.start=w*(a.paging.current-1),k.get_list(a.hash).then(function(b){a.rest_list=b}),a.currentPage=a.paging.current)}var w=e.pagination_size;a.requestOn=0,a.location={entity_type:"city",entity_id:5,title:"Pune",latitude:18.520469,longitude:73.85662,city_id:5,city_name:"Pune",country_id:1,country_name:"India"},a.fClient=c.search();var x=j.launch_app(a.fClient.flockEventToken);x.then(function(b){return-1==b?void c.url("/404"):(a.flock_token=b.flock_token,void(a.location=b.location_details))}),a.selectedCategory="",a.selectedCollection="",a.selectedEstablishment="",a.selectedCuisines=[],a.resetFilters=function(){a.selectedCategory="",a.selectedCollection="",a.selectedEstablishment="",a.selectedCuisines=[]},a.querySearch=function(a){return d.get("https://developers.zomato.com/api/v2.1/locations.json",{params:{query:a},headers:{"user-key":e.zomato_key}}).then(function(a){return a.data.location_suggestions})};var y=f.categories();y.then(function(b){a.categories=b.categories});var z=g.collections(a.location.city_id);z.then(function(b){a.collections=b.collections});var A=h.cuisines(a.location.city_id);A.then(function(b){a.cuisines=b.cuisines});var B=i.establishments(a.location.city_id);B.then(function(b){a.establishments=b.establishments});var C=function(){var b={};if(a.selectedCategory&&(b.category=a.selectedCategory.categories.id),a.selectedCollection&&(b.collection_id=a.selectedCollection.collection.collection_id),a.selectedEstablishment&&(b.establishment_type=a.selectedEstablishment.establishment.id),0!==a.selectedCuisines.length){for(var c=[],d=0;d<a.selectedCuisines.length;d++)c.push(a.selectedCuisines[d].cuisine.cuisine_id);b.cuisines=c.join()}return b.lat=a.location.latitude,b.lon=a.location.longitude,b.sort="rating",b.order="desc",b.count=w,b};a.getRestaurants=function(){var b=C();b.start=0,a.reveal=null,k.get_list(b).then(function(b){if(a.rest_list=b,-1==a.rest_list)return void p.show(p.simple().textContent("Something went wrong, Internal error !").position("bottom right").hideDelay(3e3));if(0===b.results_shown)return void p.show(p.simple().textContent("No results found !").position("bottom right").hideDelay(3e3));var c=o.update_location(a.fClient.flockEventToken,a.location);c.then(function(c){return-1==c?void p.show(p.simple().textContent("Something went wrong, Internal error !").position("bottom right").hideDelay(3e3)):(b.results_found=Math.min(100,b.results_found),a.pages=Math.floor(b.results_found/w),b.results_found%w!==0&&(a.pages+=1),a.reveal=1,void(a.paging={total:a.pages,current:1,onPageChanged:v}))})})},a.currentPage=0,a.conf={thumbnails:!1,inline:!1,bubbles:!0,imgBubbles:!0,bgClose:!1},a.images=[],a.methods={},a.openGallery=function(b){var c=n.image_url_array(b,a.fClient.flockEventToken);c.then(function(b){a.images=b})},a.selected_rest={},a.isChecked=function(b){return b.R.res_id in a.selected_rest},a.toggle=function(b){b.R.res_id in a.selected_rest?delete a.selected_rest[b.R.res_id]:a.selected_rest[b.R.res_id]=b},a.openDialog=function(){q.show({parent:angular.element(document.body),scope:this,clickOutsideToClose:!0,preserveScope:!0,templateUrl:"views/share_dialog.html",controllerAs:"share_dialog",controller:D})};var D=function(a){var b=function(a){p.show(p.simple().textContent(a).position("bottom right").hideDelay(3e3))},c=r.contacts(a.flock_token);c.then(function(c){return-1==c?void b("Not able to fetch user contacts !"):void(a.contact_list=c)});var d=s.groups(a.flock_token);d.then(function(c){return-1==c?void b("not able to fetch user groups !"):void(a.group_list=c)}),a.sel_groups=[],a.sel_contacts=[],a.generate_polls=function(){if(0==Object.values(a.selected_rest).length)return void b("select atleast one restaurant !");if(0==a.sel_groups.length)return void b("select atleast one group !");var c=t.generate(a.sel_groups,a.selected_rest,a.fClient.flockEventToken);a.requestOn=1,c.then(function(c){return-1==c?(b("Not able to generate polls !"),void(a.requestOn=0)):(b("Polls on the way !"),void(a.requestOn=0))})},a.share_with_contacts=function(){if(0==Object.values(a.selected_rest).length)return void b("select atleast one restaurant !");if(0==a.sel_contacts.length)return void b("select atleast one contact !");a.requestOn=1;var c=u.share(a.sel_contacts,a.selected_rest,a.fClient.flockEventToken);c.then(function(c){return-1==c?(b("Not able to share !"),void(a.requestOn=0)):(b("Shared !"),void(a.requestOn=0))})},a.resetSelected=function(){a.sel_groups=[],a.sel_contacts=[]}};D.$inject=["$scope"]}]),angular.module("zomockFeApp").controller("AboutCtrl",function(){this.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}),angular.module("config",[]).constant("ENV",{name:"development",apiEndpoint:"https://murmuring-brushlands-77259.herokuapp.com",zomato_api_url:"https://developers.zomato.com/api/v2.1",pagination_size:20,flock_api_url:"https://api.flock.co",zomato_key:'4d2976a888b6bba70b1b28055c6f7af2'}),angular.module("zomockFeApp").service("CategoryService",["$http","ENV",function(a,b){this.categories=function(){return a.get(b.zomato_api_url+"/categories.json",{headers:{"user-key":b.zomato_key}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("CollectionService",["$http","ENV",function(a,b){this.collections=function(c){return a.get(b.zomato_api_url+"/collections.json",{params:{city_id:c},headers:{"user-key":b.zomato_key}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("CuisineService",["$http","ENV",function(a,b){this.cuisines=function(c){return a.get(b.zomato_api_url+"/cuisines.json",{params:{city_id:c},headers:{"user-key":b.zomato_key}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("EstablishmentService",["$http","ENV",function(a,b){this.establishments=function(c){return a.get(b.zomato_api_url+"/establishments.json",{params:{city_id:c},headers:{"user-key":b.zomato_key}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("AuthenticateService",["$http","ENV",function(a,b){this.launch_app=function(c){return a.post(b.apiEndpoint+"/api/v0/launch.json",{},{headers:{"event-token":c}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("RestaurantListService",["$http","ENV",function(a,b){this.get_list=function(c){return a.get(b.zomato_api_url+"/search.json",{params:c,headers:{"user-key":b.zomato_key}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("MenuImageService",["$http","ENV",function(a,b){this.image_url_array=function(c,d){return a.post(b.apiEndpoint+"/api/v0/menu_images",{url:c},{headers:{"event-token":d}}).then(function(a){return a.data},function(a){return[]})}}]),angular.module("zomockFeApp").service("UpdateLocationService",["$http","ENV",function(a,b){this.update_location=function(c,d){return a.put(b.apiEndpoint+"/api/v0/update_location.json",{location_details:d},{headers:{"event-token":c}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("UserContactService",["$http","ENV",function(a,b){this.contacts=function(c){return a.post(b.flock_api_url+"/v1/roster.listContacts",{token:c}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("UserGroupService",["$http","ENV",function(a,b){this.groups=function(c){return a.post(b.flock_api_url+"/v1/groups.list",{token:c}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("GeneratePollService",["$http","ENV",function(a,b){this.generate=function(c,d,e){return a.post(b.apiEndpoint+"/api/v0/polls.json",{groups:c,restaurants:Object.values(d)},{headers:{"event-token":e}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").service("ShareService",["$http","ENV",function(a,b){this.share=function(c,d,e){return a.post(b.apiEndpoint+"/api/v0/share.json",{contacts:c,restaurants:Object.values(d)},{headers:{"event-token":e}}).then(function(a){return a.data},function(a){return-1})}}]),angular.module("zomockFeApp").run(["$templateCache",function(a){a.put("views/404.html","404"),a.put("views/about.html","<p>This is the about view.</p>"),a.put("views/main.html",'<div flex class="padding-left-3 padding-right-3 padding-top-3" layout-sm="column" layout-gt-sm="row"> <div class="occh-full padding-top-3 padding-left-3 padding-right-3 padding-bottom-4" flex layout="column"> <md-autocomplete flex md-selected-item="location" md-search-text="searchText" md-items="item in querySearch(searchText)" md-item-text="location.title" md-delay="300" md-floating-label="Select your location" md-min-length="2" aria-label="auto complete"> <span md-highlight-text="searchText">{{item.title}}</span> </md-autocomplete> <div flex class="padding-bottom-5"> <div layout="row"> <p>Quick filters</p> <span flex></span> <md-button ng-click="resetFilters()" class="md-icon-button md-primary" aria-label="Settings"> <md-icon md-svg-icon="images/reset.03c9bd85.svg"></md-icon> </md-button> </div> </div> <md-input-container flex class="occ-full"> <label>Collection</label> <md-select md-option-empty ng-model="selectedCollection"> <md-option ng-value="collection" ng-repeat="collection in collections">{{ collection.collection.title }}</md-option> </md-select> </md-input-container> <md-input-container flex class="occ-full"> <label>Category</label> <md-select ng-model="selectedCategory"> <md-option ng-value="category" ng-repeat="category in categories">{{ category.categories.name }}</md-option> </md-select> </md-input-container> <md-input-container flex class="occ-full"> <label>Establishment</label> <md-select ng-model="selectedEstablishment"> <md-option ng-value="establishment" ng-repeat="establishment in establishments">{{ establishment.establishment.name }}</md-option> </md-select> </md-input-container> <md-input-container flex class="occ-full"> <label>Cuisines</label> <md-select multiple ng-model="selectedCuisines"> <md-option ng-value="cuisine" ng-repeat="cuisine in cuisines">{{ cuisine.cuisine.cuisine_name }}</md-option> </md-select> </md-input-container> <br> <md-button flex md-no-ink class="md-primary" ng-click="getRestaurants()">Restaurants</md-button> </div> <div flex-xs="100" flex-sm="100" flex-gt-sm="75" class="occh-full padding-left-3 padding-right-3" layout="column" layout-align="center center"> <ng-image-gallery images="images" methods="methods" conf="conf"></ng-image-gallery> <div ng-if="reveal===1"> <div hide-gt-sm class="padding-bottom-4 fix-width" layout="column" layout-align="center center"> <div flex layout-align="center center"> <md-button md-no-ink class="md-primary" ng-click="openDialog()">Recommend restaurants</md-button> </div> <cl-paging flex="100" cl-pages="paging.total" cl-steps="1" cl-page-changed="paging.onPageChanged()" cl-align="center center" cl-current-page="paging.current"></cl-paging> </div> <div class="verticle-scroll" layout="column"> <div class="restaurant margin-top-bottom-20 padding-left-3 padding-bottom-3 padding-right-3 padding-top-3" ng-repeat="restaurant in rest_list.restaurants" layout="column"> <div class="padding-bottom-3" flex layout-xs="column" layout-gt-xs="row"> <div layout="column" flex flex-order-xs="2" class="fix-width-2"> <label class="rest-heading"> <md-checkbox aria-label="restaurants" ng-checked="isChecked(restaurant.restaurant)" ng-click="toggle(restaurant.restaurant)"> </md-checkbox> {{restaurant.restaurant.name}}</label> <label class="padding-top-1 rest-city">{{restaurant.restaurant.location.city}}</label> <label class="rest-address">{{restaurant.restaurant.location.address}}</label> </div> <div flex-order-xs="-1"> <img style="display:block; margin-left: auto;margin-right: auto" class="rest-thumb" ng-src="{{restaurant.restaurant.thumb || \'images/default.7af4b1d4.png\'}}"> </div> </div> <div flex class="padding-bottom-3" layout="column"> <div flex layout="row" layout-wrap> <div class="rest-cuisine" flex="20" layout-wrap> <label>CUISINES </label> </div> <div flex></div> <div class="rest-cuisine" flex="60" layout-wrap>{{restaurant.restaurant.cuisines}}</div> </div> <div flex layout="row"> <div class="rest-cuisine" flex="20" layout-wrap> <label>COST FOR TWO</label> </div> <div flex></div> <div class="rest-cuisine" flex="60" layout-wrap>{{restaurant.restaurant.currency}}{{restaurant.restaurant.average_cost_for_two}}</div> </div> <div flex layout="row"> <div class="rest-cuisine" flex="20" layout-wrap> <label>RATING</label> </div> <div flex></div> <div class="rest-cuisine" flex="60" layout-wrap>{{restaurant.restaurant.user_rating.aggregate_rating}}</div> </div> <!--                         <label ng-click="openGallery(restaurant.restaurant.menu_url)">menu</label>\n --> </div> <md-divider ng-if="!$last"></md-divider> </div> </div> <div hide-xs hide-sm class="padding-bottom-4 fix-width" layout="row" layout-align="center center"> <div flex layout-align="center center"> <md-button md-no-ink class="md-primary" ng-click="openDialog()">Recommend restaurants</md-button> </div> <cl-paging flex="60" cl-pages="paging.total" cl-steps="3" cl-page-changed="paging.onPageChanged()" cl-align="center center" cl-current-page="paging.current"></cl-paging> </div> </div> </div> </div> <!-- <button ng-click="openGallery()">Open Gallery</button>\n<ng-image-gallery images="images" methods="methods" conf="conf" ></ng-image-gallery>\n -->'),a.put("views/share_dialog.html",'<md-dialog flex class="share-dialog"> <md-dialog-content flex layout-xs="column" layout-gt-xs="row"> <div flex-gt-xs="40" flex-xs="100" class="padding-left-5" layout="column"> <div flex></div> <div flex> <div class="pad-b" flex layout="row"> <div flex="80"></div> <md-button ng-click="resetSelected()" class="md-icon-button md-primary" aria-label="clear"> <md-icon md-svg-icon="images/reset.03c9bd85.svg"></md-icon> </md-button> </div> <div flex layout="row" layout-xs="column"> <md-input-container flex="80" class="occ-full min-width-300"> <label>Create poll in groups</label> <md-select multiple ng-model="sel_groups"> <md-option ng-value="group" ng-repeat="group in group_list">{{ group.name }}</md-option> </md-select> </md-input-container> <div layout="column"> <div flex></div> <md-button flex="50" md-no-ink class="md-primary" ng-disabled="requestOn==1" ng-click="generate_polls()">polls</md-button> <div flex></div> </div> </div> <div flex layout-gt-xs="row" layout-xs="column"> <md-input-container flex="80" class="occ-full min-width-300"> <label>Share with contacts</label> <md-select multiple ng-model="sel_contacts"> <md-option ng-value="contact" ng-repeat="contact in contact_list">{{ contact.firstName+" "+contact.lastName }}</md-option> </md-select> </md-input-container> <div layout="column"> <div flex></div> <md-button flex="50" md-no-ink class="md-primary" ng-disabled="requestOn==1" ng-click="share_with_contacts()">share</md-button> <div flex></div> </div> </div> </div> <div flex></div> </div> <div flex></div> <div flex class="white-bk pad-tblr-7 verticle-scroll m-top-2" layout="column"> <div ng-repeat="restaurant in selected_rest"> <img style="display:block; margin-left: auto;margin-right: auto" class="sel-rest-thumb" ng-src="{{restaurant.thumb || \'images/default.7af4b1d4.png\'}}"> </div> </div> </md-dialog-content> </md-dialog>')}]);