"use strict";

 angular.module('config', [])

.constant('ENV', {name:'production',apiEndpoint:'https://murmuring-brushlands-77259.herokuapp.com',zomato_api_url:'https://developers.zomato.com/api/v2.1',pagination_size:20,flock_api_url:'https://api.flock.co',zomato_key:ENV['ZOMATO_KEY']})

;
