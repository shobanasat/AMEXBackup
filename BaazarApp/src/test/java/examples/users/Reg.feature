Feature: To validate the Test of Consumer App in DEV Environment

  #Author Name: Ramakrishna
  #Creation Date: 10/05/2022
  Background: baseUrl
    * def req_headers = {Authorization :'auth', Content-Type: 'application/json',User-Access-Token: 'TXID_e942b1ef-fc65-4074-bea2-544cfd2bc32e'}
    * def lang = {lang:'en'}
    * def limittype = {limit:10}
    * def campaigntype = {campaignType:'EVENT'}
    * def searchword = {searchWord:'retail'}
    * def docsurl = {type :'privacy_policy'}

  @DEV @regression @oldTasteMatchScore
  Scenario Outline: To Find out the old tasteMatchScore
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<value>'
    When method get
    Then status <responseCode>
    * def oldTasteMatchScore = response.tasteMatchScore

    Examples: 
      | value                                | responseCode |
      | 07fa5146-8150-42a8-a89a-227304309fe2 |          200 |

  @DEV @regression @newTasteMatchScore
  Scenario Outline: To Find out the old tasteMatchScore
    Given headers req_headers
    And url baseUrl
    And path  itemsApiUrl+'/'+ '<value>'
    When method get
    Then status <responseCode>
    # Then print response.tasteMatchScore
    * def newTasteMatchScore = response.tasteMatchScore

    Examples: 
      | value                                | responseCode |
      | 07fa5146-8150-42a8-a89a-227304309fe2 |          200 |
