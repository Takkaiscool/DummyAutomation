@GIS
Feature: Verify the functionality of  Health Center Program GeoCare Navigator map
  Scope - verify the elements on the page
  Layers and widgets
  Out of scope the esiri part is out of scope

  Background: Verify the Health Center Program GeoCare Navigator page is loading
    #Given user is on "Health Center Program GeoCare Navigator" page
    Given user is on "home" page
    When user click on "Health Center Program GeoCare Navigator" link under "Tools" menu
    And page header is displayed as "Health Center Program GeoCare Navigator"

   #13-23
  @HDWD-4315 @HDWD-4725
  Scenario: Verify the User see options to start using map tool
    Then User see the instructions under "Welcome to GeoCare Navigator"
      | Explore health centers, service areas, and relevant data, or use this tool for an application (Change in Scope Request, Service Area Competition, Look-Alike, New Access Point). |
    And User see the instructions line items under "Welcome to GeoCare Navigator"
      | New: GeoCare Navigator was updated with 2024 Uniform Data System (UDS) data on November 7th, 2025. |
    And User see the instructions under "Have a Map File?"
      | Upload and import your GeoJSON file using the Import into Map window. |
    And User see the "Get Started" button
    And User see the "Import into Map" button

  @HDWD-4315 @automatedGeocare @daily1
  Scenario Outline: Verify the User select options to start using map tool
    When Click on '<Action>' button
    Then Navigation panel title is displayed as '<Destination_page>'
#line 31
    Examples:
      | Action      | Destination_page                                               |
      | Get Started | Select your application type or select any option to continue: |

  @HDWD-4318 @UDS_mapper @HDWD-4725 @HDWD-4316 @HDWD-4317 @automatedGeocare @daily1 @smoke1
  Scenario: Verify left Navigation panel for New Access Point page
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    Then page title is displayed as "New Access Point"
    And User see the "Back" button
    And User see the "Start" button
    Then User see the below Task for "New Access Point"
      | Task_Element               | Action |
      | Create Service Area        | Start  |
      | Add Service Delivery Sites | Start  |
      | Review Map and Data Table  | Start  |
    Then User see "View Requirements List" underline-text
    Then User see requirement list under paragraph "For your New Access Point application, include the following in your map:"
      | Parent_Required_Information                      | Sub-list                              |
      | Proposed New Site(s)                             |                                       |
      | Proposed Service Area ZCTAs                      |                                       |
      | Health Center Program Sites:                     | Health Center Service Delivery Sites  |
      | Health Center Program Look-Alike Sites:          | Look-Alike Service Delivery Sites     |
      | Medically Underserved Areas/Populations (MUA/Ps) |                                       |
      | Other Health Facilities:                         | Hospitals,Rural Health Clinics (RHCs) |
    Then User see requirement list under paragraph "For each ZCTA in the service area, include the following in your data table:"
      | Parent_Required_Information             | Sub-list |
      | Health Center Count                     |          |
      | Dominant Health Center                  |          |
      | Total Population                        |          |
      | Low-Income Population                   |          |
      | Total HCP Patients                      |          |
      | HCP Penetration of Low-Income (%)       |          |
      | HCP Penetration of Total Population (%) |          |
    Then User verify the note "Note: The elements listed above (excluding Proposed New Sites and Proposed Service Area ZCTAs) are displayed in the map and data table by default." is displayed on the UDS mapper

  @HDWD-4725 @HDWD-4316 @automatedGeocare @daily1
  Scenario: Verify left Navigation panel for Service Area Competition Application page
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "Service Area Competition Application"
    And Click on "Continue" button
    Then page title is displayed as "Service Area Competition"
    And User see the "Back" button
    And User see the "Start" button
    Then User see the below Task for "Service Area Competition"
      | Task_Element               | Action |
      | Create Service Area        | Start  |
      | Add Service Delivery Sites | Start  |
      | Review Map and Data Table  | Start  |
    Then User see "View Requirements List" underline-text
    Then User see requirement list under paragraph "For your Service Area Competition application, include the following in your map:"
      | Parent_Required_Information                      | Sub-list                                                                         |
      | Proposed New Site(s)                             |                                                                                  |
      | Proposed Service Area ZCTAs                      |                                                                                  |
      | Health Center Program Sites:                     | Health Center Service Delivery Sites                                             |
      | Health Center Program Look-Alike Sites:          | Look-Alike Service Delivery Sites                                                |
      | Medically Underserved Areas/Populations (MUA/Ps) |                                                                                  |
      | Other Health Facilities:                         | Hospitals,Rural Health Clinics (RHCs),National Health Service Corps (NHSC) Sites |
    Then User see requirement list under paragraph "For each ZCTA in the service area, include the following in your data table:"
      | Parent_Required_Information             | Sub-list |
      | Health Center Count                     |          |
      | Dominant Health Center                  |          |
      | Total Population                        |          |
      | Low-Income Population                   |          |
      | Total HCP Patients                      |          |
      | HCP Penetration of Low-Income (%)       |          |
      | HCP Penetration of Total Population (%) |          |
      | Uninsured Not Served by Health Centers  |          |
    Then User verify the note "Note: The elements listed above (excluding Proposed New Sites and Proposed Service Area ZCTAs) are displayed in the map and data table by default." is displayed on the UDS mapper

  @HDWD-4725 @HDWD-4316 @automatedGeocare @daily1
  Scenario: Verify left Navigation panel for Look-Alike Application page
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "Look-Alike Application"
    And Click on "Continue" button
    Then page title is displayed as "Look-Alike Application"
    And User see the "Back" button
    And User see the "Start" button
    Then User see the below Task for "Look-Alike"
      | Task_Element               | Action |
      | Create Service Area        | Start  |
      | Add Service Delivery Sites | Start  |
      | Review Map and Data Table  | Start  |
    Then User see "View Requirements List" underline-text
    Then User see requirement list under paragraph "For your Look-Alike application, include the following in your map:"
      | Parent_Required_Information                      | Sub-list                                                            |
      | Proposed New Site(s)                             |                                                                     |
      | Proposed Service Area ZCTAs                      |                                                                     |
      | Health Center Program Sites:                     | Health Center Service Delivery Sites,Health Center Admin Only Sites |
      | Health Center Program Look-Alike Sites:          | Look-Alike Service Delivery Sites,Look-Alike Admin Only Sites       |
      | Medically Underserved Areas/Populations (MUA/Ps) |                                                                     |
    Then User see requirement list under paragraph "For each ZCTA in the service area, include the following in your data table:"
      | Parent_Required_Information             | Sub-list |
      | Health Center Count                     |          |
      | Dominant Health Center                  |          |
      | Total Population                        |          |
      | Low-Income Population                   |          |
      | Total HCP Patients                      |          |
      | HCP Penetration of Low-Income (%)       |          |
      | HCP Penetration of Total Population (%) |          |
      | Uninsured Not Served by Health Centers  |          |
    Then User verify the note "Note: The elements listed above (excluding Proposed New Sites and Proposed Service Area ZCTAs) are displayed in the map and data table by default." is displayed on the UDS mapper

  @HDWD-4725 @HDWD-4316 @automatedGeocare @daily1
  Scenario: Verify left Navigation panel for Change in Scope Request Application page
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "Change in Scope Request"
    And Click on "Continue" button
    Then page title is displayed as "Change in Scope Request"
    And User see the "Back" button
    And User see the "Start" button
    Then User see the below Task for "Change in Scope Request"
      | Task_Element               | Action |
      | Create Service Area        | Start  |
      | Add Service Delivery Sites | Start  |
      | Review Map and Data Table  | Start  |
    Then User see "View Requirements List" underline-text
    Then User see requirement list under paragraph "For your Change in Scope application, include the following in your map:"
      | Parent_Required_Information                      | Sub-list                             |
      | Proposed New Site(s)                             |                                      |
      | Proposed Service Area ZCTAs                      |                                      |
      | Health Center Program Sites:                     | Health Center Service Delivery Sites |
      | Health Center Program Look-Alike Sites:          | Look-Alike Service Delivery Sites    |
      | Medically Underserved Areas/Populations (MUA/Ps) |                                      |
      | Other Health Facilities:                         | Hospitals                            |
      | Housing and Urban Development (HUD) Facilities:  | Public Housing Developments          |
    Then User see requirement list under paragraph "For each ZCTA in the service area, include the following in your data table:"
      | Parent_Required_Information                      | Sub-list |
      | Health Center Count                              |          |
      | Dominant Health Center                           |          |
      | Dominant Health Center Share of Patients         |          |
      | Total Population                                 |          |
      | Low-Income Population                            |          |
      | Total HCP Patients                               |          |
      | HCP Penetration of Low-Income (%)                |          |
      | HCP Penetration of Total Population (%)          |          |
      | HCP: Low-Income Not Served by Health Centers (#) |          |
      | Uninsured Not Served by Health Centers           |          |
    Then User verify the note "Note: The elements listed above (excluding Proposed New Sites and Proposed Service Area ZCTAs) are displayed in the map and data table by default." is displayed on the UDS mapper

  #---------------------------------------------------------NAP
  @HDWD-4317 @automatedGeocare @daily1
  Scenario: Verify User should be able to select an option, which prompts that widget to start on New Access Point page
    When Click on "Get Started" button
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    Then page title is displayed as 'Create Your Service Area'
    When Click on "Back" button
    And User click on 'Start' for 'Add Service Delivery Sites'
    Then user see 'Add Service Delivery Sits' page is displayed
    Then page title is displayed as 'Add Service Delivery Sites' it is H2
    When Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'

  @HDWD-4317 @testUDS @automatedGeocare @daily1
  Scenario: Verify User should be able access Paste geometry button and validation for incorrect zcta
    When Click on "Get Started" button
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on 'Paste' geometry button
    Then User see requirement list under paragraph 'Paste the ZIP Codes or ZCTAs that make up your service area into the box below. Validate that your inputs are aligned with a ZCTA by selecting "Validate ZCTAs".'
      | Parent_Required_Information                                                                                   |
      | If your input results in a “Spatial Join”, please update each of your pasted ZIP Codes with the aligned ZCTA. |
      | If your input results in a “Data Not Found”, you will not be able to add this record to the map.              |
    And User see the text "Once you have validated each record as having a corresponding ZCTA, select “Add ZCTAs” to add to the map."
    Then User enter 'S' to the textarea
    When Click on 'Validate ZCTAs' button
    And User see the text "Input string is not in the correct format. Please use 5-digit ZIP codes separated by commas."

  @HDWD-4317 @testUDS @automatedGeocare @daily1 @smoke1
  Scenario: Verify User should be able Paste ZIP Codes,validate the ZCTAs and Add valid ZCTAs to the map
    When Click on "Get Started" button
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on 'Paste' geometry button
    Then User enter '20169,22060,00501,00601,02222,88888,01010,0000' to the textarea
    When Click on 'Validate ZCTAs' button
    Then user see the validation box for ZCTAs
      | Entered_ZIP_Code | Matching_ZCTA               | ZIP_Join_Type        |
      | 20169            | 20169                       | Zip matches ZCTA     |
      | 22060            | 22060                       | Zip matches ZCTA     |
      | 00501            | 11742                       | Spatial join to ZCTA |
      | 00601            | 00601                       | Zip matches ZCTA     |
      | 02222            | 02114                       | Spatial join to ZCTA |
      | 88888            | 20018                       | Spatial join to ZCTA |
      | 01010            | 01010                       | Zip matches ZCTA     |
      | 0000             | No Matching ZCTA Data Found | Data Not Found       |

  @HDWD-4309 @HDWD-4318 @automatedGeocare @daily1
  Scenario Outline: Verify user is able to navigate to open up the Create Service Area widget/functionality from New Access Point page
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And Below options should be displayed
      | Draw On Map |
      | By Distance |
    When user click on 'Draw On Map' tab under geo care
    Then verify below options should be displayed under Draw on Map
      | Filter by point    |
      | Filter by line     |
      | Filter by polygon  |
      | Add by search      |
      | Add by file upload |
      | Paste              |

    Examples:
      | application_type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |

  @HDWD-4311 @HDWD-4318 @automatedGeocare @daily1 @geocare @smoke1
  Scenario Outline: Verify the ZCTA select service area functionality using search bar
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    Then verify below options should be displayed under Draw on Map
      | Filter by point    |
      | Filter by line     |
      | Filter by polygon  |
      | Add by search      |
      | Add by file upload |
      | Paste              |
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for "<zcta>"
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel

    #    And User should be visual indication on the map for "<zcta>"
    Examples:
      | application_type                     | zcta  |
      | New Access Point Application         | 23060 |
      | Service Area Competition Application | 23060 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 23060 |

  @HDWD-4313 @automatedGeocare @daily1 @geocare
  Scenario Outline: Verify the Single deselect service area functionality using Remove Indicator
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    Then verify below options should be displayed under Draw on Map
      | Filter by point    |
      | Filter by line     |
      | Filter by polygon  |
      | Add by search      |
      | Add by file upload |
      | Paste              |
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for "<zcta>"
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    And user should see an indicator to remove a specific ZCTA "<zcta>" in navigation panel
    When user click on the remove indicator for "<zcta>"
    Then verify "<zcta>" ZCTA's should be removed in the navigation panel

    #And "<zcta>" ZCTA's should be removed in the ZCTA list
    # And "<zcta>" ZCTA's should be removed in the data table
    #And there should not be visual indication on the map for "<zcta>"
    Examples:
      | application_type                     | zcta  |
      | New Access Point Application         | 28277 |
      | Service Area Competition Application | 23060 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 23060 |

  @HDWD-4330 @HDWD-4331 @automatedGeocare @daily1
  Scenario Outline: Verify the report output functionality
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    Then verify below options should be displayed under Draw on Map
      | Filter by point    |
      | Filter by line     |
      | Filter by polygon  |
      | Add by search      |
      | Add by file upload |
      | Paste              |
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for "<zcta>"
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    When Click on "Add Service Delivery Sites" button
    And user enter address site as "The White House"
    Then searched result should be visible on the search list for "The White House"
    And user click Add for address site "The White House"
    And user expand the bottom panel
    And user clicks on button "ZCTA Table"
    Then user verify the ZCTA in grid is "<zcta>"
    When user clicks on button "Selected Sites"
    Then user verify the selected sites in grid is "The White House"
    When user click on "Print Report" option on the map
    And verifies print report option as
      | Map and Legend   |
      | Data Table       |
      | Site Information |
      | Additional Notes |
    And user click on "Data Table" option on print report
    And user click on "Site Information" option on print report
    And user click on "Additional Notes" option on print report
    And user enter additional notes as "Automation notes"
    And user selects titlename "<FileName>" page setup "<Page Setup>" and file format "<Type>"
    Then user verify the "<FileName>" downloaded in DownloadDir


    Examples:
      | application_type                     | zcta  | Page Setup | Type    | FileName                      |
      | New Access Point Application         | 28277 | Portrait   | PDF     | PDF Export1.pdf               |
      | New Access Point Application         | 28277 | Portrait   | GeoJSON | exported_graphics_Nap.geojson |
      | Service Area Competition Application | 28277 | Portrait   | PDF     | PDF Export2.pdf               |
      | Look-Alike Application               | 28277 | Portrait   | PDF     | PDF Export3.pdf               |
      | Change in Scope Request              | 28277 | Portrait   | PDF     | PDF Export4.pdf               |

    #362-434
  @HDWD-4355 @automatedGeocare @automated @daily1
  Scenario: Verify the Map layers Wediget on geocare map for NAP
    When Click on "Get Started" button
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    When user click on "Map Layers" option on the map
    Then user verify the map layers data for UDS Mapper Tool
      | Health Center Program Sites                      |
      | Health Center Program Look-Alike Sites           |
      | SAMHSA Facilities & Providers                    |
      | Housing and Urban Development (HUD) Facilities   |
      | Other Health Facilities                          |
      | Dartmouth Boundaries                             |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | Health Professional Shortage Areas (HPSAs)       |
      | ZCTA                                             |
      | U.S. Boundaries                                  |
    When user expand the layer "Health Center Program Sites" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Health Center Program Sites" in UDS Mapper Tool and are in alphabetical
      | Health Center Service Delivery Sites    |
      | Health Center Administrative Only Sites |
    And user collapse the layer "Health Center Program Sites" in UDS Mapper Tool
    When user expand the layer "Health Center Program Look-Alike Sites" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Health Center Program Look-Alike Sites" in UDS Mapper Tool and are in alphabetical
      | Look-Alike Service Delivery Sites    |
      | Look-Alike Administrative Only Sites |
    And user collapse the layer "Health Center Program Look-Alike Sites" in UDS Mapper Tool
    When user expand the layer "SAMHSA Facilities & Providers" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "SAMHSA Facilities & Providers" in UDS Mapper Tool and are in alphabetical
      | Buprenorphine Practitioners (SAMHSA)       |
      | Mental Health Facility (SAMHSA)            |
      | Opioid Treatment Program Facility (SAMHSA) |
      | Substance Use Facility (SAMHSA)            |
    And user collapse the layer "SAMHSA Facilities & Providers" in UDS Mapper Tool
    When user expand the layer "Housing and Urban Development (HUD) Facilities" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Housing and Urban Development (HUD) Facilities" in UDS Mapper Tool and are in alphabetical
      | Public Housing Buildings     |
      | Public Housing Developments  |
      | CHOICE Neighborhood Grantees |
    And user collapse the layer "Housing and Urban Development (HUD) Facilities" in UDS Mapper Tool
    When user expand the layer "Other Health Facilities" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Other Health Facilities" in UDS Mapper Tool and are in alphabetical
      | Hospitals                                           |
      | Health Professional Shortage Area (HPSA) Facilities |
      | Indian Health Service (IHS) Facilities              |
      | National Health Service Corps (NHSC) Sites          |
      | Rural Health Clinics (RHCs)                         |
      #| Veterans' Health Administration (VHA) Facilities    |
    And user collapse the layer "Other Health Facilities" in UDS Mapper Tool
    When user expand the layer "Dartmouth Boundaries" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Dartmouth Boundaries" in UDS Mapper Tool and are in alphabetical
      | Primary Care Service Areas (PCSAs) |
      | Hospital Referral Regions (HRRs)   |
    And user collapse the layer "Dartmouth Boundaries" in UDS Mapper Tool
    When user expand the layer "Medically Underserved Areas/Populations (MUA/Ps)" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Medically Underserved Areas/Populations (MUA/Ps)" in UDS Mapper Tool and are in alphabetical
      | Medically Underserved Areas/Populations (MUA/Ps) |
    When user collapse the layer "Medically Underserved Areas/Populations (MUA/Ps)" in UDS Mapper Tool
    When user expand the layer "Health Professional Shortage Areas (HPSAs)" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "Health Professional Shortage Areas (HPSAs)" in UDS Mapper Tool and are in alphabetical
      | Primary Care HPSA  |
      | Mental Health HPSA |
      | Dental Health HPSA |
    When user collapse the layer "Health Professional Shortage Areas (HPSAs)" in UDS Mapper Tool
    When user expand the layer "U.S. Boundaries" in UDS Mapper Tool
    Then user verify the sub map layers data for layer "U.S. Boundaries" in UDS Mapper Tool and are in alphabetical
      | Census Block Groups |
      | Census Tracts       |
      | PUMAs               |
      | County Subdivisions |
      | Counties            |
      | States              |

    #461
  @automated
  Scenario Outline: Verify the Show and Hide data functionality on map layer list
    When Click on "Get Started" button
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    When user click on "Map Layers" option on the map
    When user hide the layer "<Layer>" for uds mapper
    When user show the layer "<Layer>" for uds mapper
    Then user verify "<Layer>" should be visible on map for uds mapper
    When user expand the layer "<Layer>" in UDS Mapper Tool
    And user hide the layer "<Sub Layer>" for uds mapper
    Then user verify "<Sub Layer>" should be not visible on map for uds mapper
    When user show the layer "<Sub Layer>" for uds mapper
    Then user verify "<Sub Layer>" should be visible on map for uds mapper

    Examples:
      | Layer                                            | Sub Layer                                           |
      | Health Center Program Sites                      | Health Center Service Delivery Sites                |
      | Health Center Program Sites                      | Health Center Administrative Only Sites             |
      | Health Center Program Look-Alike Sites           | Look-Alike Service Delivery Sites                   |
      | Health Center Program Look-Alike Sites           | Look-Alike Administrative Only Sites                |
      | SAMHSA Facilities & Providers                    | Buprenorphine Practitioners (SAMHSA)                |
      | SAMHSA Facilities & Providers                    | Mental Health Facility (SAMHSA)                     |
      | SAMHSA Facilities & Providers                    | Opioid Treatment Program Facility (SAMHSA)          |
      | SAMHSA Facilities & Providers                    | Substance Use Facility (SAMHSA)                     |
      | Housing and Urban Development (HUD) Facilities   | Public Housing Buildings                            |
      | Housing and Urban Development (HUD) Facilities   | Public Housing Developments                         |
      | Housing and Urban Development (HUD) Facilities   | CHOICE Neighborhood Grantees                        |
      | Other Health Facilities                          | Hospitals                                           |
      | Other Health Facilities                          | Health Professional Shortage Area (HPSA) Facilities |
      | Other Health Facilities                          | Indian Health Service (IHS) Facilities              |
      | Other Health Facilities                          | National Health Service Corps (NHSC) Sites          |
      | Other Health Facilities                          | Rural Health Clinics (RHCs)                         |
#      | Other Health Facilities                          | Veterans' Health Administration (VHA) Facilities    |
      | Dartmouth Boundaries                             | Primary Care Service Areas (PCSAs)                  |
      | Dartmouth Boundaries                             | Hospital Referral Regions (HRRs)                    |
      | Medically Underserved Areas/Populations (MUA/Ps) | Medically Underserved Areas/Populations (MUA/Ps)    |
      | Health Professional Shortage Areas (HPSAs)       | Primary Care HPSA                                   |
      | Health Professional Shortage Areas (HPSAs)       | Mental Health HPSA                                  |
      | Health Professional Shortage Areas (HPSAs)       | Dental Health HPSA                                  |
      | U.S. Boundaries                                  | Census Block Groups                                 |
      | U.S. Boundaries                                  | Census Tracts                                       |
      | U.S. Boundaries                                  | PUMAs                                               |
      | U.S. Boundaries                                  | County Subdivisions                                 |
      | U.S. Boundaries                                  | Counties                                            |
      | U.S. Boundaries                                  | States                                              |

  @automatedGeocare @daily1 @HDWOM-24670
  Scenario: Verify the Basemap functionality on the map
    When user click on 'Basemap Gallery' widget button
    Then user select the Basemap option as '<Option>' and verify the option is selected
      | Option            |
      | Light Gray Canvas |
      | Community Map     |
      | Dark Gray Canvas  |
      | Imagery Hybrid    |
      | Navigation        |
      | Streets           |
      | Topographic       |

  ##-----------------------Automated
  @HDWD-4309 @HDWD-4318 @manual
  Scenario Outline: Verify the single ZCTA select and deselect service area functionality using Filter by point on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    Then page title is displayed as "Create Your Service Area"
    And Below options should be displayed
      | Draw On Map |
      | By Distance |
    When user click on 'Draw On Map' tab under geo care
    Then verify below options should be displayed under Draw on Map
      | Filter by point    |
      | Filter by line     |
      | Filter by polygon  |
      | Add by search      |
      | Add by file upload |
      | Paste              |
    When user selects single "<zcta>" ZCTA on the map using Filter by point
    Then selected "<zcta>" zcta should display in the navigation panel under "ZCTA - Code"
    And User should be visual indication on the map for "<zcta>"
    When Deselect "<zcta>" zcta in the navigation panel under "ZCTA - Code"
    Then "<zcta>" zcta should be removed in the navigation panel under "ZCTA - Code"
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application_type                     | zcta  |
      | New Access Point Application         | 23060 |
      | Service Area Competition Application | 23060 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 23060 |

  #Logged isssue for visual indication on the map for "<zcta>"
  @HDWD-4309 @HDWD-4318 @manual
  Scenario Outline: Verify the multiple ZCTA select and deselect service area functionality using Filter by point on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects multiple "<zcta>" ZCTA on the map using Filter by point
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the multiple "<zcta>" ZCTA on the map
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type                     | zcta        |
      | New access point application         | 23060,28277 |
      | Service area competition application | 23060,28277 |
      | Look-Alike Application               | 23060,28277 |
      | Change in Scope Request              | 23060,28277 |

  @HDWD-4318
  Scenario Outline: Verify the single ZCTA select and deselect service area functionality using Filter by line on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects single "<zcta>" ZCTA on the map using Filter by line
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the single "<zcta>" ZCTA on the map
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type                     | zcta  |
      | New access point application         | 23060 |
      | Service area competition application | 23060 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 23060 |

  @HDWD-4318
  Scenario Outline: Verify the multiple ZCTA select and deselect service area functionality using Filter by line on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects multiple "<zcta>" ZCTA on the map using Filter by line
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the multiple "<zcta>" ZCTA on the map
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type                     | zcta        |
      | New access point application         | 23060,28277 |
      | Service area competition application | 23060,28277 |
      | Look-Alike Application               | 23060,28277 |
      | Change in Scope Request              | 23060,28277 |

  @HDWD-4318
  Scenario Outline: Verify the single ZCTA select and deselect service area functionality using Filter by polygon on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects single "<zcta>" ZCTA on the map using Filter by polygon
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the single "<zcta>" ZCTA on the map
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type             | zcta  |
      | New access point application | 23060 |

  #  | Service area competition application          | 23060 |
  #  | Look-Alike Application                        | 23060 |
  #  | Change in Scope Request                       | 23060 |
  @HDWD-4318
  Scenario Outline: Verify the multiple ZCTA select and deselect service area functionality using Filter by polygon on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects multiple "<zcta>" ZCTA on the map using Filter by polygon
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the multiple "<zcta>" ZCTA on the map
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type                     | zcta        |
      | New access point application         | 23060,28277 |
      | Service area competition application | 23060,28277 |
      | Look-Alike Application               | 23060,28277 |
      | Change in Scope Request              | 23060,28277 |

  @HDWD-4310
  Scenario Outline: Verify the single ZCTA select and deselect service area functionality using drag tool on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects single "<zcta>" ZCTA on the map using Point tool
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the single "<zcta>" ZCTA on the map using Point tool
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type                     | zcta  |
      | New access point application         | 23060 |
      | Service area competition application | 23060 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 23060 |

  @HDWD-4310 @HDWD-4318
  Scenario Outline: Verify the multiple ZCTA select and deselect service area functionality using drag tool on Create your service Area for NAP
    When Click on "Get Started" button
    And Select the Funding application type "<application_type>"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user click on 'Draw On Map' tab
    When user selects miultiple "<zcta>" zcta on the map using "<Tool Type>"
    Then selected "<zcta>" zcta should display in the navigation panel
    And User should be visual indication on the map for "<zcta>"
    When user deselects the multiple "<zcta>" zcta on the map using "<Tool Type>"
    Then selected "<zcta>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta>"

    Examples:
      | application type             | zcta        | Tool Type |
      | New access point application | 23060,28277 | Polygon   |
      | New access point application | 23060,28277 | Line      |

  #  | Service area competition application          | 23060 |
  #  | Look-Alike Application                        | 23060 |
  #  | Change in Scope Request                       | 23060 |
  @HDWD-4330
  Scenario Outline: Verify the export functionality on the map
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user goto the map
    And user click on the export button for "<type>"
    Then user verify shown map is exported

    Examples:
      | type |
      | xlsx |
      | pdf  |

  @automation_pending
  Scenario Outline: Verify the increase and decrease transparency functionality on map layer list
    When Click on "Get Started" button
    And Select the Funding application type "New access point application"
    And Click on "Continue" button
    When Click on "Start" link for "Create Service Area"
    Then page title is displayed as "Create Your Service Area"
    When user hide the layer "<Layer>"
    Then user verify "<Layers>" should not be visible on map
    When user show the layer "<Layer>"
    Then user verify "<Layers>" should be visible on map
    When user expand the layer "<Layer>" in UDS mapping tool
    And user hide the layer "<Sub Layer>"
    Then user verify "<Sub Layer>" should not be visible on map
    When user show the layer "<Sub Layer>"
    Then user verify "<Sub Layers>" should be visible on map
    When user select the layer "<Sub Layer>" option as "<option>"
    And user verify the color transparency on the map should get "<option>"

    Examples:
      | Layer                                              | Sub Layer                                                                | Option                |
      | Health Center Program Sites                        |                                                                          | Increase Transparency |
      | Health Center Program Sites                        |                                                                          | Decrease Transparency |
      | Health Center Program Sites                        | Health Center Program Sites - Admin Only                                 | Increase Transparency |
      | Health Center Program Sites                        | Health Center Program Sites - Admin Only                                 | Decrease Transparency |
      | Health Center Program Sites                        | Health Center Program Sites - Service Delivery Sites                     | Increase Transparency |
      | Health Center Program Sites                        | Health Center Program Sites - Service Delivery Sites                     | Decrease Transparency |
      | Health Center Look-Alike Sites                     |                                                                          | Increase Transparency |
      | Health Center Look-Alike Sites                     |                                                                          | Decrease Transparency |
      | Health Center Look-Alike Sites                     | Health Center Look-Alikes - Admin Only                                   | Increase Transparency |
      | Health Center Look-Alike Sites                     | Health Center Look-Alikes - Admin Only                                   | Decrease Transparency |
      | Health Center Look-Alike Sites                     | Health Center Look-Alikes - Service Delivery Sites                       | Increase Transparency |
      | Health Center Look-Alike Sites                     | Health Center Look-Alikes - Service Delivery Sites                       | Decrease Transparency |
      | SAMHSA Facilities & Providers                      |                                                                          | Increase Transparency |
      | SAMHSA Facilities & Providers                      |                                                                          | Decrease Transparency |
      | SAMHSA Facilities & Providers                      | DATA Waived Providers (SAMHSA)                                           | Increase Transparency |
      | SAMHSA Facilities & Providers                      | DATA Waived Providers (SAMHSA)                                           | Decrease Transparency |
      | SAMHSA Facilities & Providers                      | Mental Health Facility (SAMHSA)                                          | Increase Transparency |
      | SAMHSA Facilities & Providers                      | Mental Health Facility (SAMHSA)                                          | Decrease Transparency |
      | SAMHSA Facilities & Providers                      | Opioid Treatment Program Facility (SAMHSA)                               | Increase Transparency |
      | SAMHSA Facilities & Providers                      | Opioid Treatment Program Facility (SAMHSA)                               | Decrease Transparency |
      | SAMHSA Facilities & Providers                      | Substance Use Facility (SAMHSA)                                          | Increase Transparency |
      | SAMHSA Facilities & Providers                      | Substance Use Facility (SAMHSA)                                          | Decrease Transparency |
      | Housing and Urban Development (HUD) Facilities     |                                                                          | Increase Transparency |
      | Housing and Urban Development (HUD) Facilities     |                                                                          | Decrease Transparency |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Buildings                                                 | Increase Transparency |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Buildings                                                 | Decrease Transparency |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Developments                                              | Increase Transparency |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Developments                                              | Decrease Transparency |
      | Other Health Facilities                            |                                                                          | Increase Transparency |
      | Other Health Facilities                            |                                                                          | Decrease Transparency |
      | Population Indicators                              |                                                                          | Increase Transparency |
      | Population Indicators                              |                                                                          | Decrease Transparency |
      | Population Indicators                              | Pop: Disability (%) 2016-2020                                            | Increase Transparency |
      | Population Indicators                              | Pop: Disability (%) 2016-2020                                            | Decrease Transparency |
      | Population Indicators                              | Pop: Adults With No Pneumonia Vaccine, Est. (%) 2018                     | Increase Transparency |
      | Population Indicators                              | Pop: Adults With No Pneumonia Vaccine, Est. (%) 2018                     | Decrease Transparency |
      | Population Indicators                              | Pop: Adults With No Flu Vaccine, Est. (%) 2018                           | Increase Transparency |
      | Population Indicators                              | Pop: Adults With No Flu Vaccine, Est. (%) 2018                           | Decrease Transparency |
      | Population Indicators                              | Pop: Adults with No Dental Visit in Past Year, Est. (%) 2020             | Increase Transparency |
      | Population Indicators                              | Pop: Adults with No Dental Visit in Past Year, Est. (%) 2020             | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Who Smoke, Est. (%) 2020                                     | Increase Transparency |
      | Population Indicators                              | Pop: Adults Who Smoke, Est. (%) 2020                                     | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Who Are Obese, Est. (%) 2020                                 | Increase Transparency |
      | Population Indicators                              | Pop: Adults Who Are Obese, Est. (%) 2020                                 | Decrease Transparency |
      | Population Indicators                              | Pop: Adults with No Usual Source of Care, Est. (%) 2018                  | Increase Transparency |
      | Population Indicators                              | Pop: Adults with No Usual Source of Care, Est. (%) 2018                  | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Who Delayed/ Not Sought Care Due to High Cost, Est. (%) 2018 | Increase Transparency |
      | Population Indicators                              | Pop: Adults Who Delayed/ Not Sought Care Due to High Cost, Est. (%) 2018 | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Who Are Binge Drinkers, Est. (%) 2020                        | Increase Transparency |
      | Population Indicators                              | Pop: Adults Who Are Binge Drinkers, Est. (%) 2020                        | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2020            | Increase Transparency |
      | Population Indicators                              | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2020            | Decrease Transparency |
      | Population Indicators                              | Pop: Adults Ever Told Have Diabetes, Est. (%) 2020                       | Increase Transparency |
      | Population Indicators                              | Pop: Adults Ever Told Have Diabetes, Est. (%) 2020                       | Decrease Transparency |
      | Population Data: Age                               |                                                                          | Increase Transparency |
      | Population Data: Age                               |                                                                          | Decrease Transparency |
      | Population Data: Age                               | Pop: Under 18 (%) 2017-2021                                              | Increase Transparency |
      | Population Data: Age                               | Pop: Under 18 (%) 2017-2021                                              | Decrease Transparency |
      | Population Data: Age                               | Pop: 18-64 (%) 2017-2021                                                 | Increase Transparency |
      | Population Data: Age                               | Pop: 18-64 (%) 2017-2021                                                 | Decrease Transparency |
      | Population Data: Age                               | Pop: 65 and older (%) 2017-2021                                          | Increase Transparency |
      | Population Data: Age                               | Pop: 65 and older (%) 2017-2021                                          | Decrease Transparency |
      | Population Data: Poverty Level                     |                                                                          | Increase Transparency |
      | Population Data: Poverty Level                     |                                                                          | Decrease Transparency |
      | Population Data: Poverty Level                     | Pop: Low-Income (%) 2016-2020                                            | Increase Transparency |
      | Population Data: Poverty Level                     | Pop: Low-Income (%) 2016-2020                                            | Decrease Transparency |
      | Population Data: Poverty Level                     | Pop: Poverty (%) 2016-2020                                               | Increase Transparency |
      | Population Data: Poverty Level                     | Pop: Poverty (%) 2016-2020                                               | Decrease Transparency |
      | Population Data: Poverty and Insurance Trends      |                                                                          | Increase Transparency |
      | Population Data: Poverty and Insurance Trends      |                                                                          | Decrease Transparency |
      | Population Data: Poverty and Insurance Trends      | Pop: Uninsured, Est. (%) 2020                                            | Increase Transparency |
      | Population Data: Poverty and Insurance Trends      | Pop: Uninsured, Est. (%) 2020                                            | Decrease Transparency |
      | Population Data: Race/Ethnicity                    |                                                                          | Increase Transparency |
      | Population Data: Race/Ethnicity                    |                                                                          | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: American Indian/ Alaska Native (%) 2017-2021                        | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: American Indian/ Alaska Native (%) 2017-2021                        | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Asian (%) 2017-2021                                                 | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Asian (%) 2017-2021                                                 | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Black (%) 2017-2021                                                 | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Black (%) 2017-2021                                                 | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Hispanic/Latino (%) 2017-2021                                       | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Hispanic/Latino (%) 2017-2021                                       | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Native Hawaiian (%) 2017-2021                                       | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Native Hawaiian (%) 2017-2021                                       | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Other Pacific Islander (%) 2017-2021                                | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Other Pacific Islander (%) 2017-2021                                | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Racial/ Ethnic Minority (%) 2017-2021                               | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: Racial/ Ethnic Minority (%) 2017-2021                               | Decrease Transparency |
      | Population Data: Race/Ethnicity                    | Pop: White (%) 2017-2021                                                 | Increase Transparency |
      | Population Data: Race/Ethnicity                    | Pop: White (%) 2017-2021                                                 | Decrease Transparency |
      | Population Data: Social Environment                |                                                                          | Increase Transparency |
      | Population Data: Social Environment                |                                                                          | Decrease Transparency |
      | Population Data: Social Environment                | Pop: Households With Limited English Proficiency (%) 2016-2020           | Increase Transparency |
      | Population Data: Social Environment                | Pop: Households With Limited English Proficiency (%) 2016-2020           | Decrease Transparency |
      | Population Data: Social Environment                | Pop: Less Than High School Education (%) 2016-2020                       | Increase Transparency |
      | Population Data: Social Environment                | Pop: Less Than High School Education (%) 2016-2020                       | Decrease Transparency |
      | Population Data: Social Environment                | Pop: Not Employed (%) 2016-2020                                          | Increase Transparency |
      | Population Data: Social Environment                | Pop: Not Employed (%) 2016-2020                                          | Decrease Transparency |
      | Health Professional Shortage Areas (HPSAs)         |                                                                          | Increase Transparency |
      | Health Professional Shortage Areas (HPSAs)         |                                                                          | Decrease Transparency |
      | Medically Underserved Areas/Populations (MUA/Ps)   |                                                                          | Increase Transparency |
      | Medically Underserved Areas/Populations (MUA/Ps)   |                                                                          | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   |                                                                          | Increase Transparency |
      | UDS Data: Penetration (Combined)                   |                                                                          | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Total Population (%) (Combined)                      | Increase Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Total Population (%) (Combined)                      | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Low-Income (%) (Combined)                            | Increase Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Low-Income (%) (Combined)                            | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Uninsured Population (%) (Combined)                  | Increase Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Uninsured Population (%) (Combined)                  | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicaid/Public Ins. (%) (Combined)                  | Increase Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicaid/Public Ins. (%) (Combined)                  | Decrease Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicare/Private Ins. (%) (Combined)                 | Increase Transparency |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicare/Private Ins. (%) (Combined)                 | Decrease Transparency |
      | UDS Data: Health Center Characteristics (Combined) |                                                                          | Increase Transparency |
      | UDS Data: Health Center Characteristics (Combined) |                                                                          | Decrease Transparency |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Health Center Count 2021 (Combined)                                 | Increase Transparency |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Health Center Count 2021 (Combined)                                 | Decrease Transparency |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Dominant Health Center 2021 (Combined)                              | Increase Transparency |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Dominant Health Center 2021 (Combined)                              | Decrease Transparency |
      | UDS Data: Patient Mix (Combined)                   |                                                                          | Increase Transparency |
      | UDS Data: Patient Mix (Combined)                   |                                                                          | Decrease Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Uninsured (%) 2021 (Combined)                                       | Increase Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Uninsured (%) 2021 (Combined)                                       | Decrease Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicaid/Public Ins. (%) 2021 (Combined)                            | Increase Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicaid/Public Ins. (%) 2021 (Combined)                            | Decrease Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicare/ Private Ins. (%) 2021 (Combined)                          | Increase Transparency |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicare/ Private Ins. (%) 2021 (Combined)                          | Decrease Transparency |
      | U.S. Boundaries                                    |                                                                          | Increase Transparency |
      | U.S. Boundaries                                    |                                                                          | Decrease Transparency |
      | ZCTA                                               |                                                                          | Increase Transparency |
      | ZCTA                                               |                                                                          | Decrease Transparency |

  @manual
  Scenario Outline: Verify the Zoom to functionality on map layer list
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user hide the layer "<Layer>"
    Then user verify "<Layers>" should not be visible on map
    When user show the layer "<Layer>"
    Then user verify "<Layers>" should be visible on map
    When user expand the layer "<Layer>" in UDS mapping tool
    And user hide the layer "<Sub Layer>"
    Then user verify "<Sub Layer>" should not be visible on map
    When user show the layer "<Sub Layer>"
    Then user verify "<Sub Layers>" should be visible on map
    When user select the layer "<Sub Layer>" option as "<option>"
    And user click on Zoom to "<Sub Layer>"
    And verify Zoom to functionality is working

    Examples:
      | Layer                                              | Sub Layer                                                                | Option  |
      | Health Center Program Sites                        | Health Center Program Sites - Admin Only                                 | Zoom to |
      | Health Center Program Sites                        | Health Center Program Sites - Service Delivery Sites                     | Zoom to |
      | Health Center Program Look-Alike Sites             | Look-Alike Service Delivery Sites                                        | Zoom to |
      | Health Center Program Look-Alike Sites             | Look-Alike Administrative Only Sites                                     | Zoom to |
      | SAMHSA Facilities & Providers                      | DATA Waived Providers (SAMHSA)                                           | Zoom to |
      | SAMHSA Facilities & Providers                      | Mental Health Facility (SAMHSA)                                          | Zoom to |
      | SAMHSA Facilities & Providers                      | Opioid Treatment Program Facility (SAMHSA)                               | Zoom to |
      | SAMHSA Facilities & Providers                      | Substance Use Facility (SAMHSA)                                          | Zoom to |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Buildings                                                 | Zoom to |
      | Housing and Urban Development (HUD) Facilities     | Public Housing Developments                                              | Zoom to |
      | Other Health Facilities                            |                                                                          | Zoom to |
      | Dartmouth Boundaries                               | Hospital Referral Regions (HRRs)                                         | Zoom to |
      | Dartmouth Boundaries                               | Primary Care Service Areas (PCSAs)                                       | Zoom to |
      | Health Professional Shortage Areas (HPSAs)         |                                                                          | Zoom to |
      | Medically Underserved Areas/Populations (MUA/Ps)   |                                                                          | Zoom to |
      | Population Indicators                              | Pop: Disability (%) 2016-2020                                            | Zoom to |
      | Population Indicators                              | Pop: Adults With No Pneumonia Vaccine, Est. (%) 2018                     | Zoom to |
      | Population Indicators                              | Pop: Adults With No Flu Vaccine, Est. (%) 2018                           | Zoom to |
      | Population Indicators                              | Pop: Adults with No Dental Visit in Past Year, Est. (%) 2020             | Zoom to |
      | Population Indicators                              | Pop: Adults Who Smoke, Est. (%) 2020                                     | Zoom to |
      | Population Indicators                              | Pop: Adults Who Are Obese, Est. (%) 2020                                 | Zoom to |
      | Population Indicators                              | Pop: Adults with No Usual Source of Care, Est. (%) 2018                  | Zoom to |
      | Population Indicators                              | Pop: Adults Who Delayed/ Not Sought Care Due to High Cost, Est. (%) 2018 | Zoom to |
      | Population Indicators                              | Pop: Adults Who Are Binge Drinkers, Est. (%) 2020                        | Zoom to |
      | Population Indicators                              | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2020            | Zoom to |
      | Population Indicators                              | Pop: Adults Ever Told Have Diabetes, Est. (%) 2020                       | Zoom to |
      | Population Data: Age                               | Pop: Under 18 (%) 2017-2021                                              | Zoom to |
      | Population Data: Age                               | Pop: 18-64 (%) 2017-2021                                                 | Zoom to |
      | Population Data: Age                               | Pop: 65 and older (%) 2017-2021                                          | Zoom to |
      | Population Data: Poverty Level                     | Pop: Low-Income (%) 2016-2020                                            | Zoom to |
      | Population Data: Poverty Level                     | Pop: Poverty (%) 2016-2020                                               | Zoom to |
      | Population Data: Poverty and Insurance Trends      | Pop: Uninsured, Est. (%) 2020                                            | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: American Indian/ Alaska Native (%) 2017-2021                        | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Asian (%) 2017-2021                                                 | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Black (%) 2017-2021                                                 | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Hispanic/Latino (%) 2017-2021                                       | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Native Hawaiian (%) 2017-2021                                       | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Other Pacific Islander (%) 2017-2021                                | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: Racial/ Ethnic Minority (%) 2017-2021                               | Zoom to |
      | Population Data: Race/Ethnicity                    | Pop: White (%) 2017-2021                                                 | Zoom to |
      | Population Data: Social Environment                | Pop: Households With Limited English Proficiency (%) 2016-2020           | Zoom to |
      | Population Data: Social Environment                | Pop: Less Than High School Education (%) 2016-2020                       | Zoom to |
      | Population Data: Social Environment                | Pop: Not Employed (%) 2016-2020                                          | Zoom to |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Total Population (%) (Combined)                      | Zoom to |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Low-Income (%) (Combined)                            | Zoom to |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Uninsured Population (%) (Combined)                  | Zoom to |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicaid/Public Ins. (%) (Combined)                  | Zoom to |
      | UDS Data: Penetration (Combined)                   | HCP: Penetration of Medicare/Private Ins. (%) (Combined)                 | Zoom to |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Health Center Count 2021 (Combined)                                 | Zoom to |
      | UDS Data: Health Center Characteristics (Combined) | HCP: Dominant Health Center 2021 (Combined)                              | Zoom to |
      | UDS Data: Patient Mix (Combined)                   | HCP: Uninsured (%) 2021 (Combined)                                       | Zoom to |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicaid/Public Ins. (%) 2021 (Combined)                            | Zoom to |
      | UDS Data: Patient Mix (Combined)                   | HCP: Medicare/ Private Ins. (%) 2021 (Combined)                          | Zoom to |
      | UDS Data: Not Served by Health Centers (Combined)  | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2022         | Zoom to |
      | UDS Data: Not Served by Health Centers (Combined)  | HCP: Uninsured Not Served by Health Centers (#) 2022                     | Zoom to |
      | UDS Data: Not Served by Health Centers (Combined)  | HCP: Low-Income Not Served by Health Centers (#) 2022                    | Zoom to |
      | UDS Data: Not Served by Health Centers (Combined)  | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2022        | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 2-yr Change in Patients (%) 2020, 2022                              | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 1-yr Change in Patients (%) 2021, 2022                              | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 2-yr Change in Uninsured (%) 2020, 2022                             | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 1-yr Change in Uninsured (%) 2021, 2022                             | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 2-yr Change in Medicaid/ Public Ins.  (%) 2020, 2022                | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2021, 2022                 | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2020, 2022                | Zoom to |
      | UDS Data: Percent Change (Combined)                | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2021, 2022                | Zoom to |
      | U.S. Boundaries                                    |                                                                          | Zoom to |
      | ZCTA                                               |                                                                          | Zoom to |

  @HDWD-4318 @automatedGeocare @daily1
  Scenario: Verify the Add by file upload functionality for single zcta
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by file upload" option under draw on map
    And user click on 'Select File' and upload the file 'test_zcta_file.csv'
    Then Verify Zcta from 'test_zcta_file.csv' is displayed navigation panel

  #Then user verify uploaded zcta form file 'test_zcta_file.csv' is displayed in Selected ZCTA's navigation panel
  @HDWD-4318 @automatedGeocare @daily1
  Scenario: Verify the Add by file upload functionality for multiple zcta's
    When Click on "Get Started" button
    Then Navigation panel title is displayed as "Select your application type or select any option to continue:"
    And Select the application type "New Access Point Application"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by file upload" option under draw on map
    And user click on 'Select File' and upload the file 'test_zcta_Multiple_file.csv'
    Then Verify Zcta from 'test_zcta_Multiple_file.csv' is displayed navigation panel

  @Manual @HDWD-4354 @ignore
  Scenario: Verify the Map functionalities on the map
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on the particular point on the map
    Then details of the selected location should be shown on the popup
    And user verify Hours per week should be rounded to tenths

  #   And user click on the + sign on the map
  #   Then map should get zoomed in
  #   When user click on the - sign on the map
  #   Then map should get zoomed out
  @HDWD-4318
  Scenario: Verify the Paste functionality for single zcta
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on Draw on Map
    Then user verify Map Tool is loaded
    When user navigate to paste option
    And user paste the copied single zcta
    Then user verify pasted zcta is visible on map
    And user verify pasted zcta is in Selected ZCTA's navigation panel

  @HDWD-4318
  Scenario: Verify the Paste functionality for multiple zcta's
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on Draw on Map
    Then user verify Map Tool is loaded
    When user navigate to paste option
    And user paste the copied multiple zcta's
    Then user verify pasted zcta's are visible on map
    And user verify pasted zcta's are in Selected ZCTA's navigation panel

  @HDWD-4318
  Scenario Outline: Verify the By Distance Functionality
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on By Distance
    Then user verify By Distance module is loaded
    When user select Distance By Radius
    And user select measure by <Measure>
    Then ZCTA should get selected based on <Measure>
    And select ZCTA should be visible on map

    Examples:
      | Measure     |
      | By Time     |
      | By Distance |

  #When user select Distance Between Locations
  #Then Click on the map to add stops to the route.
  #And route from the last stop to the newly added stop is calculated.
  #Then if a stop is not reachable, the last valid point is set as the starting point
  #Then select ZCTA should be added to the navigational panel
  @HDWD-4565
  Scenario: QA Data Validation for MUA/Ps
    When user click on "Data Explorer" link under "Data" menu
    And user select "Medically Underserved Areas/Populations (MUA/P)" data source
    And user click on View Data
    Then user verify data table is loaded
    When user capture the number of records from UI excluding Withdrawn status
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_MUAP]" from table "[dbo].[UM_MUAP]" of Database "UDS_Mapper"
    And user verify number of records from UI and Query are same for total records
    When user capture the number of records from UI By Designation Type as "Designated"
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_MUAP] where MUA_STATUS_DESC = 'Designated' "[dbo].[UM_MUAP]" of Database "UDS_Mapper"
    And user verify number of records from UI and Query are same for Designation Type as "Designated"
    When user capture the number of records from UI By Designation Type as "Proposed For Withdrawal"
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_MUAP] where MUA_STATUS_DESC = 'Proposed for Withdrawal'"[dbo].[UM_MUAP]" of Database "UDS_Mapper"
    And user verify number of records from UI and Query are same for Designation Type as "Proposed For Withdrawal"

  @HDWD-4553
  Scenario: QA Data Validation for Rural Health Clinics
    When user click on "Data Reports" link under "Data" menu
    And user select "Centers for Medicare & Medicaid Services Facilities Report"
    And user select State as "All States/Territories"
    And user select Facility Type(s) as "Rural Health Clinic"
    And user click on Submit
    Then user verify data table is loaded
    When user capture the number of records from UI
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_RHC_SITES]" from table "[dbo].[UM_RHC_SITES]" of Database "UDS_Mapper"
    And user verify number of records from UI and Query are same

  @HDWD-4574
  Scenario: QA Data Validation for VHA Facilities
    When user click on "Dashboards" link under "Data" menu
    And user select "Health Sites"
    And user click on "Veterans Health Administration"
    Then user verify tableau is loaded
    When user capture the number of records from UI
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_VHA_SITES]" from table "[dbo].[UM_VHA_SITES]" of Database "UDS_Mapper"
    And user verify number of records from UI and Query are same
    When user click on "Health Sites Data Table"
    And user select Site Category as "Veterans Health Administration"
    Then user verify data table is loaded
    When user capture all the records from UI
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_VHA_SITES] " from table "[dbo].[UM_VHA_SITES]" of Database "UDS_Mapper"
    And user verify the values from UI and Query are same for all the records

  @HDWD-4573
  Scenario Outline: Verify two decimal places for percentage on Map Layers
    When user click on Legend option on the map
    And user click on "<Layer>" option
    And user click on '<SubLayer>' option
    And user click on any zcta on map
    Then user verify '<SubLayer>' value is exactly '2 decimal places'

    Examples:
      | Layer                                         | SubLayer                                                                 |
      | Population Indicators                         | Pop: Disability (%) 2017-2021                                            |
      | Population Indicators                         | Pop: Adults With No Pneumonia Vaccine, Est. (%) 2018                     |
      | Population Indicators                         | Pop: Adults With No Flu Vaccine, Est. (%) 2018                           |
      | Population Indicators                         | Pop: Adults with No Dental Visit in Past Year, Est. (%) 2020             |
      | Population Indicators                         | Pop: Adults Who Smoke, Est. (%) 2020                                     |
      | Population Indicators                         | Pop: Adults Who Are Obese, Est. (%) 2020                                 |
      | Population Indicators                         | Pop: Adults with No Usual Source of Care, Est. (%) 2018                  |
      | Population Indicators                         | Pop: Adults Who Delayed/ Not Sought Care Due to High Cost, Est. (%) 2018 |
      | Population Indicators                         | Pop: Adults Who Are Binge Drinkers, Est. (%) 2020                        |
      | Population Indicators                         | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2020            |
      | Population Indicators                         | Pop: Adults Ever Told Have Diabetes, Est. (%) 2020                       |
      | Population Data: Age                          | Pop: Under 18 (%) 2017-2021                                              |
      | Population Data: Age                          | Pop: 18-64 (%) 2017-2021                                                 |
      | Population Data: Age                          | Pop: 65 and older (%) 2017-2021                                          |
      | Population Data: Poverty Level                | Pop: Low-Income (%) 2017-2021                                            |
      | Population Data: Poverty Level                | Pop: Poverty (%) 2017-2021                                               |
      | Population Data: Poverty and Insurance Trends | Pop: Uninsured, Est. (%) 2020                                            |
      | Population Data: Poverty and Insurance Trends | Pop: 1-yr Change in Total Population (%) 2020, 2021                      |
      | Population Data: Poverty and Insurance Trends | Pop: 2-yr Change in Total Population (%) 2019, 2021                      |
      | Population Data: Poverty and Insurance Trends | Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2020, 2021          |
      | Population Data: Poverty and Insurance Trends | Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2019, 2021          |
      | Population Data: Poverty and Insurance Trends | Pop: Medicare/ Private Ins., Est. (%) 2021                               |
      | Population Data: Poverty and Insurance Trends | Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2020, 2021           |
      | Population Data: Poverty and Insurance Trends | Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2019, 2021           |
      | Population Data: Poverty and Insurance Trends | Pop: Medicaid/ Public Ins., Est. (%) 2021                                |
      | Population Data: Poverty and Insurance Trends | Pop: 1-yr Change in Uninsured, Est. (%) 2020, 2021                       |
      | Population Data: Poverty and Insurance Trends | Pop: 2-yr Change in Uninsured, Est. (%) 2019, 2021                       |
      | Population Data: Race/Ethnicity               | Pop: American Indian/ Alaska Native (%) 2017-2021                        |
      | Population Data: Race/Ethnicity               | Pop: Asian (%) 2017-2021                                                 |
      | Population Data: Race/Ethnicity               | Pop: Black (%) 2017-2021                                                 |
      | Population Data: Race/Ethnicity               | Pop: Hispanic/Latino (%) 2017-2021                                       |
      | Population Data: Race/Ethnicity               | Pop: Native Hawaiian (%) 2017-2021                                       |
      | Population Data: Race/Ethnicity               | Pop: Other Pacific Islander (%) 2017-2021                                |
      | Population Data: Race/Ethnicity               | Pop: Racial/ Ethnic Minority (%) 2017-2021                               |
      | Population Data: Race/Ethnicity               | Pop: White (%) 2017-2021                                                 |
      | Population Data: Social Environment           | Pop: Households With Limited English Proficiency (%) 2017-2021           |
      | Population Data: Social Environment           | Pop: Less Than High School Education (%) 2017-2021                       |
      | Population Data: Social Environment           | Pop: Not Employed (%) 2017-2021                                          |
      | UDS Data: Penetration (Combined)              | HCP: Penetration of Total Population (%) (Combined)                      |
      | UDS Data: Penetration (Combined)              | HCP: Penetration of Low-Income (%) (Combined)                            |
      | UDS Data: Penetration (Combined)              | HCP: Penetration of Uninsured Population (%) (Combined)                  |
      | UDS Data: Penetration (Combined)              | HCP: Penetration of Medicaid/Public Ins. (%) (Combined)                  |
      | UDS Data: Penetration (Combined)              | HCP: Penetration of Medicare/Private Ins. (%) (Combined)                 |
      | UDS Data: Patient Mix (Combined)              | HCP: Uninsured (%) 2021 (Combined)                                       |
      | UDS Data: Patient Mix (Combined)              | HCP: Medicaid/Public Ins. (%) 2021 (Combined)                            |
      | UDS Data: Patient Mix (Combined)              | HCP: Medicare/ Private Ins. (%) 2021 (Combined)                          |
      | UDS Data: Percent Change (Combined)           | HCP: 2-yr Change in Patients (%) 2020, 2022                              |
      | UDS Data: Percent Change (Combined)           | HCP: 1-yr Change in Patients (%) 2021, 2022                              |
      | UDS Data: Percent Change (Combined)           | HCP: 2-yr Change in Uninsured (%) 2020, 2022                             |
      | UDS Data: Percent Change (Combined)           | HCP: 1-yr Change in Uninsured (%) 2021, 2022                             |
      | UDS Data: Percent Change (Combined)           | HCP: 2-yr Change in Medicaid/ Public Ins.  (%) 2020, 2022                |
      | UDS Data: Percent Change (Combined)           | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2021, 2022                 |
      | UDS Data: Percent Change (Combined)           | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2020, 2022                |
      | UDS Data: Percent Change (Combined)           | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2021, 2022                |

  @HDWD-4594
  Scenario: QA Data Validation for UDS Data
    When user click on "Data" link under "Data Explorer" menu
    And user select "Health Center Program Sites"
    And user select "Administrative Sites"
    And user click on View Data
    Then user verify data table is loaded
    When user capture the number of records from UI excluding Administrative/Service Delivery Site
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_HCADMIN_SITES_UDS_330]" from table "[dbo].[UM_HCADMIN_SITES_UDS_330]" of database "UDS_Mapper"
    And user capture the number of records returned from query
    Then user verify number of records from UI and Query are same
    And user select "Look-Alike Administrative Sites"
    And user click on View Data
    Then user verify data table is loaded
    When user capture the number of records from UI
    And execute DB Query "SELECT * FROM [UDS_Mapper].[dbo].[UM_HCADMIN_SITES_UDS_LAL]" from table "[dbo].[UM_HCADMIN_SITES_UDS_LAL]" of database "UDS_Mapper"
    And user capture the number of records returned from query
    Then user verify number of records from UI and Query are same

  @HDWD-4567
  Scenario Outline: Verify data inside map data points
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on legend option on the map
    And user click on "<Layer>" option map layers
    And user click on "<Sub Layer>" option map layers
    And user click on any point on map
    Then user verify data selected contains below points

    Examples:
      | Layer                                          | Sub Layer                     |
      | Housing and Urban Development (HUD) Facilities | Choice Neighbourhood Grantees |

  @HDWD-4467
  Scenario: Verify the site data using upload using wrong data functionality
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click start on Add Service Deliver Sites
    And user click on Select A File
    And user upload "Data1.csv" file
    And user select wrong column data for each option
    Then verify user is getting an error of invalid data

  @HDWD-4468
  Scenario: Verify the site data using upload using matching 1-3 data points functionality
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click start on Add Service Deliver Sites
    And user click on Select A File
    And user upload "Data1.csv" file which as 1-3 matching data points
    And user select column data for each option
    Then verify data gets uploaded successfully

  @HDWD-4469
  Scenario: Verify the site data using upload using matching 4-6 data points functionality
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click start on Add Service Deliver Sites
    And user click on Select A File
    And user upload "Data1.csv" file which as 4-6 matching data points
    And user select column data for each option
    Then verify user is getting an error and file is not uploaded

  @HDWD-4472
  Scenario Outline: Verify the site data search in upload screen on Add Service Deliver Sites
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click start on Add Service Deliver Sites
    And user search the "<Input>" in search bar
    Then user verify searched data should be visible on the list
    And user click on the searched data
    Then selected data should be visible on the map

    Examples:
      | Input             |
      | Name              |
      | Address, Zip Code |
      | ZCTA              |

  @HDWD-4509
  Scenario Outline: Verify the multiple ZCTA select and deselect service area functionality using Draw on Map tool
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on Draw on Map
    And user selects single "<zcta1>" ZCTA on the map using filter by point
    Then selected "<zcta1>" zcta should display in the navigation panel
    And user selects single "<zcta2>" ZCTA on the map using filter by line
    And there should be visual indication on the map for "<zcta1>"
    And there should be visual indication on the map for "<zcta2>"
    When user deselects the single "<zcta1>" ZCTA on the map
    Then selected "<zcta1>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta1>"
    And map view should not move to deselected area
    And user selects single "<zcta2>" ZCTA on the map using filter by polygon
    And there should be visual indication on the map for "<zcta1>"
    And there should be visual indication on the map for "<zcta2>"
    When user deselects the single "<zcta1>" ZCTA on the map
    Then selected "<zcta1>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta1>"
    And map view should not move to deselected area
    And user selects single "<zcta2>" ZCTA on the map using Add by search
    And there should be visual indication on the map for "<zcta1>"
    And there should be visual indication on the map for "<zcta2>"
    When user deselects the single "<zcta1>" ZCTA on the map
    Then selected "<zcta1>" zcta should be removed in the navigation panel
    And there should not be visual indication on the map for "<zcta1>"
    And map view should not move to deselected area

    Examples:
      | application type             | zcta1 | zcta2 |
      | New access point application | 23060 | 23097 |

  @HDWD-4568
  Scenario Outline: Data Validation for FTE provider count for NHSC Sites
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on legend option on the map
    And user click on "<Menu>" option map layers
    And user click on "<Sub Menu>" option map layers
    And user click on any data point on the map
    Then user verify pop up is loaded
    When user capture the data from UI
    And execute DB Query " Query: SELECT * FROM [UDS_Mapper].[dbo].[UM_NHSC_SITES] where SITE_NM = '<Site Name>'" from table "[dbo].[UM_NHSC_SITES]" of database "UDS_Mapper"
    And user capture the data returned from query
    Then user verify data for provider count from UI and Query are same

    Examples:
      | Menu                    | Sub Menu                                   | Site Name                               |
      | Other Health Facilities | National Health Service Corps (NHSC) Sites | Unity Health Care- CommUnity Connection |
      | Other Health Facilities | National Health Service Corps (NHSC) Sites | Riverside Warsaw Medical Arts           |

  @HDWD-4471
  Scenario: Verify to Cancel and enable user to start over using Select a File functionality on Add Service Delivery Sites
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on start in Add Service Delivery Sites
    And user click on Select a File
    And user upload "Data1.csv" file
    Then verify below fields are visible
      | Match Your Fields |
      | Address           |
      | City              |
      | State             |
      | Zip Code          |
      | Site Name         |
      | Site Type         |
    When user click on Cancel button
    Then verify file upload should get reset and user should be able to start over

    #1273-1280
  @HDWD-4314 @automatedGeocare @dataverificationPending
  Scenario Outline: Verify the Display ZCTA's selection in attribute table for NAP application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    And Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    And Click on "View Data Table" button
    # When user click on caret symbol in the bottom of the Geocare map
    Then data table should be loaded with data for Columns for selected '<zcta>' ZCTA
      # | Columns                                  |
      | ZCTA                                                |
      | Pop: Total (#) 2019-2023                            |
      | Pop: Below 200% Federal Poverty Level (#) 2018-2022 |
      | HCP: Penetration of Total Population (%) 2024       |
      | HCP: Penetration of Low-Income (%) 2024             |
      | HCP: Total Patients (#) 2024                        |
      | HCP: Health Center Count 2024                       |
      | HCP: Dominant Health Center 2024                    |

    #  When DB Query "SELECT ZCTA_CODE,TOT_GRANTEES_COMB, DOM1_NAME_COMB, ACS_ZCTA_POP_TOTAL,ACSG_200FPL_POP,USERS_ALL_COMB, PEN_LOWI_COMB,PEN_TP_COMB, UNSRVD_UNINSURED_COMB  FROM [UDS_Mapper].[dbo].[UM_ZCTA] where ZCTA_CODE in <ZCTA>" from table "[dbo].[UM_ZCTA]" of database "[UDS_Mapper]" is executed
    # And user verify all the columns data is shown in UI is same as from Query executed
    #And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected
    #Then user remove some of the "<ZCTA>" ZCTA
    #And user verify the deselected "<ZCTA>" ZCTA are removed from the map and Data table
    #And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected
    Examples:
      | application_type             | zcta  |
      | New Access Point Application | 22102 |

 #1291-1312
  @HDWD-4537 @automatedGeocare_pending
  Scenario Outline: Verify the View optional columns in the data table for NAP
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search '<zcta>' ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta '<zcta>'
    Then selected '<zcta>' ZCTA should display in the navigation panel
    And Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    And Click on "View Data Table" button
    And Add the optional column on data table
      | Column                                                         |
      | Pop: Low Birthweight (%) 2022                                  |
      | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022 |
    Then data table should be loaded with data for optional Columns for selected '<zcta>' ZCTA
      | Pop: Low Birthweight (%) 2022                                  |
      | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022 |

    #When DB Query "SELECT ZCTA_CODE, Z_PopUninsured, TP_Uninsured FROM [UDS_Mapper].[dbo].[UM_ZCTA] where ZCTA_CODE in <ZCTA>" from table "[dbo].[UM_ZCTA]" of database "[UDS_Mapper]" is executed
    #And user verify all the columns data is shown in UI is same as from Query executed
    #And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected
    #Then user remove some of the "<ZCTA>" ZCTA
    #And user verify the deselected "<ZCTA>" ZCTA are removed from the map and Data table
    #And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected
    Examples:
      | application_type             | zcta  |
      #     | New Access Point Application | 22102, 20007 |
      | New Access Point Application | 22102 |

    #try from here
  @HDWD-4538 @Duplicate4537
  Scenario Outline: Verify the View optional All-Cause Mortality Data at ZCTA level in the data table for NAP application
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user click on Draw on Map
    And user select multiple "<ZCTA>" ZCTA on the map
    Then selected "<ZCTA>" ZCTA should be displayed in the navigation panel
    And there should be visual indication on the map for selected "<ZCTA>" ZCTA
    When user click on caret symbol in the bottom of the map
    Then data table should be loaded with data for Columns for selected "<ZCTA>" ZCTA
      | Columns                           |
      | Age-Adjusted Mortality Percentage |
      | Age-Adjusted Mortality Rate       |
    When DB Query "SELECT ZCTA_CODE, CDCVS_ADJMORT_PCT, CDCVS_AGEMORT_RTs FROM [UDS_Mapper].[dbo].[UM_ZCTA] where ZCTA_CODE in <ZCTA>" from table "[dbo].[UM_ZCTA]" of database "[UDS_Mapper]" is executed
    And user verify all the columns data is shown in UI is same as from Query executed
    And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected
    Then user remove some of the "<ZCTA>" ZCTA
    And user verify the deselected "<ZCTA>" ZCTA are removed from the map and Data table
    And user verify the sum of each column from UI is auto calculated based on number of ZCTA selected

    Examples:
      | Application Type             | ZCTA         |
      | New Access Point Application | 22102, 20007 |

  @HDWD-4623
  Scenario Outline: Verify the maintain individual sites added using search
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user search single "<zcta1>" ZCTA
    And click on "Add to Map" for "<Zcta1>"
    Then there should be "<Zcta1>" available in MyData
    And click on "<Zcta1>" check box in MyData
    And there should be visual indication on the map for "<zcta1>"
    When user search single "<zcta2>" ZCTA
    And click on "Add to Map" for "<Zcta2>"
    Then there should be "<Zcta2>" available in MyData
    And click on "<Zcta2>" check box in MyData
    And there should be visual indication on the map for "<zcta2>"

    Examples:
      | application type             | zcta1 | zcta2 |
      | New access point application | 23060 | 23097 |

  @HDWD-4476
  Scenario Outline: Verify User Entered Data and taken to site location on map
    Given user navigates to " Health Center Program GeoCare Navigator" dashboard
    When user search single "<zcta1>" ZCTA
    Then there should be visual indication on the map for "<zcta1>"
    And user clicks on go to location for "<zcta1>"
    Then user verify map navigate and zoom in to zcta location

    Examples:
      | application type             | zcta1 |
      | New access point application | 23060 |

  Scenario Outline: Verify review map and data table for all applications for new access point application
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    And user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    When Click on "Add Service Delivery Sites" button
    And user enter address site as "The White House"
    And user click Add for address site "The White House"
    When Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    When Click on "View Data Table" button
    Then user verify the ZCTA in grid is "<zcta>"
    #1402-1409
    And data table should be loaded with data for Columns for selected '<zcta>' ZCTA
      | ZCTA                                                |
      | Pop: Total (#) 2019-2023                            |
      | Pop: Below 200% Federal Poverty Level (#) 2018-2022 |
      | HCP: Penetration of Total Population (%) 2024       |
      | HCP: Penetration of Low-Income (%) 2024             |
      | HCP: Total Patients (#) 2024                        |
      | HCP: Health Center Count 2024                       |
      | HCP: Dominant Health Center 2024                    |
    When user clicks on button "Selected Sites"
    Then user verify the selected sites in grid is "The White House"
    And data table should be loaded with data for Columns for selected 'The White House' ZCTA
      | Site Name |
      | Address   |
      | City      |
      | State     |
      | ZIP Code  |
      | Site Type |
    When Click on "Export or Print" button
    And verifies print report option as
      | Map and Legend   |
      | Data Table       |
      | Site Information |
      | Additional Notes |
    And user click on "Data Table" option on print report
    And user click on "Site Information" option on print report
    And user click on "Additional Notes" option on print report
    And user enter additional notes as "Automation notes"
    And user selects titlename "<FileName>" page setup "<Page Setup>" and file format "<Type>"
    Then user verify the "<FileName>" downloaded in DownloadDir
    When user close the print popup
  #1435,36
    Examples:
      | application_type             | zcta  | Page Setup | Type    | FileName                   |
      | New Access Point Application | 28277 | Portrait   | PDF     | PDF Export5.pdf            |
      | New Access Point Application | 28277 | Portrait   | GeoJSON | exported_graphics5.geojson |

  Scenario Outline: Verify review map and data table for all applications Change in Scope Request
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    And user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    When Click on "Add Service Delivery Sites" button
    And user enter address site as "The White House"
    And user click Add for address site "The White House"
    When Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    When Click on "View Data Table" button
    Then user verify the ZCTA in grid is "<zcta>"
    #1455-1465
    And data table should be loaded with data for Columns for selected '<zcta>' ZCTA
      | ZCTA                                                      |
      | Pop: Total (#) 2019-2023                                  |
      | Pop: Below 200% Federal Poverty Level (#) 2018-2022       |
      | HCP: Penetration of Total Population (%) 2024             |
      | HCP: Penetration of Low-Income (%) 2024                   |
      | HCP: Total Patients (#) 2024                              |
      | HCP: Health Center Count 2024                             |
      | HCP: Uninsured Not Served by Health Centers (#) 2024      |
      | HCP: Dominant Health Center 2024                          |
      | HCP: #1 Dominant Health Center Share of Patients (%) 2024 |
      | HCP: Low-Income Not Served by Health Centers (#) 2024     |
    When user clicks on button "Selected Sites"
    Then user verify the selected sites in grid is "The White House"
    And data table should be loaded with data for Columns for selected 'The White House' ZCTA
      | Site Name |
      | Address   |
      | City      |
      | State     |
      | ZIP Code  |
      | Site Type |
    When Click on "Export or Print" button
    And verifies print report option as
      | Map and Legend   |
      | Data Table       |
      | Site Information |
      | Additional Notes |
    And user click on "Data Table" option on print report
    And user click on "Site Information" option on print report
    And user click on "Additional Notes" option on print report
    And user enter additional notes as "Automation notes"
    And user selects titlename "<FileName>" page setup "<Page Setup>" and file format "<Type>"
    Then user verify the "<FileName>" downloaded in DownloadDir
    When user close the print popup
    #1491-92
    Examples:
      | application_type        | zcta  | Page Setup | Type    | FileName                   |
      | Change in Scope Request | 28277 | Portrait   | GeoJSON | exported_graphics1.geojson |
      | Change in Scope Request | 28277 | Landscape  | PDF     | PDF Export1.pdf            |

  Scenario Outline: Verify review map and data table for all applications
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    And user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    When Click on "Add Service Delivery Sites" button
    And user enter address site as "The White House"
    And user click Add for address site "The White House"
    When Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    When Click on "View Data Table" button
    Then user verify the ZCTA in grid is "<zcta>"
    #1510-1519
    And data table should be loaded with data for Columns for selected '<zcta>' ZCTA
      | ZCTA                                                 |
      | Pop: Total (#) 2019-2023                             |
      | Pop: Below 200% Federal Poverty Level (#) 2018-2022  |
      | HCP: Penetration of Total Population (%) 2024        |
      | HCP: Penetration of Low-Income (%) 2024              |
      | HCP: Total Patients (#) 2024                         |
      | HCP: Health Center Count 2024                        |
      | HCP: Uninsured Not Served by Health Centers (#) 2024 |
      | HCP: Dominant Health Center 2024                     |
    When user clicks on button "Selected Sites"
    Then user verify the selected sites in grid is "The White House"
    And data table should be loaded with data for Columns for selected 'The White House' ZCTA
      | Site Name |
      | Address   |
      | City      |
      | State     |
      | ZIP Code  |
      | Site Type |
    When Click on "Export or Print" button
    And verifies print report option as
      | Map and Legend   |
      | Data Table       |
      | Site Information |
      | Additional Notes |
    And user click on "Data Table" option on print report
    And user click on "Site Information" option on print report
    And user click on "Additional Notes" option on print report
    And user enter additional notes as "Automation notes"
    And user selects titlename "<FileName>" page setup "<Page Setup>" and file format "<Type>"
    Then user verify the "<FileName>" downloaded in DownloadDir
    When user close the print popup

    Examples:
      | application_type                     | zcta  | Page Setup | Type    | FileName                  |
      | Service Area Competition Application | 28277 | Portrait   | GeoJSON | exported_graphics.geojson |
      | Look-Alike Application               | 28277 | Portrait   | PDF     | PDF Export3.pdf           |

  @HDWD-4468
  Scenario Outline: Verify the site data using upload using wrong file type functionality
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Add Service Delivery Sites'
    And user verify uploaded service delivery sites file "<fileName>" is displayed in Selected ZCTA's navigation panel
    Then user verify validation message as "Invalid File Type, File Type Must Be CSV."

    Examples:
      | application_type                     | fileName                             |
      | New Access Point Application         | InvalidServiceDeliverySitesFile.xlsx |
      | Service Area Competition Application | InvalidServiceDeliverySitesFile.xlsx |
      | Look-Alike Application               | InvalidServiceDeliverySitesFile.xlsx |
      | Change in Scope Request              | InvalidServiceDeliverySitesFile.xlsx |

  @HDWD-4467 @geocare
  Scenario Outline: Verify the site data using upload functionality
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Add Service Delivery Sites'
    And user verify uploaded service delivery sites file "<fileName>" is displayed in Selected ZCTA's navigation panel
    And user match the fields name from csv to application as below
      | ADDRESS   | Address   |
      | CITY      | City      |
      | STATE     | State     |
      | ZIP CODE  | ZIP Code  |
      | SITE NAME | Site Name |
      | SITE TYPE | Site Type |
    And user enter delivery site title as "Automation Test"
    And user clicks on button "Upload Now"
    Then created site should be visible on the ZCTA panel as "Automation Test"
    When user expand the bottom panel
    And user clicks on button "Selected Sites"
    And user read csv file "<fileName>" from upload data
    And user read the grid data of delivery site
    Then user verify grid data and uploaded data same for delivery site
#line 1589-92
    Examples:
      | application_type                     | fileName                          |
      | New Access Point Application         | ValidServiceDeliverySitesFile.csv |
      | Service Area Competition Application | ValidServiceDeliverySitesFile.csv |
      | Look-Alike Application               | ValidServiceDeliverySitesFile.csv |
      | Change in Scope Request              | ValidServiceDeliverySitesFile.csv |

  @DBverification
  Scenario Outline: Verify the zcta grid data with db
    When Click on "Get Started" button
    And Select the application type "<application_type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for "<zcta>"
    And user click Add for zcta "<zcta>"
    Then selected "<zcta>" ZCTA should display in the navigation panel
    When user expand the bottom panel
    And user clicks on button "ZCTA Table"
    And user selects "Combined" value in zcta table
    And user read the grid data of zcta
    And user get "Combined" grid data from db for application "<application_type>" for "<zcta>"
    Then user verify grid data and db data same for zcta grid
    And user selects "Awardees" value in zcta table
    And user read the grid data of zcta
    And user get "Awardees" grid data from db for application "<application_type>" for "<zcta>"
    Then user verify grid data and db data same for zcta grid
    And user selects "LookAlikes" value in zcta table
    And user read the grid data of zcta
    And user get "LookAlike" grid data from db for application "<application_type>" for "<zcta>"
    Then user verify grid data and db data same for zcta grid

    Examples:
      | application_type                     | zcta  |
      | New Access Point Application         | 79764 |
      | Service Area Competition Application | 28277 |
      | Look-Alike Application               | 23060 |
      | Change in Scope Request              | 79764 |

  #1627-
  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Upload a File
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on 'Add by file upload' geometry button
    Then User see requirement list under paragraph 'Upload a CSV file with the ZCTAs you would like to add to your service area.'
      | Parent_Required_Information                |
      | CSV File Format                            |
      | Include column header for your ZCTAs       |
      | Include each ZCTA record as a separate row |
    And User see verify the paragraph 'If you have ZIP Codes, please reference the ZIP Code to ZCTA Crosswalk documentation found under resources to find the aligned ZCTA for each ZIP Code.'
    And User see verify the paragraph 'Input your ZIP Codes or ZCTAs to create your service area.'
    Examples:
      | Application_Type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |

  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Add by search
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on 'Add by search' geometry button
    Then User see verify the paragraph 'Search for a ZCTA using the search bar.'
    And User see verify the paragraph 'Input your ZIP Codes or ZCTAs to create your service area.'
    Examples:
      | Application_Type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |

  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Filter by polygon and Line
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on '<Geometry>' geometry button
    Then User see verify the paragraph 'Use the drawing tools to draw a border around the ZCTAs in your service area.'
    And User see verify the paragraph 'Input your ZIP Codes or ZCTAs to create your service area.'

    Examples:
      | Application_Type                     | Geometry          |
      | New Access Point Application         | Filter by line    |
      | New Access Point Application         | Filter by polygon |
      | Service Area Competition Application | Filter by line    |
      | Service Area Competition Application | Filter by polygon |
      | Look-Alike Application               | Filter by line    |
      | Look-Alike Application               | Filter by polygon |
      | Change in Scope Request              | Filter by line    |
      | Change in Scope Request              | Filter by polygon |


  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Filter by point
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And User click on 'Filter by point' geometry button
    When user click on middle of map for geocare
    Then User see verify the paragraph 'Select a single ZCTA on the map to add it to your service area. You can add more ZCTAs by continuing to select one at a time.'
    And User see verify the paragraph 'Input your ZIP Codes or ZCTAs to create your service area.'

    Examples:
      | Application_Type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |

  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Add Service Delivery Sites
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Add Service Delivery Sites'
    Then User see verify the paragraph 'Existing service delivery sites are required to be shown in the application. These are turned on by default for this application.'
    And User see requirement list under paragraph 'To add a new site or sites to the map, either upload a CSV file with your site information and addresses or use the search bar below.'
      | Parent_Required_Information |
      | Column 1: Address           |
      | Column 2: City              |
      | Column 3: State             |
      | Column 4: ZIP Code          |
      | Column 5: Site Name         |
      | Column 6: Site Type         |
    And User see verify the paragraph 'After you have uploaded your file, you will be prompted to name the file and to ensure your fields align with the column headers that will appear in the data table.'
    And User see the "Select A File" span button
    Examples:
      | Application_Type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |

  @HDWD-4317 @testUDS @automatedGeocare
  Scenario Outline: Verify User should be able access Review Map and Data Table
    When Click on "Get Started" button
    And Select the application type "<Application_Type>"
    And Click on "Continue" button
    And User click on 'Start' for 'Review Map and Data Table'
    Then User see verify the paragraph 'View the data table for your ZCTAs and selected sites. You can also export or print your map and data table.'
    And User see the "View Data Table" button
    And User see the "Export or Print" button
    Examples:
      | Application_Type                     |
      | New Access Point Application         |
      | Service Area Competition Application |
      | Look-Alike Application               |
      | Change in Scope Request              |
 #1756
  Scenario: Verify the Ask Questions on footer
    When user click on "Ask Questions" link
    And user switch to child window
    Then verify application navigated to url "https://www.hrsa.gov/about/contact"

  Scenario: Verify the Viewers & Players on footer
    When user click on "Viewers & Players" link
    And user switch to child window
    Then verify application navigated to url "https://www.hhs.gov/web/policies-and-standards/hhs-web-policies/plugins/index.html"

  Scenario: Verify the Privacy Policy on footer
    When user click on "Privacy Policy" link
    And user switch to child window
    Then verify application navigated to url "https://www.hhs.gov/web/policies-and-standards/hhs-web-policies/privacy/index.html"

  Scenario: Verify the Disclaimers on footer
    When user click on "Disclaimers" link
    And user switch to child window
    Then verify application navigated to url "https://www.hhs.gov/web/policies-and-standards/hhs-web-policies/disclaimer/index.html"

  Scenario: Verify the Vulnerability Disclosure Policy on footer
    When user click on "Vulnerability Disclosure Policy" link
    And user switch to child window
    Then verify application navigated to url "https://www.hhs.gov/vulnerability-disclosure-policy/index.html"

  Scenario: Verify the Accessibility on footer
    When user click on "Accessibility" link
    And user switch to child window
    Then verify application navigated to url "https://www.hrsa.gov/about/508-resources"

  Scenario: Verify the FOIA on footer
    When user click on "FOIA" link
    And user switch to child window
    Then verify application navigated to url "https://www.hrsa.gov/foia"

  Scenario: Verify the HHS.gov on footer
    When user click on "HHS.gov" link
    And user switch to child window
    Then verify application navigated to url "https://www.hhs.gov/"

  Scenario: Verify the HRSA.gov on footer
    When user click on "HRSA.gov" link
    And user switch to child window
    Then verify application navigated to url "https://www.hrsa.gov/"

  Scenario: Verify the USA.gov on footer
    When user click on "USA.gov" link
    And user switch to child window
    Then verify application navigated to url "https://www.usa.gov/"

  Scenario: Verify the Whitehouse.gov on footer
    When user click on "Whitehouse.gov" link
    And user switch to child window
    Then verify application navigated to url "https://www.whitehouse.gov/"

  Scenario: Verify the Resources on header
    When user click on "Resources" link
    And user switch to child window
    Then verify application navigated to url "https://data.hrsa.gov/GeoCareNavigator/Resources"

  Scenario Outline: Verify the Legend Functionality for New Access Point Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Legend" option on the map
    Then user verify the legend data for UDS Mapper Tool
      | Health Center Program Sites                      |
      | Health Center Service Delivery Sites             |
      | Health Center Program Look-Alike Sites           |
      | Look-Alike Service Delivery Sites                |
      | Other Health Facilities                          |
      | Hospitals                                        |
      | Rural Health Clinics (RHCs)                      |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | U.S. Boundaries                                  |
    And user verify the legend sub data for layer "Hospitals"
      | Critical Access Hospitals |
      | Short Term                |
      | Other                     |
    And user verify the legend sub data for layer "Medically Underserved Areas/Populations (MUA/Ps)"
      | Medically Underserved Area                              |
      | Medically Underserved Population                        |
      | Medically Underserved Area – Governor’s Exception       |
      | Medically Underserved Population – Governor’s Exception |
    Examples:
      | application_type             | zcta  |
      | New Access Point Application | 22102 |


  Scenario Outline: Verify the Legend Functionality Service Area Competition Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Legend" option on the map
    Then user verify the legend data for UDS Mapper Tool
      | Health Center Program Look-Alike Sites           |
      | Look-Alike Service Delivery Sites                |
      | Other Health Facilities                          |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | U.S. Boundaries                                  |
    And user verify the legend sub data for layer "Medically Underserved Areas/Populations (MUA/Ps)"
      | Medically Underserved Area                              |
      | Medically Underserved Population                        |
      | Medically Underserved Area – Governor’s Exception       |
      | Medically Underserved Population – Governor’s Exception |
    Examples:
      | application_type                     | zcta  |
      | Service Area Competition Application | 22102 |

  Scenario Outline: Verify the Legend Functionality for Look Alike Appplication
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Legend" option on the map
    Then user verify the legend data for UDS Mapper Tool
      | Health Center Program Sites                      |
      | Health Center Service Delivery Sites             |
      | Health Center Administrative Only Sites          |
      | Health Center Program Look-Alike Sites           |
      | Look-Alike Service Delivery Sites                |
      | Look-Alike Administrative Only Sites             |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | U.S. Boundaries                                  |
    And user verify the legend sub data for layer "Medically Underserved Areas/Populations (MUA/Ps)"
      | Medically Underserved Area                              |
      | Medically Underserved Population                        |
      | Medically Underserved Area – Governor’s Exception       |
      | Medically Underserved Population – Governor’s Exception |
    Examples:
      | application_type       | zcta  |
      | Look-Alike Application | 22102 |

  Scenario Outline: Verify the Legend Functionality for Change in Scope Request
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Legend" option on the map
    Then user verify the legend data for UDS Mapper Tool
      | Health Center Program Sites                      |
      | Health Center Service Delivery Sites             |
      | Health Center Program Look-Alike Sites           |
      | Look-Alike Service Delivery Sites                |
      | Housing and Urban Development (HUD) Facilities   |
      | Public Housing Developments                      |
      | Other Health Facilities                          |
      | Hospitals                                        |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | Medically Underserved Areas/Populations (MUA/Ps) |
      | U.S. Boundaries                                  |
    And user verify the legend sub data for layer "Hospitals"
      | Critical Access Hospitals |
      | Short Term                |
      | Other                     |
    And user verify the legend sub data for layer "Medically Underserved Areas/Populations (MUA/Ps)"
      | Medically Underserved Area                              |
      | Medically Underserved Population                        |
      | Medically Underserved Area – Governor’s Exception       |
      | Medically Underserved Population – Governor’s Exception |
    Examples:
      | application_type        | zcta  |
      | Change in Scope Request | 22102 |


  Scenario Outline: Verify the Population & UDS Layers Functionality for Change in Scope Request
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type        | zcta  | Population      | Layer                                                           |
      | Change in Scope Request | 22102 | Population Data | Pop: Below 200% Federal Poverty Level (%) 2018-2022             |
      | Change in Scope Request | 22102 | Population Data | Pop: Unemployment (%) 2018-2022                                 |
      | Change in Scope Request | 22102 | Population Data | Pop: No High School Diploma, 25+ (%) 2018-2022                  |
      | Change in Scope Request | 22102 | Population Data | Pop: White (%) 2019-2023                                        |
      | Change in Scope Request | 22102 | Population Data | Pop: Racial/ Ethnic Minority (%) 2019-2023                      |
      | Change in Scope Request | 22102 | Population Data | Pop: Other Pacific Islander (%) 2019-2023                       |
      | Change in Scope Request | 22102 | Population Data | Pop: Native Hawaiian (%) 2019-2023                              |
      | Change in Scope Request | 22102 | Population Data | Pop: Hispanic/Latino (%) 2019-2023                              |
      | Change in Scope Request | 22102 | Population Data | Pop: Black (%) 2019-2023                                        |
      | Change in Scope Request | 22102 | Population Data | Pop: Asian (%) 2019-2023                                        |
      | Change in Scope Request | 22102 | Population Data | Pop: American Indian/ Alaska Native (%) 2019-2023               |
      | Change in Scope Request | 22102 | Population Data | Pop: 2-yr Change in Uninsured, Est. (%) 2021, 2023              |
      | Change in Scope Request | 22102 | Population Data | Pop: 1-yr Change in Uninsured, Est. (%) 2022, 2023              |
      | Change in Scope Request | 22102 | Population Data | Pop: Medicaid/ Public Ins., Est. (%) 2023                       |
      | Change in Scope Request | 22102 | Population Data | Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023  |
      | Change in Scope Request | 22102 | Population Data | Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2022, 2023  |
      | Change in Scope Request | 22102 | Population Data | Pop: Medicare/ Private Ins., Est. (%) 2023                      |
      | Change in Scope Request | 22102 | Population Data | Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023 |
      | Change in Scope Request | 22102 | Population Data | Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2022, 2023 |
      | Change in Scope Request | 22102 | Population Data | Pop: 2-yr Change in Total Population (%) 2021, 2023             |
      | Change in Scope Request | 22102 | Population Data | Pop: 1-yr Change in Total Population (%) 2022, 2023             |
      | Change in Scope Request | 22102 | Population Data | Pop: Uninsured, Est. (%) 2023                                   |
      | Change in Scope Request | 22102 | Population Data | Pop: Below Federal Poverty Level (%) 2018-2022                  |
      | Change in Scope Request | 22102 | Population Data | Pop: 65 and Older (%) 2019-2023                                 |
      | Change in Scope Request | 22102 | Population Data | Pop: 18-64 (%) 2019-2023                                        |
      | Change in Scope Request | 22102 | Population Data | Pop: Under 18 (%) 2019-2023                                     |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults Ever Told Have Diabetes, Est. (%) 2022              |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2021   |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults Who Are Binge Drinkers, Est. (%) 2022               |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults Who Are Obese, Est. (%) 2022                        |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults Who Smoke, Est. (%) 2022                            |
      | Change in Scope Request | 22102 | Population Data | Pop: Adults With No Dental Visit in Past Year, Est. (%) 2022    |
      | Change in Scope Request | 22102 | Population Data | Pop: Disability (%) 2019-2023                                   |
      | Change in Scope Request | 22102 | Population Data | Pop: Low Birthweight (%) 2022                                   |
      | Change in Scope Request | 22102 | Population Data | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022  |
      | Change in Scope Request | 22102 | Population Data | Pop: Veterans (%) 2019-2023                                     |
      | Change in Scope Request | 22102 | Population Data | Pop: More Than One Race (%) 2019-2023                           |
      | Change in Scope Request | 22102 | Population Data | Pop: Households With No Broadband (%) 2019-2023                 |
      | Change in Scope Request | 22102 | Population Data | Pop: School Aged (%) 2019-2023                                  |


  Scenario Outline: Verify the Population & UDS Layers Functionality for  New Access Point Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type             | zcta  | Population      | Layer                                                           |
      | New Access Point Application | 22102 | Population Data | Pop: Below 200% Federal Poverty Level (%) 2018-2022             |
      | New Access Point Application | 22102 | Population Data | Pop: Unemployment (%) 2018-2022                                 |
      | New Access Point Application | 22102 | Population Data | Pop: No High School Diploma, 25+ (%) 2018-2022                  |
      | New Access Point Application | 22102 | Population Data | Pop: White (%) 2019-2023                                        |
      | New Access Point Application | 22102 | Population Data | Pop: Racial/ Ethnic Minority (%) 2019-2023                      |
      | New Access Point Application | 22102 | Population Data | Pop: Other Pacific Islander (%) 2019-2023                       |
      | New Access Point Application | 22102 | Population Data | Pop: Native Hawaiian (%) 2019-2023                              |
      | New Access Point Application | 22102 | Population Data | Pop: Hispanic/Latino (%) 2019-2023                              |
      | New Access Point Application | 22102 | Population Data | Pop: Black (%) 2019-2023                                        |
      | New Access Point Application | 22102 | Population Data | Pop: Asian (%) 2019-2023                                        |
      | New Access Point Application | 22102 | Population Data | Pop: American Indian/ Alaska Native (%) 2019-2023               |
      | New Access Point Application | 22102 | Population Data | Pop: 2-yr Change in Uninsured, Est. (%) 2021, 2023              |
      | New Access Point Application | 22102 | Population Data | Pop: 1-yr Change in Uninsured, Est. (%) 2022, 2023              |
      | New Access Point Application | 22102 | Population Data | Pop: Medicaid/ Public Ins., Est. (%) 2023                       |
      | New Access Point Application | 22102 | Population Data | Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023  |
      | New Access Point Application | 22102 | Population Data | Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2022, 2023  |
      | New Access Point Application | 22102 | Population Data | Pop: Medicare/ Private Ins., Est. (%) 2023                      |
      | New Access Point Application | 22102 | Population Data | Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023 |
      | New Access Point Application | 22102 | Population Data | Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2022, 2023 |
      | New Access Point Application | 22102 | Population Data | Pop: 2-yr Change in Total Population (%) 2021, 2023             |
      | New Access Point Application | 22102 | Population Data | Pop: 1-yr Change in Total Population (%) 2022, 2023             |
      | New Access Point Application | 22102 | Population Data | Pop: Uninsured, Est. (%) 2023                                   |
      | New Access Point Application | 22102 | Population Data | Pop: Below Federal Poverty Level (%) 2018-2022                  |
      | New Access Point Application | 22102 | Population Data | Pop: 65 and Older (%) 2019-2023                                 |
      | New Access Point Application | 22102 | Population Data | Pop: 18-64 (%) 2019-2023                                        |
      | New Access Point Application | 22102 | Population Data | Pop: Under 18 (%) 2019-2023                                     |
      | New Access Point Application | 22102 | Population Data | Pop: Adults Ever Told Have Diabetes, Est. (%) 2022              |
      | New Access Point Application | 22102 | Population Data | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2021   |
      | New Access Point Application | 22102 | Population Data | Pop: Adults Who Are Binge Drinkers, Est. (%) 2022               |
      | New Access Point Application | 22102 | Population Data | Pop: Adults Who Are Obese, Est. (%) 2022                        |
      | New Access Point Application | 22102 | Population Data | Pop: Adults Who Smoke, Est. (%) 2022                            |
      | New Access Point Application | 22102 | Population Data | Pop: Adults With No Dental Visit in Past Year, Est. (%) 2022    |
      | New Access Point Application | 22102 | Population Data | Pop: Disability (%) 2019-2023                                   |
      | New Access Point Application | 22102 | Population Data | Pop: Low Birthweight (%) 2022                                   |
      | New Access Point Application | 22102 | Population Data | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022  |
      | New Access Point Application | 22102 | Population Data | Pop: Veterans (%) 2019-2023                                     |
      | New Access Point Application | 22102 | Population Data | Pop: More Than One Race (%) 2019-2023                           |
      | New Access Point Application | 22102 | Population Data | Pop: Households With No Broadband (%) 2019-2023                 |
      | New Access Point Application | 22102 | Population Data | Pop: School Aged (%) 2019-2023                                  |


  Scenario Outline: Verify the Population & UDS Layers Functionality for  Service Area Competition Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type                     | zcta  | Population      | Layer                                                           |
      | Service Area Competition Application | 22102 | Population Data | Pop: Below 200% Federal Poverty Level (%) 2018-2022             |
      | Service Area Competition Application | 22102 | Population Data | Pop: Unemployment (%) 2018-2022                                 |
      | Service Area Competition Application | 22102 | Population Data | Pop: No High School Diploma, 25+ (%) 2018-2022                  |
      | Service Area Competition Application | 22102 | Population Data | Pop: White (%) 2019-2023                                        |
      | Service Area Competition Application | 22102 | Population Data | Pop: Racial/ Ethnic Minority (%) 2019-2023                      |
      | Service Area Competition Application | 22102 | Population Data | Pop: Other Pacific Islander (%) 2019-2023                       |
      | Service Area Competition Application | 22102 | Population Data | Pop: Native Hawaiian (%) 2019-2023                              |
      | Service Area Competition Application | 22102 | Population Data | Pop: Hispanic/Latino (%) 2019-2023                              |
      | Service Area Competition Application | 22102 | Population Data | Pop: Black (%) 2019-2023                                        |
      | Service Area Competition Application | 22102 | Population Data | Pop: Asian (%) 2019-2023                                        |
      | Service Area Competition Application | 22102 | Population Data | Pop: American Indian/ Alaska Native (%) 2019-2023               |
      | Service Area Competition Application | 22102 | Population Data | Pop: 2-yr Change in Uninsured, Est. (%) 2021, 2023              |
      | Service Area Competition Application | 22102 | Population Data | Pop: 1-yr Change in Uninsured, Est. (%) 2022, 2023              |
      | Service Area Competition Application | 22102 | Population Data | Pop: Medicaid/ Public Ins., Est. (%) 2023                       |
      | Service Area Competition Application | 22102 | Population Data | Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023  |
      | Service Area Competition Application | 22102 | Population Data | Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2022, 2023  |
      | Service Area Competition Application | 22102 | Population Data | Pop: Medicare/ Private Ins., Est. (%) 2023                      |
      | Service Area Competition Application | 22102 | Population Data | Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023 |
      | Service Area Competition Application | 22102 | Population Data | Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2022, 2023 |
      | Service Area Competition Application | 22102 | Population Data | Pop: 2-yr Change in Total Population (%) 2021, 2023             |
      | Service Area Competition Application | 22102 | Population Data | Pop: 1-yr Change in Total Population (%) 2022, 2023             |
      | Service Area Competition Application | 22102 | Population Data | Pop: Uninsured, Est. (%) 2023                                   |
      | Service Area Competition Application | 22102 | Population Data | Pop: Below Federal Poverty Level (%) 2018-2022                  |
      | Service Area Competition Application | 22102 | Population Data | Pop: 65 and Older (%) 2019-2023                                 |
      | Service Area Competition Application | 22102 | Population Data | Pop: 18-64 (%) 2019-2023                                        |
      | Service Area Competition Application | 22102 | Population Data | Pop: Under 18 (%) 2019-2023                                     |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults Ever Told Have Diabetes, Est. (%) 2022              |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2021   |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults Who Are Binge Drinkers, Est. (%) 2022               |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults Who Are Obese, Est. (%) 2022                        |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults Who Smoke, Est. (%) 2022                            |
      | Service Area Competition Application | 22102 | Population Data | Pop: Adults With No Dental Visit in Past Year, Est. (%) 2022    |
      | Service Area Competition Application | 22102 | Population Data | Pop: Disability (%) 2019-2023                                   |
      | Service Area Competition Application | 22102 | Population Data | Pop: Low Birthweight (%) 2022                                   |
      | Service Area Competition Application | 22102 | Population Data | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022  |
      | Service Area Competition Application | 22102 | Population Data | Pop: Veterans (%) 2019-2023                                     |
      | Service Area Competition Application | 22102 | Population Data | Pop: More Than One Race (%) 2019-2023                           |
      | Service Area Competition Application | 22102 | Population Data | Pop: Households With No Broadband (%) 2019-2023                 |
      | Service Area Competition Application | 22102 | Population Data | Pop: School Aged (%) 2019-2023                                  |


  Scenario Outline: Verify the Population & UDS Layers Functionality for Look-Alike Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type       | zcta  | Population      | Layer                                                           |
      | Look-Alike Application | 22102 | Population Data | Pop: Below 200% Federal Poverty Level (%) 2018-2022             |
      | Look-Alike Application | 22102 | Population Data | Pop: Unemployment (%) 2018-2022                                 |
      | Look-Alike Application | 22102 | Population Data | Pop: No High School Diploma, 25+ (%) 2018-2022                  |
      | Look-Alike Application | 22102 | Population Data | Pop: White (%) 2019-2023                                        |
      | Look-Alike Application | 22102 | Population Data | Pop: Racial/ Ethnic Minority (%) 2019-2023                      |
      | Look-Alike Application | 22102 | Population Data | Pop: Other Pacific Islander (%) 2019-2023                       |
      | Look-Alike Application | 22102 | Population Data | Pop: Native Hawaiian (%) 2019-2023                              |
      | Look-Alike Application | 22102 | Population Data | Pop: Hispanic/Latino (%) 2019-2023                              |
      | Look-Alike Application | 22102 | Population Data | Pop: Black (%) 2019-2023                                        |
      | Look-Alike Application | 22102 | Population Data | Pop: Asian (%) 2019-2023                                        |
      | Look-Alike Application | 22102 | Population Data | Pop: American Indian/ Alaska Native (%) 2019-2023               |
      | Look-Alike Application | 22102 | Population Data | Pop: 2-yr Change in Uninsured, Est. (%) 2021, 2023              |
      | Look-Alike Application | 22102 | Population Data | Pop: 1-yr Change in Uninsured, Est. (%) 2022, 2023              |
      | Look-Alike Application | 22102 | Population Data | Pop: Medicaid/ Public Ins., Est. (%) 2023                       |
      | Look-Alike Application | 22102 | Population Data | Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023  |
      | Look-Alike Application | 22102 | Population Data | Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2022, 2023  |
      | Look-Alike Application | 22102 | Population Data | Pop: Medicare/ Private Ins., Est. (%) 2023                      |
      | Look-Alike Application | 22102 | Population Data | Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023 |
      | Look-Alike Application | 22102 | Population Data | Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2022, 2023 |
      | Look-Alike Application | 22102 | Population Data | Pop: 2-yr Change in Total Population (%) 2021, 2023             |
      | Look-Alike Application | 22102 | Population Data | Pop: 1-yr Change in Total Population (%) 2022, 2023             |
      | Look-Alike Application | 22102 | Population Data | Pop: Uninsured, Est. (%) 2023                                   |
      | Look-Alike Application | 22102 | Population Data | Pop: Below Federal Poverty Level (%) 2018-2022                  |
      | Look-Alike Application | 22102 | Population Data | Pop: 65 and Older (%) 2019-2023                                 |
      | Look-Alike Application | 22102 | Population Data | Pop: 18-64 (%) 2019-2023                                        |
      | Look-Alike Application | 22102 | Population Data | Pop: Under 18 (%) 2019-2023                                     |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults Ever Told Have Diabetes, Est. (%) 2022              |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2021   |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults Who Are Binge Drinkers, Est. (%) 2022               |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults Who Are Obese, Est. (%) 2022                        |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults Who Smoke, Est. (%) 2022                            |
      | Look-Alike Application | 22102 | Population Data | Pop: Adults With No Dental Visit in Past Year, Est. (%) 2022    |
      | Look-Alike Application | 22102 | Population Data | Pop: Disability (%) 2019-2023                                   |
      | Look-Alike Application | 22102 | Population Data | Pop: Low Birthweight (%) 2022                                   |
      | Look-Alike Application | 22102 | Population Data | Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022  |
      | Look-Alike Application | 22102 | Population Data | Pop: Veterans (%) 2019-2023                                     |
      | Look-Alike Application | 22102 | Population Data | Pop: More Than One Race (%) 2019-2023                           |
      | Look-Alike Application | 22102 | Population Data | Pop: Households With No Broadband (%) 2019-2023                 |
      | Look-Alike Application | 22102 | Population Data | Pop: School Aged (%) 2019-2023                                  |

  Scenario Outline: Verify the Population & UDS Layers Functionality for UDS Data Service Area Competition Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer for "<type>"
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type                     | zcta  | Population | Layer                                                             | type        |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Service Area Competition Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |


  Scenario Outline: Verify the Population & UDS Layers Functionality for UDS Data Look-Alike Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer for "<type>"
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type       | zcta  | Population | Layer                                                             | type        |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Look-Alike Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |


  Scenario Outline: Verify the Population & UDS Layers Functionality for UDS Data  New Access Point Application
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer for "<type>"
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type             | zcta  | Population | Layer                                                             | type        |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | New Access Point Application | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |


  Scenario Outline: Verify the Population & UDS Layers Functionality for UDS Data Change in Scope Request
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search "<zcta>" ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta "<zcta>"
    Then selected '<zcta>' ZCTA should display in the navigation panel
    When user click on play buton on searched zcta
    And user click on "Population & UDS Layers" option on the map
    And user select population as "<Population>" and layer data as "<Layer>" then add layer for "<type>"
    Then user verify layer "<Layer>" is loaded in population & uds layers
    And user verify population and uds layers loaded for "<Layer>" of application type "<application_type>"
    Examples:
      | application_type        | zcta  | Population | Layer                                                             | type        |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Combined    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Awardees    |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Low-Income (%) 2024                           | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024          | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024          | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Uninsured, (%) 2023, 2024                     | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Uninsured, (%) 2022, 2024                     | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 1-yr Change in Patients (%) 2023, 2024                       | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: 2-yr Change in Patients (%) 2022, 2024                       | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024 | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Low-Income Not Served by Health Centers (#) 2024             | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured Not Served by Health Centers (#) 2024              | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024  | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (%) 2024                               | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (%) 2024                                | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (%) 2024                                           | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Dominant Health Center 2024                                  | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Health Center Count 2024                                     | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicare/Private Ins. (%) 2024                | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Medicaid/Public Ins. (%) 2024                 | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Uninsured Population (%) 2024                 | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Penetration of Total Population (%) 2024                     | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Uninsured (#) 2024                                           | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicaid/Public Ins. (#) 2024                                | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Medicare/Private Ins. (#) 2024                               | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: Not Served by Health Centers (#) 2024                        | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #1 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #2 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #3 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #4 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |
      | Change in Scope Request | 22102 | UDS Data   | HCP: #5 Dominant Health Center Share of Patients (%) 2024         | Look-Alikes |


  @HDWD-4537 @automatedGeocare_pending
  Scenario Outline: Verify the db data for all columns in the data table
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    When user click on 'Draw On Map' tab under geo care
    When user click on "Add by search" option under draw on map
    And user search '<zcta>' ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    And user click Add for zcta '<zcta>'
    Then selected '<zcta>' ZCTA should display in the navigation panel
    And Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    And Click on "View Data Table" button
    And Add the all the columns to data table
    And user delete all the downloaded files
    And click on download the data
    And user read csv file "data.csv" from downloads from rows "2" to "3" for geocare
    And user get db data for "<type>" in geocare for all columns for zcta "<zcta>"
    Then user verify downloaded data and db data same for geocare
    Examples:
      | application_type                     | zcta  | type     |
      | New Access Point Application         | 22102 | combined |
      | New Access Point Application         | 22102 | lal      |
      | New Access Point Application         | 22102 | awardees |
      | Service Area Competition Application | 22102 | combined |
      | Service Area Competition Application | 22102 | lal      |
      | Service Area Competition Application | 22102 | awardees |
      | Look-Alike Application               | 22102 | combined |
      | Look-Alike Application               | 22102 | lal      |
      | Look-Alike Application               | 22102 | awardees |
      | Change in Scope Request              | 22102 | combined |
      | Change in Scope Request              | 22102 | lal      |
      | Change in Scope Request              | 22102 | awardees |


  @HDWD-4537 @automatedGeocare_pending
  Scenario Outline: Verify the db data for default columns in the data table
    When Click on "Get Started" button
    And Select the application type '<application_type>'
    And Click on "Continue" button
    And User click on 'Start' for 'Create Service Area'
    And user click on 'Draw On Map' tab under geo care
    And user click on "Add by search" option under draw on map
    And user search '<zcta>' ZCTA in the search bar
    Then searched result should be visible on the search list for '<zcta>'
    When user click Add for zcta '<zcta>'
    And selected '<zcta>' ZCTA should display in the navigation panel
    And Click on "Back" button
    And User click on 'Start' for 'Review Map and Data Table'
    And Click on "View Data Table" button
    And user delete all the downloaded files
    And click on download the data
    And user read csv file "data.csv" from downloads from rows "2" to "3" for geocare
    And user get db data for "<type>" in geocare for default columns for zcta "<zcta>"
    Then user verify downloaded data and db data same for geocare
    Examples:
      | application_type                     | zcta  | type     |
      | New Access Point Application         | 22102 | combined |
      | New Access Point Application         | 22102 | lal      |
      | New Access Point Application         | 22102 | awardees |
      | Service Area Competition Application | 22102 | combined |
      | Service Area Competition Application | 22102 | lal      |
      | Service Area Competition Application | 22102 | awardees |
      | Look-Alike Application               | 22102 | combined |
      | Look-Alike Application               | 22102 | lal      |
      | Look-Alike Application               | 22102 | awardees |
      | Change in Scope Request              | 22102 | combined |
      | Change in Scope Request              | 22102 | lal      |
      | Change in Scope Request              | 22102 | awardees |