function fn() {
  var env = karate.env; // get system property 'karate.env'
karate.log('karate.env system property was:', env);
  var os = karate.os;
  karate.log("Your OS Is",os);

  if (!env) {
    env = 'dev';

  }
  if (env == 'dev') {
  var config = {
    env: env,
    baseUrl: 'https://dev-consumer-api.crayondata.com',
    loginApiUrl:"/api/v3/auth/login",
 citiesApiUrl:"/api/v3/list/cities",
 categoriesApiUrl:"/api/v3/list/category/tags",
 campaignsApiUrl:"/api/v3/user/campaigns",
 choiceApiUrl:"/api/v3/choice/list",
 searchApiUrl:"/api/v3/merchant/search",
 recentApiUrl:"/api/v3/merchant/search/recent",
 typeAheadApiUrl:"/api/v3/merchant/typeAhead",
 docsApiUrl:"/api/v3/privacy/docs",
 faqsApiUrl:"/api/v3/docs/faqs",
 similarApiUrl:"/api/v3/items/similar/",
 interactApiUrl:"/api/v3/user/interact",
 interactedApiUrl:"/api/v3/user/interaction",
 redeemOffersApiUrl:"/api/v3/user/redeemed/offers",
 feedbackApiUrl:"/api/v3/user/feedback",
 itemsApiUrl:"/api/v3/items",
 authorization:"auth",
 useraccesstoken:"0005e4bf-189d-49d0-8887-ab7cb9fde111",
 loginEnabled:"false"
  }
  }
 else if (env == 'ADIB') {
var config = {
   baseUrl: 'https://adib-stage-ca.testmaya.com',
    loginApiUrl:"/api/v3/auth/login",
 citiesApiUrl:"/api/v3/list/cities",
 categoriesApiUrl:"/api/v3/list/category/tags",
 campaignsApiUrl:"/api/v3/user/campaigns",
 choiceApiUrl:"/api/v3/choice/list",
 searchApiUrl:"/api/v3/merchant/search",
 recentApiUrl:"/api/v3/merchant/search/recent",
 typeAheadApiUrl:"/api/v3/merchant/typeAhead",
 docsApiUrl:"/api/v3/privacy/docs",
 faqsApiUrl:"/api/v3/docs/faqs",
 similarApiUrl:"/api/v3/items/similar/",
 interactApiUrl:"/api/v3/user/interact",
 interactedApiUrl:"/api/v3/user/interaction",
 redeemOffersApiUrl:"/api/v3/user/redeemed/offers",
 feedbackApiUrl:"/api/v3/user/feedback",
 itemsApiUrl:"/api/v3/items",
 authorization:"auth",
 useraccesstoken:"d44664c1-7184-44c1-b010-8cb3bbc34c7b",
 loginEnabled:"false"
  }
  }
  else if (env == 'HDFC') {
    var config = {
   baseUrl: 'https://hdfc-stage-ea.testmaya.com',
    loginApiUrl:"/api/v3/auth/login",
 citiesApiUrl:"/api/v3/list/cities",
 categoriesApiUrl:"/api/v3/list/category/tags",
 campaignsApiUrl:"/api/v3/user/campaigns",
 choiceApiUrl:"/api/v3/choice/list",
 searchApiUrl:"/api/v3/merchant/search",
 recentApiUrl:"/api/v3/merchant/search/recent",
 typeAheadApiUrl:"/api/v3/merchant/typeAhead",
 docsApiUrl:"/api/v3/privacy/docs",
 faqsApiUrl:"/api/v3/docs/faqs",
 similarApiUrl:"/api/v3/items/similar/",
 interactApiUrl:"/api/v3/user/interact",
 interactedApiUrl:"/api/v3/user/interaction",
 redeemOffersApiUrl:"/api/v3/user/redeemed/offers",
 feedbackApiUrl:"/api/v3/user/feedback",
 itemsApiUrl:"/api/v3/items",
 authorization:"auth",
 useraccesstoken:"0005e4bf-189d-49d0-8887-ab7cb9fde111",
 loginEnabled:"false"
  }
  }
else if (env == 'ConsumerSchema') {
    var config = {
   baseUrl: 'https://test-consumer-api.testmaya.com',
   loginApiUrl:"/api/v3/auth/login",
 citiesApiUrl:"/api/v3/list/cities",
 categoriesApiUrl:"/api/v3/list/category/tags",
 campaignsApiUrl:"/api/v3/user/campaigns",
 choiceApiUrl:"/api/v3/choice/list",
 searchApiUrl:"/api/v3/merchant/search",
 recentApiUrl:"/api/v3/merchant/search/recent",
 typeAheadApiUrl:"/api/v3/merchant/typeAhead",
 docsApiUrl:"/api/v3/privacy/docs",
 faqsApiUrl:"/api/v3/docs/faqs",
 similarApiUrl:"/api/v3/items/similar/",
 interactApiUrl:"/api/v3/user/interact",
 interactedApiUrl:"/api/v3/user/interaction",
 redeemOffersApiUrl:"/api/v3/user/redeemed/offers",
 feedbackApiUrl:"/api/v3/user/feedback",
 itemsApiUrl:"/api/v3/items",
 authorization:"auth",
 useraccesstoken:"0005e4bf-189d-49d0-8887-ab7cb9fde111",
 loginEnabled:"false"
  }
  }
  return config;
}