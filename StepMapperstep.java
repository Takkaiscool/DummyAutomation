package stepdefinations;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

import io.cucumber.java.PendingException;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.testng.Assert;
import org.testng.asserts.SoftAssert;

import com.qa.Factory.Driverfactory;
import com.qa.util.ConfigReader;
import com.qa.util.CsvReadAndWrite;
import com.qa.util.DBFramework;
import com.qa.util.LoadQueries;

import PageObjectRepository.CommonObject;
import PageObjectRepository.UDSMApperObject;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class UDSMapperstep {

	private UDSMApperObject Udsobj = new UDSMApperObject(Driverfactory.getDriver());
	private CommonObject cobj = new CommonObject(Driverfactory.getDriver());
	ConfigReader configReader = new ConfigReader();
	Properties properties = configReader.init_prop();
	List<LinkedHashMap<String, String>> expectedData;
	List<LinkedHashMap<String, String>> serviceDeliveryActualData;
    List<LinkedHashMap<String, String>> zctaActualData;
    ArrayList<HashMap<String, Object>> dbResult;

	@Given("page header is displayed as {string}")
	public void page_header_is_displayed_as(String pageHeader) {
		// Write code here that turns the phrase above into concrete actions
		String pageHeaderactual = cobj.getpageHeaderinfo();
		// System.out.println(pageHeaderactual);
		Assert.assertEquals(pageHeader, pageHeaderactual);
	}
	@Then("user switch to current url")
	public void user_switch_to_current_url() {
	    // Write code here that turns the phrase above into concrete actions
		cobj.switchDriverToOpenedPage();
	}

	@Then("Navigation panel title is displayed as {string}")
	public void navigation_panel_title_is_displayed_as(String expectedTitlesName) {
		// Write code here that turns the phrase above into concrete actions
		// title = cobj.getPageTitle();
		Assert.assertEquals(Udsobj.getUDSMapperPageTitle(expectedTitlesName), true);
	}

	@When("User click on {string} for {string}")
	public void user_click_on_for(String action, String task) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.ClickOnAction_task(action, task);
	}

	@When("Click on {string} button")
	public void click_on_button(String btn) {
		// Write code here that turns the phrase above into concrete actions
		cobj.clickon(btn);
	}

	@Then("user see {string} page is displayed")
	public void user_see_page_is_displayed(String string) {
		// Write code here that turns the phrase above into concrete actions
		cobj.getPageheader();
	}

	@Then("User enter {string} to the textarea")
	public void user_enter_to_the_textarea(String txt) {
		// Write code here that turns the phrase above into concrete actions
		System.out.print(txt);
		Udsobj.enterTextarea(txt);
	}

	@Then("user see the validation box for ZCTAs")
	public void user_see_the_validation_box_for_zctas(io.cucumber.datatable.DataTable dataTable) {
		List<Map<String, String>> expectetask = dataTable.asMaps(String.class, String.class);
		int i = 1;
		for (Map<String, String> testdata : expectetask) {
			if (testdata.get("Entered_ZIP_Code") != null) {
				// verify the task list
				String actualEntered_ZIP_Code = Udsobj.getZCTAvalidationlist(i, 1);
				String actualMatching_ZCTA = Udsobj.getZCTAvalidationlist(i, 2);
				String actualMatching_ZIP_Join_Type = Udsobj.getZCTAvalidationlist(i, 3);
				Assert.assertEquals(actualEntered_ZIP_Code, testdata.get("Entered_ZIP_Code"));
				Assert.assertEquals(actualMatching_ZCTA, testdata.get("Matching_ZCTA"));
				if (testdata.get("Matching_ZCTA") != null) {
					Assert.assertEquals(actualMatching_ZCTA, testdata.get("Matching_ZCTA"));
				} else {
					Assert.assertNull(actualMatching_ZCTA);

				}

				Assert.assertEquals(actualMatching_ZIP_Join_Type, testdata.get("ZIP_Join_Type"));

				i++;
			}

		}
	}

	@Then("User see the text {string}")
	public void user_see_the_text(String txt) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.Verifytextonpage(txt);
	}

	@When("User click on {string} geometry button")
	public void click_on_geometry_button(String btn) {
		// Write code here that turns the phrase above into concrete actions
		cobj.clickonGeobtn(btn);
	}

	@When("Select the application type {string}")
	public void select_the_application_type(String applicationtype) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.selectApplicationtype(applicationtype);
	}

	@Then("User see the {string} button")
	public void user_see_the_button(String btn) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.Buttonexist(btn);
	}

	@When("Click on {string} underline-text")
	public void click_on_underline_text(String linktext) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.Underlinetext(linktext).click();
	}

	@Then("User see {string} underline-text")
	public void User_see_underline_text(String linktext) {
		// Write code here that turns the phrase above into concrete actions
		Assert.assertEquals(Udsobj.Underlinetext(linktext).isDisplayed(), true);
	}

	@Then("User see the below Task for {string}")
	public void user_see_the_below_task_for(String string, io.cucumber.datatable.DataTable dataTable) {
		List<Map<String, String>> expectetask = dataTable.asMaps(String.class, String.class);
		int expectedtablelen = expectetask.size();
		int actualtablesize = Udsobj.Udsmappertasktablesize();
		Assert.assertEquals(actualtablesize, expectedtablelen);
		int i = 1;
		for (Map<String, String> testdata : expectetask) {
			if (testdata.get("Task_Element") != null) {
				// verify the task list
				String actualtask = Udsobj.getTasklist(i, 1);
				String actualAction = Udsobj.getTasklist(i, 2);

				Assert.assertEquals(actualtask, testdata.get("Task_Element"));
				Assert.assertEquals(actualAction, testdata.get("Action"));
				i++;
			}

		}
	}

	@Then("User see requirement list under paragraph {string}")
	public void user_see_requirement_list_under_paragraph(String textexpected,
			io.cucumber.datatable.DataTable dataTable) {
		// Write code here that turns the phrase above into concrete actions
		String actualtext = Udsobj.verifyparagraphOnUDS(textexpected);
		Assert.assertEquals(actualtext, textexpected);

		List<Map<String, String>> expectedlist = dataTable.asMaps(String.class, String.class);
		int i = 1;
		int j = 1;
		String sublist[];
		for (Map<String, String> testdata : expectedlist) {
			String actualreq = Udsobj.getReqlist(textexpected, i);
			// System.out.println("Actual " +actualreq +" Expected
			// "+testdata.get("Parent_Required_Information"));
			Assert.assertEquals(actualreq, testdata.get("Parent_Required_Information"));
			if (testdata.get("Sub-list") != null && testdata.get("Sub-list").contains(",")) {
				// if (testdata.get("Sub-list").contains(",")) {
				sublist = testdata.get("Sub-list").split(",");
				for (j = 0; j < sublist.length - 1; j++) {
					String actualsublist = Udsobj.getReqsublist(textexpected, i, j + 1);
					Assert.assertEquals(actualsublist, sublist[j]);
				}
			} else if (testdata.get("Sub-list") != null) {
				String actualsublist = Udsobj.getReqsublist(textexpected, i, j);
				Assert.assertEquals(actualsublist, testdata.get("Sub-list"));
			}
			i++;
		}
	}

	@Then("User verify the note {string} is displayed on the UDS mapper")
	public void user_verify_the_note_is_displayed_on_the_uds_mapper(String note) {
		// Write code here that turns the phrase above into concrete actions

		String actualNote = Udsobj.getNote();
		System.out.println("Actual " + actualNote + " Expected " + note);
		Assert.assertEquals(actualNote, note);

	}

	@Then("Navigation panel title is displayed as {string} for {string}")
	public void navigation_panel_title_is_displayed_as_for(String expectedTitlesName, String section) {
		// Write code here that turns the phrase above into concrete actions
		Assert.assertEquals(Udsobj.getUDSMapperPageTitle(expectedTitlesName), true);

	}

	@Then("User see the instructions under {string}")
	public void user_see_the_instructions_under(String sectionname, io.cucumber.datatable.DataTable dataTable) {
		// h3[text()='Filling out an application?']/following::p[2]
		int i = 1;
		List<Map<String, String>> expectedinstruction = dataTable.asMaps(String.class, String.class);
		for (Map<String, String> testdata : expectedinstruction) {
			String actualinstruction = Udsobj.getInstruction(sectionname, i);

			Assert.assertEquals(actualinstruction, testdata.get("Instruction"));
			i++;
		}

	}

	@Then("User see the instructions line items under {string}")
	public void user_see_the_instructions_line_items_under(String sectionname, io.cucumber.datatable.DataTable dataTable) {
		// h3[text()='Filling out an application?']/following::p[2]
		int i = 1;
		List<Map<String, String>> expectedinstruction = dataTable.asMaps(String.class, String.class);
		for (Map<String, String> testdata : expectedinstruction) {
			String actualinstruction = Udsobj.getInstructionLineItems(sectionname, i);

			Assert.assertEquals(actualinstruction, testdata.get("Instruction"));
			i++;
		}

	}

	@Then("page title is displayed as {string} it is H2")
	public void pageTitleIsDisplayedAsItIsH2(String title) {
		Assert.assertEquals(Udsobj.getH2HeaderTitle(), title);
	}

	@And("Below options should be displayed")
	public void belowOptionsShouldBeDisplayed(List<String> options) {
		for (String option : options)
			Assert.assertTrue(Udsobj.optionDisplayed(option), option + " is not displayed");
	}

	@Then("verify below options should be displayed under Draw on Map")
	public void verifyBelowOptionsShouldBeDisplayedUnderDrawOnMap(List<String> data) {
		for (String option : data)
			Assert.assertTrue(Udsobj.optionDisplayedUnderDrawOnMap(option), option + " is not displayed");
	}

	@When("user click on {string} tab under geo care")
	public void userClickOnTabUnderGeoCare(String data) {
		Udsobj.clickOnOption(data);
	}

	@When("user click on {string} option under draw on map")
	public void userClickOnTabUnderDrawOnMap(String data) {
		Udsobj.clickOnOptionUnderDrawOnMap(data);
	}

	@And("user search {string} ZCTA in the search bar")
	public void userSearchZctaInTheSearchBar(String zcta) {
		Udsobj.searchZctaOnSearchBar(zcta);
	}

	@And("searched result should be visible on the search list for {string}")
	public void searchedResultShouldBeVisibleOnTheSearchListFor(String zcta) {
		List<String> actualOutput = Udsobj.getSearchResultsOptions();
		for (String actual : actualOutput)
			Assert.assertTrue(actual.contains(zcta),
					actual + " zcta from result doesn't match with expected zta " + zcta);
	}

	@And("user click Add for zcta {string}")
	public void userClickAddForZcta(String zcta) {
		Udsobj.clickAddOnZcta(zcta);
	}

	@Then("selected {string} ZCTA should display in the navigation panel")
	public void selectedZctaShouldDisplayInTheNavigationPanel(String zcta) {
		Assert.assertTrue(Udsobj.isZctaSearchedPresentInLeftPanel(zcta), zcta + " is not present in left panel");
	}

	@And("user should see an indicator to remove a specific ZCTA {string} in navigation panel")
	public void userShouldSeeAnIndicatorToRemoveASpecificZctaInNavigationPanel(String zcta) {
		Assert.assertTrue(Udsobj.isZctaSearchedDeleteButtonPresentInLeftPanel(zcta),
				zcta + " delete is not present in left panel");
	}

	@When("user click on the remove indicator for {string}")
	public void userClickOnTheRemoveIndicatorFor(String zcta) {
		Udsobj.deleteZcta(zcta);
	}

	@Then("verify {string} ZCTA's should be removed in the navigation panel")
	public void verifyZctasShouldBeRemovedInTheNavigationPanel(String zcta) {
		Assert.assertTrue(Udsobj.isZctaSearchedNotPresentInLeftPanel(zcta), zcta + " is present in left panel");
	}

	@When("user click on {string} option on the map")
	public void userClickOnOptionOnTheMap(String mapFilter) {
		Udsobj.clickOptionOnMap(mapFilter);
	}

	@Then("verifies print report option as")
	public void verifiesPrintReportOptionAs(List<String> options) {
		for (String option : options)
			Assert.assertTrue(Udsobj.isPrintSelectOptions(option));
	}

	@And("user selects titlename {string} page setup {string} and file format {string}")
	public void userSelectsFileNamePageLayout(String fileName, String layout, String format)
			throws InterruptedException {
		Udsobj.exportTheMap(fileName, layout, format);
	}

	@When("user click on {string} widget button")
	public void user_click_on_widget_button(String Button) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.selectWidgetbutton(Button);

	}

	@When("user select the Basemap option as {string} and verify the option is selected")
	public void user_select_the_basemap_option_as_and_verify_the_option_is_selected(String option,
			io.cucumber.datatable.DataTable dataTable) {
		// Write code here that turns the phrase above into concrete actions
		int i = 1;
		List<Map<String, String>> expectedoption = dataTable.asMaps(String.class, String.class);
		for (Map<String, String> testdata : expectedoption) {
			Udsobj.selectbaseoption(testdata.get("Option"));
			i++;
		}
	}

	@When("user click on {string} and upload the file {string}")
	public void user_click_on_and_upload_the_file(String button, String filepath) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.uploadfile(filepath);
	}

	@Then("Verify Zcta from {string} is displayed navigation panel")
	public void verify_zcta_from_is_displayed_navigation_panel(String fileName) throws IOException {
		FileReader file = new FileReader("./TestDataConfig/InputData/" + fileName);
		cobj.sleep(2);
		BufferedReader br = new BufferedReader(file);
		List<String> data = new ArrayList<>();
		String t;
		List<String> gridData = Udsobj.ZCTAonNavigationPanel();
	
		while ((t = br.readLine()) != null) {
			data.add(t.trim());
		}
		for (int i=1;i<gridData.size();i++)	{
			Assert.assertTrue(data.contains(gridData.get(i)));
		
		}
		


	}

	@When("user click on caret symbol in the bottom of the Geocare map")
	public void user_click_on_caret_symbol_in_the_bottom_of_the_geocare_map() {
		String location = "bottom";
		Udsobj.ClickonCaret(location);
	}

	@Then("data table should be loaded with data for Columns for selected {string} ZCTA")
	public void data_table_should_be_loaded_with_data_for_columns_for_selected_zcta(String string,
			List<String> expected) {
		System.out.println(Udsobj.gridTableColumnname());
		System.out.println(expected);
		Assert.assertEquals(Udsobj.gridTableColumnname(), expected);
	}

	@Then("data table should be loaded with data for optional Columns for selected {string} ZCTA")
	public void data_table_should_be_loaded_with_data_for_optional_columns_for_selected_zcta(String string,
			List<String> expected) {
		System.out.println(Udsobj.gridTableColumnname() + "  on the application");
		System.out.println(expected + " from the BDD ");
//		Assert.assertEquals(Udsobj.gridTableColumnname(), expected);
		for (String data : expected) {
			Assert.assertListContainsObject(Udsobj.gridTableColumnname(), data,
					"Expected column " + data + " is listed on the dropdown");
		}
	}

	@And("user enter address site as {string}")
	public void userEnterAddressSiteAs(String site) {
		Udsobj.enterAddressSite(site);
	}

	@And("user click on {string} option on print report")
	public void userClickOnOptionOnPrintReport(String site) {
		Udsobj.clickOnPrintReportOption(site);
	}

	@And("user click Add for address site {string}")
	public void userClickAddForAddress(String zcta) {
		Udsobj.clickAddOnAddress(zcta);
	}

	@And("user enter additional notes as {string}")
	public void userEnterAdditionalNotesAs(String notes) {
		Udsobj.enterAdditionalNotes(notes);
	}

	@When("user expand the bottom panel")
	public void userExpandTheBottomPanel() {
		Udsobj.expandTheBottomViewPanel();
	}

	@When(("user close the print popup"))
	public void userCloseThePrintPopup() {
		Udsobj.closePrintPopup();
	}

	@Then("user verify the ZCTA in grid is {string}")
	public void userVerifyTheZCTAInGridIs(String zcta) {
		List<String> gridData = Udsobj.gridZtaData();
		for (String data : gridData) {			
			Assert.assertEquals(data, zcta);			
		}
			
	}

	@Then("user verify the selected sites in grid is {string}")
	public void userVerifyTheselectedSitesInGridIs(String zcta) {
		List<String> gridData = Udsobj.gridSelectedSitesData();
		for (String data : gridData)
			Assert.assertEquals(data, zcta);
	}

	//453-468
	@Then("user verify the map layers data for UDS Mapper Tool")
	public void userVerifyTheMapLayersDataForUDSMapperTool(List<String> data) {
		System.out.println(data);
		for(String layer : data) {
			Assert.assertTrue(Udsobj.isLayerPresent(layer));
		}
	}

	@Then("user verify the sub map layers data for layer {string} in UDS Mapper Tool and are in alphabetical")
	public void userVerifyTheSubMapLayersDataForLayerInudsMapperTool(String layer, List<String> subLayerList) {
		System.out.println(subLayerList);
		for(String subLayer : subLayerList) {
			Assert.assertTrue(Udsobj.isLayerPresent(subLayer));
		}
	}

	@Then("Add the optional column on data table")
	public void add_the_optional_column_on_data_table(io.cucumber.datatable.DataTable dataTable) {
		List<Map<String, String>> expectedoption = dataTable.asMaps(String.class, String.class);
		for (Map<String, String> testdata : expectedoption) {
			Udsobj.selectoptionalcolumn(testdata.get("Column"));
		}
	}

	@When("user hide the layer {string} for uds mapper")
	public void userHideTheLayerForUdsMapper(String layer) throws InterruptedException {
		Udsobj.hideLayer(layer);
	}

	@When("user show the layer {string} for uds mapper")
	public void userShowTheLayerForUdsMapper(String layer) throws InterruptedException {
		Udsobj.showLayer(layer);
	}

	@When("user verify {string} should be visible on map for uds mapper")
	public void userVerifyShouldBeVisibleOnMap(String layer) {
		Assert.assertTrue(Udsobj.layerVisibleOnMap(layer));
	}

	@When("user verify {string} should be not visible on map for uds mapper")
	public void userVerifyShouldNotBeVisibleOnMap(String layer) {
		Assert.assertFalse(Udsobj.layerVisibleOnMap(layer));
	}

	@When("user select the layer {string} option as {string} for uds mapper")
	public void userSelectTheLayerOptionAs(String layer, String option) {
		Udsobj.selectOption(layer, option);
	}

	@When("user verify the layer {string} option as {string} is present in the layer option for uds mapper")
	public void userVerifyTheIsPresentInTheLayerOptionForUdsMapper(String layer, String option) {
		Assert.assertTrue(Udsobj.isOptionPresent(layer, option));
	}

	@Then("user verify uploaded service delivery sites file {string} is displayed in Selected ZCTA's navigation panel")
	public void user_verify_uploaded_service_delivery_sites_file_is_displayed_in_selected_zcta_s_navigation_panel(
			String filename) {
		// Write code here that turns the phrase above into concrete actions
		Udsobj.uploadFile(filename);
	}

	@Then("user verify validation message as {string}")
	public void user_verify_validation_message_as(String message) {
		Assert.assertEquals(Udsobj.getValidationMessage(), message);
	}

	@And("user match the fields name from csv to application as below")
	public void userMatchTheFieldsNameFromCsvToApplicationAsBelow(Map<String, String> data) {
		Udsobj.selectTheColumns(data);
	}

	@And("user enter delivery site title as {string}")
	public void userEnterDeliverySiteTitleAs(String title) {
		Udsobj.enterTitle(title);
	}

	@Then("created site should be visible on the ZCTA panel as {string}")
	public void createdSiteShouldBeVisibleOnTheZCTAPanelAs(String siteName) {
		List<String> actualOutput = Udsobj.getAddedDeliverySite();
		for (String actual : actualOutput)
			Assert.assertTrue(actual.contains(siteName), actual);
	}

	@And("user read csv file {string} from upload data")
	public void userReadCsvFileFromUploadData(String fileName) {
		try {
			CsvReadAndWrite csvReadAndWrite = new CsvReadAndWrite("./TestDataConfig/InputData/" + fileName);
			expectedData = csvReadAndWrite.readData();
			 System.out.println(expectedData);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@And("user read the grid data of delivery site")
	public void userReadTheGridDataOfDeliverySite() {
		serviceDeliveryActualData = Udsobj.serviceDeliveryGridData();
		System.out.println("Actual data: "+serviceDeliveryActualData);
//		System.out.println(expectedData);
	}

	@Then("user verify grid data and uploaded data same for delivery site")
	public void userVerifyGrridDataAndUploadedDataSameForDeliverySite() {
		SoftAssert softAssert = new SoftAssert();
		for (int i = 0; i < serviceDeliveryActualData.size(); i++) {
			softAssert.assertEquals(serviceDeliveryActualData.get(i), expectedData.get(i),
					"Actual Data :" + serviceDeliveryActualData.get(i) + " Expected Data:" + expectedData.get(i));
		}
		softAssert.assertAll();
	}
	 @And("user selects {string} value in zcta table")
	    public void userSelectsValueInZctaTable(String option) {
	        Udsobj.selectZctaOption(option);
	    }

	    @And("user get {string} grid data from db for application {string} for {string}")
	    public void userGetGridDataFromDbForApplication(String option, String applicationType, String zcta) {
	        DBFramework dbFramework = new DBFramework();
	        LoadQueries loadQueries = new LoadQueries();
	        switch (applicationType.toLowerCase()) {
	            case "new access point application":
	                System.out.println(loadQueries.getQuery("napApplication" + option).replaceAll("zctaValues", zcta).replaceAll("zctaValues", zcta));
	                dbResult = dbFramework.executeStatementSet(loadQueries.getQuery("napApplication" + option).replaceAll("zctaValues", zcta), 30);
	                break;
	            case "service area competition application":
	                System.out.println(loadQueries.getQuery("serviceAreaCompetition" + option).replaceAll("zctaValues", zcta));
	                dbResult = dbFramework.executeStatementSet(loadQueries.getQuery("serviceAreaCompetition" + option).replaceAll("zctaValues", zcta), 30);
	                break;
	            case "look-alike application":
	                System.out.println(loadQueries.getQuery("lookAlikeApplication" + option).replaceAll("zctaValues", zcta));
	                dbResult = dbFramework.executeStatementSet(loadQueries.getQuery("lookAlikeApplication" + option).replaceAll("zctaValues", zcta), 30);
	                break;
	            case "change in scope request":
	                System.out.println(loadQueries.getQuery("changeInScopeRequest" + option).replaceAll("zctaValues", zcta));
	                dbResult = dbFramework.executeStatementSet(loadQueries.getQuery("changeInScopeRequest" + option).replaceAll("zctaValues", zcta), 30);
	                break;
	        }
	        System.out.println(dbResult);
	    }

	    @And("user read the grid data of zcta")
	    public void userReadTheGridDataOfZcta() {
	        zctaActualData = Udsobj.zctaGridData();
	        System.out.println(zctaActualData);
	    }

	    @Then("user verify grid data and db data same for zcta grid")
	    public void userVerifyGridDataAndDBDataSameForZctaGrid(){
	        Assert.assertEquals(zctaActualData.size(),dbResult.size());
	        SoftAssert softAssert=new SoftAssert();
	        for(int i=0;i<dbResult.size();i++){
	            for(String key:dbResult.get(i).keySet()){
	                if(!(key.equalsIgnoreCase("ZCTA")||key.equalsIgnoreCase("HCP: Dominant Health Center 2023"))){
	                    DecimalFormat df = new DecimalFormat("#.##");
	                    String actual=df.format(Double.parseDouble(zctaActualData.get(i).get(key).replace(",","")));
	                    String expected= df.format(dbResult.get(i).get(key));
	                    softAssert.assertEquals(actual,expected);
	                }else{
	                	if(dbResult.get(i).get(key)==(null)) {
	                        softAssert.assertEquals(zctaActualData.get(i).get(key).trim(),"");

	                	}
	                	else
	                    softAssert.assertEquals(zctaActualData.get(i).get(key).trim(),dbResult.get(i).get(key).toString().trim());
	                }
	            }
	        }
	        softAssert.assertAll();
	    }

	@Then("User see verify the paragraph {string}")
	public void user_see_verify_the__paragraph(String textexpected) {
		String actualtext = Udsobj.verifyparagraphOnUDS(textexpected);
		Assert.assertTrue(actualtext.contains(textexpected),textexpected+" is not found in "+actualtext);
	}

	@And("User see the {string} span button")
	public void userSeeTheSpanButton(String button) {
		Udsobj.spanButtonExist(button);
	}

	@When("user expand the layer {string} in UDS Mapper Tool")
	public void userExpandTheLayer(String layer) {
		Udsobj.expandLayer(layer);
	}

	//640
	@When("user collapse the layer {string} in UDS Mapper Tool")
	public void userCollapseTheLayer(String layer) {
		Udsobj.collapseLayer(layer);
		cobj.sleep(2);
	}

	@When("user click on middle of map for geocare")
	public void userClickOnMiddleOfMapForGeocare() {
		Udsobj.clickOnMiddleOfMap();
		Assert.fail();
	}

	@And("user switch to child window")
	public void userSwitchToChildWindow() throws IOException {
		cobj.switchToChildWindow();
	}

	@When("user click on play buton on searched zcta")
	public void userClickOnPlayButonOnSearchedZcta() {
		Udsobj.clickOnPlayButton();
		cobj.sleep(5);
	}


	@Then("user verify the legend data for UDS Mapper Tool")
	public void userVerifyTheLegendDataForUDSMapperTool(List<String> data) {
		System.out.println(data);
		for(String layer : data) {
			Assert.assertTrue(Udsobj.isLegendLayerPresent(layer));
		}
	}

	@And("user verify the legend sub data for layer {string}")
	public void userVerifyTheLegendSubDataForLayer(String legend,List<String> expectedData) {
		Assert.assertEquals(Udsobj.getSubLegendData(legend),expectedData);

	}


	@And("user select population as {string} and layer data as {string} then add layer")
	public void userSelectPopulationAsAndLayerDataAsThenAddLayer(String pop, String layer) {
		Udsobj.selectPopulationDataAs(pop);
		Udsobj.selectLayerDataAs(layer);
		Udsobj.addLayer();
	}

	@Then("user verify layer {string} is loaded in population & uds layers")
	public void userVerifyLayerIsLoadedInPopulationUdsLayers(String layer) {
		Assert.assertTrue(Udsobj.isLayerAdded().contains(layer));
	}

	@Then("user verify population and uds layers loaded for {string} of application type {string}")
	public void userVerifyDrawAndSelectLoadedSuccessfullyFor(String layer,String applicationType) {
		String baseUrl = "https://gisportal.hrsa.gov";
		ConfigReader configReader = new ConfigReader();
		Properties properties = configReader.init_prop();
		String env = properties.getProperty("Environment").toLowerCase();
		System.out.println(properties.getProperty("Environment").toLowerCase());
		if (env.contains("test")) {
			baseUrl = "https://gisportal.test.hrsa.gov";
		} else if (env.contains("stage")) {
			baseUrl = "https://gisportal.staging.hrsa.gov";
		}

		String url = "";
		String getColumnLayer=getLayerColumn(layer);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8619650.80566349,\"ymin\":4715858.897083988,\"xmax\":-8609866.866042992,\"ymax\":4725642.836704489}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8619650.80566349,\"ymin\":4715858.897083988,\"xmax\":-8609866.866042992,\"ymax\":4725642.836704489},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8609866.866042992,\"ymin\":4715858.897083988,\"xmax\":-8600082.926422492,\"ymax\":4725642.836704489}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8609866.866042992,\"ymin\":4715858.897083988,\"xmax\":-8600082.926422492,\"ymax\":4725642.836704489},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8600082.926422492,\"ymin\":4715858.897083988,\"xmax\":-8590298.986801991,\"ymax\":4725642.836704489}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8600082.926422492,\"ymin\":4715858.897083988,\"xmax\":-8590298.986801991,\"ymax\":4725642.836704489},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8590298.986801991,\"ymin\":4715858.897083988,\"xmax\":-8580515.04718149,\"ymax\":4725642.836704489}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8590298.986801991,\"ymin\":4715858.897083988,\"xmax\":-8580515.04718149,\"ymax\":4725642.836704489},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8580515.04718149,\"ymin\":4715858.897083988,\"xmax\":-8570731.107560992,\"ymax\":4725642.836704489}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8580515.04718149,\"ymin\":4715858.897083988,\"xmax\":-8570731.107560992,\"ymax\":4725642.836704489},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8619650.80566349,\"ymin\":4706074.957463488,\"xmax\":-8609866.866042992,\"ymax\":4715858.897083988}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8619650.80566349,\"ymin\":4706074.957463488,\"xmax\":-8609866.866042992,\"ymax\":4715858.897083988},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8609866.866042992,\"ymin\":4706074.957463488,\"xmax\":-8600082.926422492,\"ymax\":4715858.897083988}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8609866.866042992,\"ymin\":4706074.957463488,\"xmax\":-8600082.926422492,\"ymax\":4715858.897083988},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8590298.986801991,\"ymin\":4706074.957463488,\"xmax\":-8580515.04718149,\"ymax\":4715858.897083988}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8590298.986801991,\"ymin\":4706074.957463488,\"xmax\":-8580515.04718149,\"ymax\":4715858.897083988},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8580515.04718149,\"ymin\":4706074.957463488,\"xmax\":-8570731.107560992,\"ymax\":4715858.897083988}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8580515.04718149,\"ymin\":4706074.957463488,\"xmax\":-8570731.107560992,\"ymax\":4715858.897083988},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8619650.80566349,\"ymin\":4696291.017842988,\"xmax\":-8609866.866042992,\"ymax\":4706074.957463488}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8619650.80566349,\"ymin\":4696291.017842988,\"xmax\":-8609866.866042992,\"ymax\":4706074.957463488},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8609866.866042992,\"ymin\":4696291.017842988,\"xmax\":-8600082.926422492,\"ymax\":4706074.957463488}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8609866.866042992,\"ymin\":4696291.017842988,\"xmax\":-8600082.926422492,\"ymax\":4706074.957463488},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8590298.986801991,\"ymin\":4696291.017842988,\"xmax\":-8580515.04718149,\"ymax\":4706074.957463488}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8590298.986801991,\"ymin\":4696291.017842988,\"xmax\":-8580515.04718149,\"ymax\":4706074.957463488},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
		url = baseUrl + "/server/rest/services/udsmapper/ZCTA/MapServer/0/query?geometry={\"xmin\":-8580515.04718149,\"ymin\":4696291.017842988,\"xmax\":-8570731.107560992,\"ymax\":4706074.957463488}&orderByFields=OBJECTID ASC&outFields="+getColumnLayer+",OBJECTID&outSR=102100&quantizationParameters={\"extent\":{\"spatialReference\":{\"latestWkid\":3857,\"wkid\":102100},\"xmin\":-8580515.04718149,\"ymin\":4696291.017842988,\"xmax\":-8570731.107560992,\"ymax\":4706074.957463488},\"mode\":\"view\",\"originPosition\":\"upperLeft\",\"tolerance\":19.10925707128908}&resultType=tile&returnCentroid=true&returnExceededLimitFeatures=false&spatialRel=esriSpatialRelIntersects&where=1=1&geometryType=esriGeometryEnvelope&inSR=102100";
		Udsobj.isGisLoaded(url);
	}

	public String getLayerColumn(String layer){
		switch (layer){
			case "Pop: Below 200% Federal Poverty Level (%) 2018-2022":return "ACSG_200FPL_PCT";
			case "Pop: Unemployment (%) 2018-2022":return "ACSG_NOEMP_PCT";
			case "Pop: No High School Diploma, 25+ (%) 2018-2022":return "ACSG_NOHSED_PCT";
			case "Pop: White (%) 2019-2023":return "Z_WHITE";
			case "Pop: Racial/ Ethnic Minority (%) 2019-2023":return "Z_MINRACEORHISP";
			case "Pop: Other Pacific Islander (%) 2019-2023":return "Z_NH_PI";
			case "Pop: Native Hawaiian (%) 2019-2023":return "Z_NH_PI";
			case "Pop: Hispanic/Latino (%) 2019-2023":return "Z_HISP";
			case "Pop: Black (%) 2019-2023":return "Z_BLACK";
			case "Pop: Asian (%) 2019-2023":return "Z_ASIAN";
			case "Pop: American Indian/ Alaska Native (%) 2019-2023":return "Z_AI_AN";
			case "Pop: 2-yr Change in Uninsured, Est. (%) 2021, 2023":return "TP_Z2YDIFF_UNINSURED";
			case "Pop: 1-yr Change in Uninsured, Est. (%) 2022, 2023":return "TP_ZDIFF_UNINSURED";
			case "Pop: Medicaid/ Public Ins., Est. (%) 2023":return "Z_POPMCAID_OP";
			case "Pop: 2-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023":return "TP_Z2YDIFF_MEDICAID_OP";
			case "Pop: 1-yr Change in Medicaid/ Public Ins., Est. (%) 2021, 2023":return "TP_ZDIFF_MEDICAID_OP";
			case "Pop: Medicare/ Private Ins., Est. (%) 2023":return "Z_POPMCARE_PRIVATE";
			case "Pop: 2-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023":return "TP_Z2YDIFF_MCARE_PRIVATE";
			case "Pop: 1-yr Change in Medicare/ Private Ins., Est. (%) 2021, 2023":return "TP_ZDIFF_MCARE_PRIVATE";
			case "Pop: 2-yr Change in Total Population (%) 2021, 2023":return "TP_Z2YDIFF_TOTPOP";
			case "Pop: 1-yr Change in Total Population (%) 2021, 2023":return "TP_ZDIFF_TOTPOP";
			case "Pop: Uninsured, Est. (%) 2023":return "ACSG_NOINS_PCT";
			case "Pop: Below Federal Poverty Level (%) 2018-2022":return "ACSG_100FPL_PCT";
			case "Pop: 65 and Older (%) 2019-2023":return "Z_65PLUS";
			case "Pop: 18-64 (%) 2019-2023":return "Z_AGE18_64";
			case "Pop: Under 18 (%) 2019-2023":return "Z_AGE_UNDER18";
			case "Pop: Adults Ever Told Have Diabetes, Est. (%) 2022":return "GCE_DIABETES_PCT";
			case "Pop: Adults Ever Told Have High Blood Pressure, Est. (%) 2021":return "GCE_HIGHBP_PCT";
			case "Pop: Adults Who Are Binge Drinkers, Est. (%) 2022":return "GCE_BINGEDRNK_PCT";
			case "Pop: Adults Who Are Obese, Est. (%) 2022":return "CDCP_OBESITY_PCT";
			case "Pop: Adults Who Smoke, Est. (%) 2022":return "CDCP_CSMOKING_PCT";
			case "Pop: Adults With No Dental Visit in Past Year, Est. (%) 2022":return "CDCP_NODENTAL_PCT";
			case "Pop: Disability (%) 2019-2023":return "ACSG_DISABLED_PCT";
			case "Pop: Low Birthweight (%) 2022":return "AHRF_LBW_RT";
			case "Pop: Age-Adjusted Mortality Rate (per 100,000), Est. 2018-2022":return "CDCVS_AGEMORT_RT";
			case "Pop: Veterans (%) 2019-2023":return "Veterans_PCT";
			case "Pop: More Than One Race (%) 2019-2023":return "Z_2PLSRCE_PCT";
			case "Pop: Households With No Broadband (%) 2019-2023":return "No_HH_Broadband_PCT";
			case "Pop: School Aged (%) 2019-2023":return "School_Aged_PCT";


			case "HCP: Penetration of Low-Income (%) 2024":return "PEN_LOWI_COMB";
			case "HCP: 1-yr Change in Medicare/ Private Ins. (%) 2023, 2024":return "USER_ZDIFF_MCAREPRIVATE_COMB";
			case "HCP: 2-yr Change in Medicare/ Private Ins. (%) 2022, 2024":return "USER_Z2YDIFF_MEDICARE_COMB";
			case "HCP: 1-yr Change in Medicaid/ Public Ins. (%) 2023, 2024":return "USER_ZDIFF_MEDICAID_OP_COMB";
			case "HCP: 2-yr Change in Medicaid/ Public Ins. (%) 2022, 2024":return "USER_Z2YDIFF_MEDICAID_OP_COMB";
			case "HCP: 1-yr Change in Uninsured, (%) 2023, 2024 ":return "USER_ZDIFF_UNINSURED_COMB";
			case "HCP: 2-yr Change in Uninsured, (%) 2022, 2024 ":return "USER_Z2YDIFF_UNINSURED_COMB";
			case "HCP: 1-yr Change in Patients (%) 2023, 2024":return "USER_ZDIFF_COMB";
			case "HCP: 2-yr Change in Patients (%) 2022, 2024":return "USER_Z2YDIFF_COMB";
			case "HCP: Medicare/ Private Ins. Not Served by Health Centers (#) 2024":return "UNSRVD_MCARE_PRIVATE_COMB";
			case "HCP: Low-Income Not Served by Health Centers (#) 2024":return "UNSRVD_LOW_COMB";
			case "HCP: Uninsured Not Served by Health Centers (#) 2024 ":return "UNSRVD_UNINSURED_COMB";
			case "HCP: Medicaid/ Public Ins. Not Served by Health Centers (#) 2024":return "UNSRVD_MCAID_OP_COMB";
			case "HCP: Medicare/Private Ins. (%) 2024":return "Z_POPMCARE_PRIVATE";
			case "HCP: Medicaid/Public Ins. (%) 2024":return "Z_POPMCAID_OP";
			case "HCP: Uninsured (%) 2024":return "Z_POPUNINSURED";
			case "HCP: Dominant Health Center 2024":return "USERS_ALL_COMB";
			case "HCP: Health Center Count 2024":return "TOT_GRANTEES_COMB";
			case "HCP: Penetration of Medicare/Private Ins. (%) 2024":return "PEN_MCARE_PRIVATE_COMB";
			case "HCP: Penetration of Medicaid/Public Ins. (%) 2024":return "PEN_MCAID_OP_COMB";
			case "HCP: Penetration of Uninsured Population (%) 2024":return "PEN_UNINSURED_COMB";
			case "HCP: Penetration of Total Population (%) 2024":return "PEN_TP_COMB";
			case "HCP: Uninsured (#) 2024":return "USERS_UNINSURED_COMB";
			case "HCP: Medicaid/Public Ins. (#) 2024":return "USERS_MEDICAID_OP_COMB";
			case "HCP: Medicare/Private Ins. (#) 2024":return "Users_Medicare_Comb";
			case "HCP: Not Served by Health Centers (#) 2024":return "UNSRVD_TOT_COMB";
			case "HCP: #1 Dominant Health Center Share of Patients (%) 2024":return "DOM1_ZDOM_COMB";
			case "HCP: #2 Dominant Health Center Share of Patients (%) 2024":return "DOM2_ZDOM_COMB";
			case "HCP: #3 Dominant Health Center Share of Patients (%) 2024":return "DOM3_ZDOM_COMB";
			case "HCP: #4 Dominant Health Center Share of Patients (%) 2024":return "DOM4_ZDOM_COMB";
			case "HCP: #5 Dominant Health Center Share of Patients (%) 2024":return "DOM5_ZDOM_COMB";
			default:return null;
		}
	}
	@And("user select population as {string} and layer data as {string} then add layer for {string}")
	public void userSelectPopulationAsAndLayerDataAsThenAddLayer(String pop, String layer, String type) {
		Udsobj.selectPopulationDataAs(pop);
		Udsobj.selectLayerDataAs(layer);
		Udsobj.selectType(type);
		Udsobj.addLayer();
	}

	@Then("Add the all the columns to data table")
	public void add_all_the_columns_to_data_table() {
		Udsobj.selectAllColumns();

	}

	@And("click on download the data")
	public void clickOnDownloadTheData() {
		Udsobj.downloadTheData();
	}
	List<LinkedHashMap<String, String>> data;
	@And("user read csv file {string} from downloads from rows {string} to {string} for geocare")
	public void userReadCsvFileFromDownloadsFromRows(String fileName, String startRow, String endRow) {
		CsvReadAndWrite csvReadAndWrite = new CsvReadAndWrite("./src/test/java/Datadownload/" + fileName);
		data = csvReadAndWrite.readDataWithHeadersAreFromStart(Integer.parseInt(startRow), Integer.parseInt(endRow));
		System.out.println(data);
	}
	ArrayList<HashMap<String, Object>> dbresult;
	@And("user get db data for {string} in geocare for default columns for zcta {string}")
	public void userVerifyGridDataAndDbDataSameForInGeocareForDefaultColumns(String option,String zcta) {
		DBFramework dbFramework = new DBFramework();
		LoadQueries loadQueries = new LoadQueries();
		switch (option.toLowerCase()) {
			case "combined":
				System.out.println(loadQueries.getQuery("combinedGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("combinedGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
			case "lal":
				System.out.println(loadQueries.getQuery("lalGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("lalGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
			case "awardees":
				System.out.println(loadQueries.getQuery("awardeesGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("awardeesGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
		}
	}

	@Then("user verify downloaded data and db data same for geocare")
	public void userVerifyDownloadedDataAndDbDataSameForHighNeedMappingTool() {
		Assert.assertEquals(data.size(), dbresult.size());
		dbresult.forEach(map ->
				map.replaceAll((key, value) -> value == null ? "" : value)
		);

		data.forEach(map -> {
					map.replaceAll((key, value) -> value == null ? "" : value);
				}
		);
		Set<String> dbSet = new HashSet<>();
		Set<String> gridSet = new HashSet<>();

		for (HashMap<String, Object> dbRow : dbresult) {
			dbSet.add(formatMap(dbRow));
		}
		for (Map<String, String> gridRow : data) {
			gridSet.add(formatMap(gridRow));
		}

		if (dbSet.equals(gridSet)) {
			System.out.println("Both dbResult and downloaded match.");
		} else {
			System.out.println("Mismatch found:");

			Set<String> dbOnly = new HashSet<>(dbSet);
			dbOnly.removeAll(gridSet);
			if (!dbOnly.isEmpty()) {
				System.out.println("Records present in dbResult but missing in downloaded data:");
				dbOnly.forEach(System.out::println);
			}

			Set<String> gridOnly = new HashSet<>(gridSet);
			gridOnly.removeAll(dbSet);
			if (!gridOnly.isEmpty()) {
				System.out.println("Records present in downloaded data but missing in dbResult:");
				gridOnly.forEach(System.out::println);
			}
		}
		Assert.assertEquals(gridSet, dbSet);
	}
	private String formatMap(Map<String, ?> map) {
		return map.entrySet().stream()
				.sorted(Map.Entry.comparingByKey()) // Ensure consistent ordering
				.map(entry -> entry.getKey() + "=" + normalizeValue(entry.getValue()))
				.collect(Collectors.joining(", "));
	}
	private String normalizeValue(Object value) {
		if (value instanceof Number) {
			return String.format("%.1f", ((Number) value).doubleValue());
		} else if (value instanceof String) {
			try {
				double num = Double.parseDouble((String) value);
				return String.format("%.1f", num);
			} catch (NumberFormatException e) {
				return (String) value;
			}
		}
		return value.toString();
	}

	@And("user get db data for {string} in geocare for all columns for zcta {string}")
	public void userVerifyGridDataAndDbDataSameForInGeocareForAllColumns(String option,String zcta) {
		DBFramework dbFramework = new DBFramework();
		LoadQueries loadQueries = new LoadQueries();
		switch (option.toLowerCase()) {
			case "combined":
				System.out.println(loadQueries.getQuery("combinedGeoCareAllColumns").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("combinedGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
			case "lal":
				System.out.println(loadQueries.getQuery("lalGeoCareAllColumns").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("lalGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
			case "awardees":
				System.out.println(loadQueries.getQuery("awardeesGeoCareAllColumns").replaceAll("<zcta_code>",zcta));
				//dbresult = dbFramework.executeStatementSet(loadQueries.getQuery("awardeesGeoCareDefaultColumn").replaceAll("<zcta_code>",zcta), 30);
				break;
		}
	}
}
