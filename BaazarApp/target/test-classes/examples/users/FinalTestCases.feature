Feature: To validate the Test of Consumer App in DEV Environment

  #Author Name: Ramakrishna
  #Creation Date: 29/04/2022
  Background: baseUrl
    * def req_headers = {Authorization :'auth', Content-Type: 'application/json',User-Access-Token: '0005e4bf-189d-49d0-8887-ab7cb9fde111'}
    * def lang = {lang:'en'}
    * def limittype = {limit:10}
    * def campaigntype = {campaignType:'EVENT'}
    * def searchword = {searchWord:'retail'}
    * def docsurl = {type :'privacy_policy'}
    * def count = 12
    * def itemid = '07fa5146-8150-42a8-a89a-227304309fe2'

  @DEV @regression @sanity @SNO4
  Scenario Outline: To validate the response for cities api
    Given headers req_headers
    And url baseUrl
    And path  citiesApiUrl
    And params lang
    And request {latitude:<longitude>, longitude:<longitude>}
    When method post
    Then status <responseCode>
    Then print response

    Examples: 
      | longitude | longitude | responseCode |
      | 25.276987 | 55.287155 |          200 |

  @DEV @regression @sanity @SNO5
  Scenario Outline: To validate the response for categories api
    Given headers req_headers
    And url baseUrl
    And path categoriesApiUrl
    And params lang
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SNO6
  Scenario Outline: To validate the response for campaigns api
    Given headers req_headers
    And url baseUrl
    And path campaignsApiUrl
    And params campaigntype
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SNO7
  Scenario Outline: To validate the response for all choices list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | category | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | all      |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SNO8
  Scenario Outline: To validate the response for category choices list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | category                | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | apparel and accessories |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SNO9
  Scenario Outline: To validate the response for category choices list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | category             | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | miscellaneous stores |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SN10
  Scenario Outline: To validate the response of search API
    Given headers req_headers
    And url baseUrl
    And path  searchApiUrl
    And request {city:<city>, searchWord:<searchWord>, lang:<lang>,searchTextLang:<searchTextLang>,servedAt:<servedAt> }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | city        | lang | searchTextLang | searchWord | responseCode | servedAt                      |
      | Abano Terme | en   | en             | retail     |          200 | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SN11
  Scenario Outline: To validate the response of recent search API
    Given headers req_headers
    And url baseUrl
    And path  recentApiUrl
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN12
  Scenario Outline: To validate the response of Typeahead API
    Given headers req_headers
    And url baseUrl
    And path  typeAheadApiUrl
    And params searchword
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN13
  Scenario Outline: To validate the response of docs API
    Given headers req_headers
    And url baseUrl
    And path  docsApiUrl
    And params docsurl
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN14
  Scenario Outline: To validate the response of faqs API
    Given headers req_headers
    And url baseUrl
    And path  faqsApiUrl
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN15
  Scenario Outline: To validate the response interacted merchant||Offers
    Given headers req_headers
    And url baseUrl
    And path  campaignsApiUrl
    And params campaigntype
    And params lang
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN16
  Scenario Outline: To validate the response of redeemed offers
    Given headers req_headers
    And url baseUrl
    And path  redeemOffersApiUrl
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN17
  Scenario Outline: To validate the response for Feedback api
    Given headers req_headers
    And url baseUrl
    And path  feedbackApiUrl
    And request {rating:<rating>, reviewAndSuggestion:<reviewAndSuggestion>, topic:<topic> }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | rating | reviewAndSuggestion | topic           |
      |          200 |      2 | test                | Report the Bugs |

  @DEV @regression @sanity  @SN21
  Scenario Outline: To validate the Schema for all list schema
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {choiceCount:<choiceCount>, category:<category>, choiceListType:<choiceListType>, city:<city>, latitude:<latitude>, longitude:<longitude>, lang:<lang> }
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/choiceList.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | choiceCount | category      | choiceListType | city  | latitude  | longitude | lang | responseCode |
      |           1 | retail stores | TRENDING       | dubai | 25.276987 | 55.296249 | en   |          200 |

  @DEV @regression @sanity @SN20
  Scenario Outline: To validate the response of city API schema
    Given headers req_headers
    And url baseUrl
    And path  citiesApiUrl
    And request {latitude:<longitude>, longitude:<longitude>}
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/cities.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | longitude | longitude | responseCode |
      | 25.276987 | 55.287155 |          200 |
      
      
  @DEV @regression @sanity  @SN21
  Scenario Outline: To validate the Schema for all list schema
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {choiceCount:<choiceCount>, category:<category>, choiceListType:<choiceListType>, city:<city>, latitude:<latitude>, longitude:<longitude>, lang:<lang> }
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/choiceList.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | choiceCount | category      | choiceListType | city  | latitude  | longitude | lang | responseCode |
      |           1 | retail stores | TRENDING       | dubai | 25.276987 | 55.296249 | en   |          200 |

  @DEV @regression @sanity @SN22
  Scenario Outline: To validate the response for user campaigns schema
    Given headers req_headers
    And url baseUrl
    And path  campaignsApiUrl
    And params {campaignType:<campaignType>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/campaigns.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode | campaignType |
      |          200 | EVENT        |

  @DEV @regression @sanity @SN23
  Scenario Outline: To validate the response of merchat search API schema
    Given headers req_headers
    And url baseUrl
    And path  searchApiUrl
    And request {city:<city>, category:<category>, distance:<distance>, isOnline:<isOnline>, latitude:<latitude>, longitude:<longitude>, searchWord:<searchWord>, searchTextLang:<searchTextLang>, sortBy:<sortBy>, lang:<lang> }
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/merchantSearch.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | city  | category | distance | isOnline | latitude  | longitude | searchWord | searchTextLang | sortBy   | lang | responseCode |
      | dubai | dining   |       15 | false    | 25.276987 | 55.296249 | Marbles    | en             | distance | en   |          200 |

  @DEV @regression @sanity @SN24
  Scenario Outline: To validate the response of recent search API schema
    Given headers req_headers
    And url baseUrl
    And path  recentApiUrl
    When method get
    Then status <responseCode>
    Then print response
    Then match response == '#object'
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/recentsearch.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | limit |  | lang |  | file   | responseCode |
      |     6 |  | en   |  | recent |          200 |

  @DEV @regression @sanity @SN25
  Scenario Outline: To validate the response of Typeahead API schema
    Given headers req_headers
    And url baseUrl
    And path  typeAheadApiUrl
    And params {lang:<lang>, searchTextLang:<searchTextLang>, searchWord:<searchWord>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/typeAhead.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * print jsonData
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode | lang | searchTextLang | searchWord      |
      |          200 | en   | en             | home appliances |

  @DEV @regression @sanity @SN26
  Scenario Outline: To validate the response of privacy docs API schema
    Given headers req_headers
    And url baseUrl
    And path  docsApiUrl
    And params {type :<type>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/privacyDocs.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode | type           |
      |          200 | privacy_policy |

  @DEV @regression @sanity @SN27
  Scenario Outline: To validate the response of Faq API schema
    Given headers req_headers
    And url baseUrl
    And path  faqsApiUrl
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/faqs.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | lang | responseCode |
      | en   |          200 |

  @DEV @regression @sanity @SN28
  Scenario Outline: To validate the response of similar merchant API schema
    Given headers req_headers
    And url baseUrl
    And path  similarApiUrl
    And request {count:<count>, city:<city>, lang:<lang>, itemId:<itemId>, servedAt:<servedAt>}
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/similarItems.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * print jsonData
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode | location | count | itemId                               | servedAt                 | city  | lang |
      |          200 | dubai    |    10 | 1287914d-244a-3a4f-808b-b9f638d5aba4 | 2022-05-13T04:15:01.488Z | dubai | en   |

  @DEV @regression @sanity @SN29
  Scenario Outline: To validate the response of redeemed offers schema
    Given headers req_headers
    And url baseUrl
    And path  redeemOffersApiUrl
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/redeemedOffers.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode |
      |          200 |

  @DEV @regression @sanity @SN30
  Scenario Outline: To validate the merchants details api schema
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<itemId>'
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/itemRecommended.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | itemId                               | responseCode |
      | 634ea784-f4a6-4d02-8cda-0374e53823d6 |          200 |

  @DEV @regression @sanity @SN31
  Scenario Outline: To validate the response interacted merchant|Offers schema
    Given headers req_headers
    And url baseUrl
    And path  interactedApiUrl
    And params {interactionType:<interactionType>, itemType:<itemType>, servedAt:<servedAt>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/interaction.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | interactionType | itemType | responseCode | servedAt                      |
      | WISHLIST        | MERCHANT |          200 | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SN32
  Scenario Outline: To validate the response for cities api
    Given headers req_headers
    And url baseUrl
    And path  citiesApiUrl
    And params lang
    And request {latitude:<longitude>, longitude:<longitude>}
    When method post
    Then status <responseCode>
    Then print response
    * def listofcities = karate.jsonPath(response,"$..value")
    * print listofcities
    * assert listofcities.length >= <number>
    * match response.geocode ! == null

    Examples: 
      | lang | number | responseCode |
      | en   |     10 |          200 |

  @DEV @regression @sanity @SN33
  Scenario Outline: To validate the response for categories api
    Given headers req_headers
    And url baseUrl
    And path categoriesApiUrl
    And request {category:<category>}
    When method get
    Then status <responseCode>
    Then print response
    * def actualLabellist = karate.jsonPath(response,"$..label")
    * def expectedLabelList = <labels>
    * match actualLabellist contains expectedLabelList

    Examples: 
      | responseCode | category | labels                                                                                           |
      |          200 | Dining   | [restaurant,cafe,food-truck,food-court,bars-and-pubs,food-stall,sports-bar,club,afghani-cuisine] |

  @DEV @regression @sanity @SN35
  Scenario Outline: To validate the response for category choices list and  Validate the merchants are not repeated for more than 2 times
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response
    * def responseobj = response
    * def listofMerchantIds = karate.jsonPath(response,"$..item.id")
    * karate.distinct(listofMerchantIds)

    Examples: 
      | responseCode | category                | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | apparel and accessories |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @sanity @SN36
  Scenario Outline: To validate the response for category choices list and  Validate all the list have more than 1 choices
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response
    * def responseobj = response
    * def choices = karate.jsonPath(response,"$..choices.*")
    * def choiceSize = choices.length
    * print 'choiceSize',choiceSize
    * def listnames = karate.jsonPath(response,"$..choices..listName")
    * print 'listnames',listnames
    * def list = listnames
    # * def fun = function(array){ for (var i = 0; i < choiceSize; i++) karate.log(array[i]) }
    * def fun = function(array){ for (var i = 0; i < choiceSize; i++) list = karate.jsonPath(response,"$.choices.["+i+"].items.*") karate.log(listnames.get(i)+" : "+list.size()) };
    * call fun choices

    Examples: 
      | responseCode | category | choiceCount | lang | city  | includeCampaigns | servedAt                      | times |
      |          200 | all      |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |     1 |
      
      
  @DEV @regression @sanity @SN37
  Scenario Outline: To validate the response for broken links in all choice list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response
    
    Examples: 
      | lang |  | category |  | city  |  | latitude  |  | longitude |  | includeCampaigns |
      | en   |  | all      |  | dubai |  | 25.276987 |  | 55.287155 |  | true             |

  @DEV @regression @sanity @SN38
  Scenario Outline: To validate the response for merchants Order in all choice list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response
    * def choices = karate.jsonPath(response,"$..choices.*")
    * def choiceSize = choices.length
    * print 'choiceSize',choiceSize
    * def listoftastematchscore = karate.jsonPath(response,"$..tasteMatchScore")
    * def sortedList = karate.sort(listoftastematchscore)
    * def reverselist = listoftastematchscore.reverse();
     * karate.match(reverselist, sortedList)

    Examples: 
      | responseCode | category | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | all      |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |

  @DEV @regression @SN44
  Scenario Outline: To validate the response for Trending merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      # | TRENDING       |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [afa7a75a-5acc-42f6-af04-0cb4bf1b446a,e900a403-b964-46db-b762-759743eff3e6,afa7a75a-5acc-42f6-af04-0cb4bf1b446a,8affa868-b20c-4e20-ba77-84b0679e683b,4248f84c-bbca-425c-b193-211ca80dff51] |
      | TRENDING       |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN45
  Scenario Outline: To validate the response for Popularity merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | POPULARITY     |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN46
  Scenario Outline: To validate the response for repeat merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | REPEAT         |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN47
  Scenario Outline: To validate the response for tagbased merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | TAG_BASED      |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN48
  Scenario Outline: To validate the response for discovery merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | DISCOVERY      |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN49
  Scenario Outline: To validate the response for nextbest merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | NEXT_BEST      |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN50
  Scenario Outline: To validate the response for resume merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | RESUME         |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN51
  Scenario Outline: To validate the response for crosscategory merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | CROSS_CATEGORY |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN52
  Scenario Outline: To validate the response for category based  merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | CATEGORY_BASED |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN53
  Scenario Outline: To validate the response for age merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | AGE            |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN54
  Scenario Outline: To validate the response for city merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | CITY           |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN55
  Scenario Outline: To validate the response for cardlimit merchant list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {city:<city>, latitude:<latitude>, choiceCount:<choiceCount>,lang:<lang>,longitude:<longitude>,choiceListType:<choiceListType>, category:<category> }
    When method Post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.id")
    Then print list1
    Then def list2 = <merchantIds>
    Then print list2
    Then match list1 contains list2

    Examples: 
      | choiceListType | responseCode | city  | lang | latitude | choiceCount | longitude | category      | merchantIds                            |
      | CARD_LIMIT     |          200 | dubai | en   |    25.04 |           1 |     55.19 | retail stores | [4248f84c-bbca-425c-b193-211ca80dff51] |

  @DEV @regression @SN56
  Scenario Outline: To validate the response of search API
    Given headers req_headers
    And url baseUrl
    And path searchApiUrl
    And request {city:<city>, category:<category>, distance:<distance>, isOnline:<isOnline>, latitude:<latitude>, longitude:<longitude>, searchWord:<searchWord>, searchTextLang:<searchTextLang>, lang:<lang>, sortBy:<sortBy>}
    When method post
    Then status <responseCode>
    Then print response
    Then def list1 = karate.jsonPath(response,"$..item.name")
    Then def list2 = karate.jsonPath(response,"$..item.category")
    Then print  'itemnames', list1
    Then print 'categorynames', list2
    Then match each list1 contains '<searchWord>'
    Then match each list2 contains '<category>'

    Examples: 
      | city  | latitude  | longitude | lang | searchTextLang | searchWord | category | distance | isOnline | sortBy   | responseCode |
      | dubai | 25.276987 | 55.296249 | en   | en             | Ku         | dining   |       15 | false    | distance |          200 |

  @DEV @regression @SN57
  Scenario Outline: To validate the response of recent search API
    Given headers req_headers
    And url baseUrl
    And path  recentApiUrl
    When method get
    Then status <responseCode>
    Then print response
    * def listofSearchText = karate.jsonPath(response,"$..searchText")
    * assert listofSearchText.length <= <limit>
    * def res = []
    * def fun = function(x){ karate.appendTo(res, x) }
    * def list = listofSearchText
    * karate.forEach(list, fun)
    * assert res.length == listofSearchText.length

    Examples: 
      | lang | limit | responseCode |
      | en   |     7 |          200 |

  @DEV @regression @SN58
  Scenario Outline: To validate the response of docs API
    Given headers req_headers
    And url baseUrl
    And path docsApiUrl
    And params {lang:<lang>, type:<type>}
    When method get
    Then status <responseCode>
    Then print response
    * assert responseStatus == 200
    * def content = karate.jsonPath(response,"$..content")
    * print 'content...',content
    * assert content.length > 0

    Examples: 
      | lang | responseCode | type             |
      | en   |          200 | terms_of_service |

  @DEV @regression @SN59
  Scenario Outline: To validate the response of docs API
    Given headers req_headers
    And url baseUrl
    And path docsApiUrl
    And params {lang:<lang>, type:<type>}
    When method get
    Then status <responseCode>
    Then print response
    * assert responseStatus == 200
    * def content = karate.jsonPath(response,"$..content")
    * print 'content...',content
    * assert content.length > 0

    Examples: 
      | lang | responseCode | type           |
      | en   |          200 | privacy_policy |

  @DEV @regression @SN60
  Scenario Outline: To validate the response of faqs API
    Given headers req_headers
    And url baseUrl
    And path faqsApiUrl
    And params {lang:<lang>}
    When method get
    Then status <responseCode>
    Then print response
    * assert responseStatus == 200
    * def content = karate.jsonPath(response,"$..content")
    * print 'content...',content
    * assert content.length > 0

    Examples: 
      | lang | responseCode |
      | en   |          200 |

  @DEV @regression @SN61
  Scenario Outline: To validate the response of similar merchant API
    Given headers req_headers
    And url baseUrl
    And path  similarApiUrl+"/"+itemid+"/"+count
    And params {location :<location>}
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | location |
      |          200 | dubai    |

  @DEV @regression @SN62
  Scenario Outline: To validate the response interacted merchant||Offers
    Given headers req_headers
    And url baseUrl
    And path interactedApiUrl
    And params {interactionType:<interactionType>, itemType:<itemType>, lang:<lang>}
    When method get
    Then status <responseCode>
    Then print response
    * assert responseStatus == 200
    * def merchantIds = karate.jsonPath(response,"$..id")
    * print 'merchantIds...',merchantIds
    * assert merchantIds.length > 0

    Examples: 
      | responseCode | itemType | interactionType | lang |
      |          200 | OFFER    | CLAIM           | en   |

  @DEV @regression @SN63
  Scenario Outline: To validate the response wishlisted merchant||Offers
    Given headers req_headers
    And url baseUrl
    And path interactedApiUrl
    And params {interactionType:<interactionType>, itemType:<itemType>, lang:<lang>}
    When method get
    Then status <responseCode>
    Then print response
    * assert responseStatus == 200
    * def merchantIds = karate.jsonPath(response,"$..id")
    * print 'id...',merchantIds
    * assert merchantIds.length > 0

    Examples: 
      | responseCode | itemType | interactionType | lang |
      |          200 | MERCHANT | WISHLIST        | en   |

  @DEV @regression @SN65
  Scenario Outline: To validate the merchants details api
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<itemId>'
    When method get
    Then status <responseCode>
    Then print response
    * def name = karate.jsonPath(response,"$..name")
    * def tasteMatchScore = karate.jsonPath(response,"$..tasteMatchScore")
    * def category = karate.jsonPath(response,"$..category")
    * def merchantUrl = karate.jsonPath(response,"$..url")
    * def tasteMatchScoreReason = karate.jsonPath(response,"$..tasteMatchScoreReason")
    * assert name.length > 0 && tasteMatchScore >= 70 && category.length >0 && merchantUrl.length >0 && tasteMatchScoreReason.length > 0
    * def OfferIds = karate.jsonPath(response,"$..offers.id")
    * print 'OfferIds...',OfferIds

    Examples: 
      | lang | itemId                               | responseCode |
      | en   | 1172d856-80a8-4d56-b7f8-c31116949c44 |          200 |

  @DEV @regression @SN66
  Scenario Outline: To validate the response for minimum and maximun tastematch score
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>}
    When method post
    Then status <responseCode>
    Then def listofTasteMatchScores = karate.jsonPath(response,"$..tasteMatchScore")
    Then print listofTasteMatchScores
    Then def list = listofTasteMatchScores
    # Then def list = [70, 98, 100, 101]
    Then def min = <min>
    Then print min
    Then def max = <max>
    Then print max
    Then def foundAt = []
    Then def fun = function(x, i){ if (x >= min && x <= max ) karate.appendTo(foundAt, x) }
    Then karate.forEach(list, fun)
    Then def output = foundAt.length
    Then print output
    Then def input = list.length
    Then print input
    Then assert output == input

    Examples: 
      | responseCode | category | choiceCount | lang | city  | includeCampaigns | servedAt                      | min | max |
      |          200 | all      |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |  70 |  98 |

  @DEV @regression @SN67
  Scenario Outline: To validate the increase in taste match score when user liked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue
    Then def scoreValue = oldvalue - newvalue
    * print 'score value : ', score
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 280ee62e-5ead-416b-a8f1-f6a08746dfb6 |          200 | LIKE            | MERCHANT |   -10 |

  @DEV @regression @SN68
  Scenario Outline: To validate the decrease in taste match score when user disliked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue
    Then def scoreValue = oldvalue - newvalue
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 280ee62e-5ead-416b-a8f1-f6a08746dfb6 |          200 | DISLIKE         | MERCHANT |    10 |

  @DEV @regression @SN69
  Scenario Outline: To validate the decrease in taste match score when user Wishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 280ee62e-5ead-416b-a8f1-f6a08746dfb6 |          200 | WISHLIST        | MERCHANT |     4 |

  @DEV @regression @SN70
  Scenario Outline: To validate the decrease in taste match score when user undoWishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 280ee62e-5ead-416b-a8f1-f6a08746dfb6 |          200 | UNDO_WISHLIST   | MERCHANT |    -4 |

  @DEV @regression @SN71
  Scenario Outline: To validate the increase in taste match score when user liked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue
    Then def scoreValue = oldvalue - newvalue
    * print 'score value : ', score
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 4921ee2a-08d4-4c81-afa3-6557156150c2 |          200 | LIKE            | MERCHANT |   -10 |

  @DEV @regression @SN72
  Scenario Outline: To validate the decrease in taste match score when user disliked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue
    Then def scoreValue = oldvalue - newvalue
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 4921ee2a-08d4-4c81-afa3-6557156150c2 |          200 | DISLIKE         | MERCHANT |    10 |

  @DEV @regression @SN73
  Scenario Outline: To validate the decrease in taste match score when user Wishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 4921ee2a-08d4-4c81-afa3-6557156150c2 |          200 | WISHLIST        | MERCHANT |     4 |

  @DEV @regression @SN74
  Scenario Outline: To validate the decrease in taste match score when user undoWishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 4921ee2a-08d4-4c81-afa3-6557156150c2 |          200 | UNDO_WISHLIST   | MERCHANT |    -4 |

  @DEV @regression @SN75
  Scenario Outline: To validate the increase in taste match score when user liked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue
    Then def scoreValue = oldvalue - newvalue
    * print 'score value : ', score
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | e40efa5f-fd95-4dcb-837f-6c2bf5b1c0a5 |          200 | LIKE            | MERCHANT |   -10 |

  @DEV @regression @SN76
  Scenario Outline: To validate the decrease in taste match score when user disliked a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue
    Then def scoreValue = oldvalue - newvalue
    Then assert scoreValue == <score>

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | e40efa5f-fd95-4dcb-837f-6c2bf5b1c0a5 |          200 | DISLIKE         | MERCHANT |    10 |

  @DEV @regression @SN77
  Scenario Outline: To validate the decrease in taste match score when user Wishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | e40efa5f-fd95-4dcb-837f-6c2bf5b1c0a5 |          200 | WISHLIST        | MERCHANT |     4 |

  @DEV @regression @SN78
  Scenario Outline: To validate the decrease in taste match score when user undoWishlisted a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue > newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | e40efa5f-fd95-4dcb-837f-6c2bf5b1c0a5 |          200 | UNDO_WISHLIST   | MERCHANT |    -4 |

  @DEV @regression @SN79
  Scenario Outline: To validate the decrease in taste match score when user redirected a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | 07fa5146-8150-42a8-a89a-227304309fe2 |          200 | REDIRECT        | MERCHANT |     6 |

  @DEV @regression @SN80
  Scenario Outline: To validate the increase in taste match score when the user claim a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | cb1bdc8b-4b53-43b8-b4c2-00638dc1d7df |          200 | CLAIM           | MERCHANT |     6 |

  @DEV @regression @SN81
  Scenario Outline: To validate the increase in taste match score when the user View  a merchant
    Given headers req_headers
    And def oldTasteScoreValue = call read('Reg.feature@oldTasteMatchScore')
    And url baseUrl
    And path  interactApiUrl
    And request {interactionType:<interactionType>, value:<value>, itemType:<itemType>}
    When method post
    Then status <responseCode>
    Then print response
    Then def newTasteScoreValue = call read('Reg.feature@newTasteMatchScore')
    Then def oldvalue = oldTasteScoreValue.oldTasteMatchScore
    * print 'Old value : ', oldvalue
    Then def newvalue = newTasteScoreValue.newTasteMatchScore
    * print 'New value : ', newvalue
    Then assert oldvalue < newvalue

    Examples: 
      | value                                | responseCode | interactionType | itemType | score |
      | cb1bdc8b-4b53-43b8-b4c2-00638dc1d7df |          200 | VIEW            | MERCHANT |     2 |

  @DEV @regression @SN82
  Scenario Outline: To validate the merchants details api
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<itemId>'
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | lang | itemId                               | responseCode | servedAt                 |
      | en   | 1172d856-80a8-4d56-b7f8-c31116949c44 |          200 | 2022-05-14T17:03:39.656Z |

  @DEV @regression @SN84
  Scenario Outline: To validate the interaction api
    Given headers req_headers
    And url baseUrl
    And path interactedApiUrl
    And params {interactionType:<interactionType>, itemType:<itemType>}
    When method get
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode |  | itemType |  | interactionType |
      |          200 |  | MERCHANT |  | DISLIKE         |
      |          200 |  | MERCHANT |  | WISHLIST        |
      |          200 |  | MERCHANT |  | REDIRECT        |
      |          200 |  | MERCHANT |  | VIEW            |

  @DEV @regression @sanity @SN85
  Scenario Outline: To validate the response for category choices list
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {category:<category>, choiceCount:<choiceCount>, lang:<lang>,city:<city>,includeCampaigns:<includeCampaigns>,servedAt:<servedAt>, }
    When method Post
    Then status <responseCode>
    Then print response

    Examples: 
      | responseCode | category                | choiceCount | lang | city  | includeCampaigns | servedAt                      |
      |          200 | apparel and accessories |          10 | en   | dubai | true             | 2022-04-06T23:59:59.000+00:00 |
