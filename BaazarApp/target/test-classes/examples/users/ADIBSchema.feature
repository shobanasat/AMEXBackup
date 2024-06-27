Feature: JSON Schema Validation

  #Author Name: Ramakrishna
  #Creation Date: 29/04/2022
  Background: baseUrl
    * def req_headers = {Authorization :'auth', Content-Type: 'application/json',User-Access-Token: 'd44664c1-7184-44c1-b010-8cb3bbc34c7b'}
    * def lang = {lang:'en'}
    * def limittype = {limit:10}
    * def campaigntype = {campaignType:'EVENT'}
    * def searchword = {searchWord:'retail'}
    * def docsurl = {type :'privacy_policy'}
    * def cityquery = {lang:'en'}
    * def count = 12
    * def itemid = '07fa5146-8150-42a8-a89a-227304309fe2'

  @DEV @regression @sanity 
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
      | responseCode |
      |          200 |

  @DEV @regression @sanity
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

  @DEV @regression @sanity
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

  @DEV @regression @sanity @failed
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

  @DEV @regression @sanity 
  Scenario Outline: To validate the response of merchat search API schema
    Given headers req_headers
    And url baseUrl
    And path  searchApiUrl
    And request {city:<city>, category:<category>, distance:<distance>, isOnline:<isOnline>, latitude:<latitude>, longitude:<longitude>, searchWord:<searchWord>, searchTextLang:<searchTextLang>, sortBy:<sortBy>, lang:<lang> }
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/merchantSearchADIB.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | city  | category | distance | isOnline | latitude  | longitude | searchWord | searchTextLang | sortBy   | lang | responseCode |
      | dubai | dining   |       15 | false    | 25.276987 | 55.296249 | Marbles    | en             | distance | en   |          200 |

  @DEV @regression @sanity
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

  @DEV @regression @sanity @failed
  Scenario Outline: To validate the response of similar merchant API schema
    Given headers req_headers
    And url baseUrl
    And path  similarApiUrl+"/"+itemid+"/"+count
    And params {location :<location>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/similarItems.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * print jsonData
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | responseCode | location |
      |          200 | dubai    |

  @DEV @regression @sanity
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

  @DEV @regression @sanity 
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

  @DEV @regression @sanity @choice
  Scenario Outline: To validate the response interacted merchant|Offers schema
    Given headers req_headers
    And url baseUrl
    And path  interactedApiUrl
    And params {interactionType:<interactionType>, itemType:<itemType>}
    When method get
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/interactedOffersADIB.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | interactionType | itemType | responseCode |
      | WISHLIST        | MERCHANT |          200 |

  @DEV @regression @sanity 
  Scenario Outline: To validate the merchants details api schema
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<itemId>'
    #  And path <itemId>
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

  @DEV @regression @sanity 
  Scenario Outline: To validate the Schema for all list schema
    Given headers req_headers
    And url baseUrl
    And path  choiceApiUrl
    And request {choiceCount:<choiceCount>, category:<category>, choiceListType:<choiceListType>, city:<city>, latitude:<latitude>, longitude:<longitude>, lang:<lang> }
    When method post
    Then status <responseCode>
    Then print response
    * string jsonSchemaExpected = read('file:src/test/java/examples/utils/choicelistADIB.json')
    * string jsonData = response
    * def SchemaUtils = Java.type('examples.JSONSchemaUtil')
    * assert SchemaUtils.isValid(jsonData, jsonSchemaExpected)

    Examples: 
      | choiceCount | category      | choiceListType | city  | latitude  | longitude | lang | responseCode |
      |           1 | retail stores | TRENDING       | dubai | 25.276987 | 55.296249 | en   |          200 |
