package PageObjectRepository;

import java.io.File;
import java.time.Duration;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import io.github.sukgu.Shadow;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.qa.Factory.Driverfactory;

public class UDSMApperObject {
	private WebDriver driver;
	@FindBy(xpath = "//p[text()='View Requirements List']/following-sibling::div//p[contains(text(),'Note')]")
	private WebElement UdsReqNote;

	public UDSMApperObject(WebDriver driver) {
		this.driver = driver;
	}

	private CommonObject cobj = new CommonObject(Driverfactory.getDriver());

	public void selectApplicationtype(String app) {
		driver.findElement(By.xpath("//div[@class='menu-screen-list-of-checkbox']//span[text()='" + app + "']/input"))
				.click();
	}

//	public String clicktasklist(String task){
	// return
	// driver.findElement(By.xpath("//h3[text()='"+string2+"']/following::p")).getText();
	// }

	public void Buttonexist(String btn) {
		Assert.assertEquals(true, driver.findElement(By.xpath("//button[text()='" + btn + "']")).isDisplayed());

	}

	public WebElement Underlinetext(String linktext) {
		return driver.findElement(By.xpath("//*[text()='" + linktext + "']"));
	}

	public void ClickOnAction_task(String action, String task) {

		By locator = By.xpath("//table[@class='requirement-table']/tbody/tr/td[text()='" + task
				+ "']/following::td[1]/button[text()='" + action + "']");
		cobj.waitUntilElementToBeVisible(locator);
		driver.findElement(locator).click();
	}

	public String verifyparagraphOnUDS(String string2) {
		return driver.findElement(By.xpath("//p[text()='" + string2 + "']")).getText();

	}

	public boolean Verifytextonpage(String text) {
		return driver.findElement(By.xpath("//*[text()='" + text + "']")).isDisplayed();
	}

	public void enterTextarea(String txt) {
		driver.findElement(By.xpath("//textarea")).sendKeys(txt);
	}

	public int Udsmappertasktablesize() {
		return driver.findElements(By.xpath("//table[@class='requirement-table']/tbody/tr")).size();

	}

	public String getTasklist(int i, int j) {
		return driver.findElement(By.xpath("//table[@class='requirement-table']/tbody/tr[" + i + "]/td[" + j + "]"))
				.getText();
	}

	public String getZCTAvalidationlist(int i, int j) {
		By locator = By.xpath("//div[contains(@class,'popup-table')]");
		cobj.waitUntilElementToBeVisible(locator);
		return driver.findElement(By.xpath("//table/tbody/tr[" + i + "]/td[" + j + "]")).getText();
	}

	public String getReqlist(String x, int i) {
		return driver.findElement(By.xpath("//p[text()='" + x + "']/following-sibling::ul[1]/li[" + i + "]")).getText();

	}

	public String getReqsublist(String x, int i, int j) {
		return driver.findElement(By
				.xpath("//p[text()='" + x + "']/following-sibling::ul[1]/li[" + i + "]/following::ul[1]/li[" + j + "]"))
				.getText();

	}

	public String getNote() {
		return driver.findElement(By.xpath("//p[contains(text(),'Note')]")).getText();

	}

	public boolean getUDSMapperPageTitle(String section) {
		// By locator = By.xpath("//h3[text()='" + section + "']");
		By locator = By.xpath("//*[text()='" + section + "']");
		cobj.waitUntilElementToBeVisible(locator);

		return driver.findElement(locator).isDisplayed();

	}

	public String getInstruction(String sectionname, int i) {
		return driver.findElement(By.xpath("//*[text()='" + sectionname + "']/following::p[" + i + "]")).getText();

	}

	public String getInstructionLineItems(String sectionname, int i) {
		return driver.findElement(By.xpath("//*[text()='" + sectionname + "']/following::li[" + i + "]")).getText();

	}

	public String getH2HeaderTitle() {
		return driver.findElement(By.xpath("(//h2)[1]")).getText();
	}

	public boolean optionDisplayed(String objectName) {
		return driver.findElement(By.xpath("//button[text()='" + objectName + "']")).isDisplayed();
	}

	public boolean optionDisplayedUnderDrawOnMap(String option) {
		return driver.findElement(By.xpath("//button[@title='" + option + "']")).isDisplayed();
	}

	public void clickOnOption(String objectName) {
		driver.findElement(By.xpath("//button[text()='" + objectName + "']")).click();
	}

	public void clickOnOptionUnderDrawOnMap(String objectName) {
		driver.findElement(By.xpath("//button[@title='" + objectName + "']")).click();
	}

	public void searchZctaOnSearchBar(String zcta) {
		driver.findElement(By.id("FeatureSearchBox")).sendKeys(zcta);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		// wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[contains(text(),'"+zcta+"')]/..//span[@title='Add']")));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='result-title']")));
		//
		// driver.findElement(By.xpath("//div[@class='result-control']/span[@title='Add']")).click();
	}

	public List<String> getSearchResultsOptions() {
		List<WebElement> elements = driver.findElements(By.xpath("//div[@class='result-title']"));
		List<String> data = new ArrayList<>();
		for (WebElement result : elements)
			data.add(result.getText());
		return data;
	}

	public void clickAddOnZcta(String zcta) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions
				.visibilityOfElementLocated(By.xpath("//div[contains(text(),'" + zcta + "')]/..//span[@title='Add']")))
				.click();
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='zcta-grid-item']")));
	}

	public boolean isZctaSearchedPresentInLeftPanel(String zcta) {
		return !driver.findElements(By.xpath("//div[@class='zcta-grid-item']//span[text()='" + zcta + "']")).isEmpty();
	}

	public boolean isZctaSearchedNotPresentInLeftPanel(String zcta) {
		return driver.findElements(By.xpath("//div[@class='zcta-grid-item']//span[text()='" + zcta + "']")).isEmpty();
	}

	public boolean isZctaSearchedDeleteButtonPresentInLeftPanel(String zcta) {
		return !driver.findElements(By.xpath("//span[text()='" + zcta + "']/../..//span[@title='Delete']")).isEmpty();
	}

	public void deleteZcta(String zcta) {
		driver.findElement(By.xpath("//span[text()='" + zcta + "']/../..//span[@title='Delete']")).click();
	}

	public void clickOptionOnMap(String mapOption) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
//		wait.until(ExpectedConditions
//				.visibilityOfElementLocated(By.xpath("//button[@aria-label='" + mapOption + "']")));
		driver.findElement(By.xpath("//button[@aria-label='" + mapOption + "']")).click();
		
		switch (mapOption.toLowerCase()) {
		case "print report":
			wait.until(ExpectedConditions
					.visibilityOfElementLocated(By.xpath("//label[@aria-label='Map and Legend']/..")));
			break;
		case "map layers":
			wait.until(ExpectedConditions
					.visibilityOfElementLocated(By.xpath("//div[contains(@class,'widget-layerlist')]")));
			break;
		}

	}

	public boolean isPrintSelectOptions(String data) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[text()='" + data + "']")));
		return driver.findElement(By.xpath("//div[text()='" + data + "']")).isDisplayed();
	}

	public void exportTheMap(String filname, String pageSetup, String fileFormat) throws InterruptedException {
		driver.findElement(By.id("EnterTitle")).sendKeys(filname);
		Select select = new Select(driver.findElement(By.id("PageSetup")));
		select.selectByVisibleText(pageSetup);
		select = new Select(driver.findElement(By.id("FileFormat")));
		select.selectByVisibleText(fileFormat);
		driver.findElement(By.xpath("//button[text()='Export']")).click();
		Thread.sleep(15000);
	}

	public void selectWidgetbutton(String button) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[@aria-label='" + button + "']")));
		driver.findElement(By.xpath("//button[@aria-label='" + button + "']")).click();

	}

	public void selectbaseoption(String option) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[text()='" + option + "']/parent::div")));
		driver.findElement(By.xpath("//*[text()='" + option + "']/parent::div")).click();
	}

	public void basemapOptionselected(String option) {
		String selectedoption;
		driver.findElement(By.xpath("//[text()='" + option + "']")).click();
		selectedoption = driver.findElement(By.xpath("//li[contains(@class,'selected')]//span")).getText();
		Assert.assertEquals(option, selectedoption);
	}

	public void ClickonCaret(String option) {
		By locator = By.xpath("//button[contains(@class,'1hu825c')][@title='Show/Hide Panel']");
		cobj.waitUntilElementToBeVisible(locator);

		if (driver.findElement(locator).getAttribute("aria-expanded") == "false") {
			driver.findElement(locator).click();
			By locator1 = By.xpath("//table[@class='zcta-data-table']");
			Assert.assertEquals(driver.findElement(locator1).isDisplayed(), true);
		}
	}

	public void uploadfile(String fileName) {
		File file = new File("./TestDataConfig/InputData/" + fileName);
		Assert.assertTrue(file.exists());
		cobj.sleep(2);
		driver.findElement(By.xpath("//input[@type='file']")).sendKeys(file.getAbsolutePath());

	}

	public List<String> ZCTAonNavigationPanel() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions
				.visibilityOfElementLocated(By.xpath("//div[@class='zcta-grid-item']/div/span[not(@title='Delete')]")));
		List<WebElement> elements = driver
				.findElements(By.xpath("//div[@class='zcta-grid-item']/div/span[not(@title='Delete')]"));
		// System.out.println("list on ui "+ elements.size());
		List<String> data = new ArrayList<>();
		// data.add("ZCTAs");
		for (int i = 0; i < elements.size(); i++) {
			data.add(elements.get(i).getText());
		}
		return data;
	}

	public void enterAddressSite(String addressSite) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("SearchLocation"))).sendKeys(addressSite);
	}

	public void clickOnPrintReportOption(String data) {
		driver.findElement(By.xpath("//div[text()='" + data + "']/input")).click();
	}

	public void clickAddOnAddress(String zcta) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOfElementLocated(
				By.xpath("//div[contains(text(),'" + zcta + "')]/..//span[contains(@title,'Add')]"))).click();
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='my-data-row']")));
	}

	public void enterAdditionalNotes(String notes) {
		driver.findElement(By.xpath("//textarea")).sendKeys(notes);
	}

	public void expandTheBottomViewPanel() {
		driver.findElement(By.xpath("(//button[@title='Expand'] )[1]")).click();
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[text()='Selected Sites']")));
	}

	public void closePrintPopup() {
		driver.findElement(By.xpath("//button[@title='Close']")).click();
	}

	public List<String> gridZtaData() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions
				.visibilityOfElementLocated(By.xpath("//table[@aria-label='ZCTA Data Table']//tr/td[1]")));
		List<WebElement> elements = driver.findElements(By.xpath("//table[@aria-label='ZCTA Data Table']//tr/td[1]"));
		List<String> data = new ArrayList<>();
		for (int i = 1; i < elements.size(); i++) {
			data.add(elements.get(i).getText());
		}
		return data;
	}

	public List<String> gridSelectedSitesData() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(
				ExpectedConditions.visibilityOfElementLocated(By.xpath("//table[@class='zcta-data-table']//tr/td[1]")));
		List<WebElement> elements = driver.findElements(By.xpath("//table[@class='zcta-data-table']//tr/td[1]"));
		List<String> data = new ArrayList<>();
		for (int i = 0; i < elements.size(); i++) {
			data.add(elements.get(i).getText());
		}
		return data;
	}
	//327-332
	public boolean isLayerPresent(String layer) {
		Shadow shadow=new Shadow(driver);
		return shadow.findElementByXPath("//calcite-list-item[contains(@title,'"+layer+"')]").isDisplayed();

	}

	public List<String> getAllSubMapLayersData(String Layer) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[text()='" + Layer
				+ "']/ancestor::li//div[@data-parent-visibility='independent']/span[@class='esri-layer-list__item-title']")));
		List<WebElement> elements = driver.findElements(By.xpath("//span[text()='" + Layer
				+ "']/ancestor::li//div[@data-parent-visibility='independent']/span[@class='esri-layer-list__item-title']"));
		List<String> layers = new ArrayList<>();
		for (WebElement element : elements)
			layers.add(element.getText());

		return layers;
	}

	public void selectoptionalcolumn(String columnname) {

		driver.findElement(By.xpath("//div[@class='dropdown']/button[@title='Show/Hide columns']")).click();

		JavascriptExecutor js = (JavascriptExecutor) driver;

		String xpath = "//div[@class='dropdown']/button[@title='Show/Hide columns']/following-sibling::div[@class='dropdown-content']/label[contains(text(),'"
				+ columnname + "')]";
		System.out.println("Axpath " + xpath);
		List<WebElement> elements = driver.findElements(By.xpath(xpath));

		for (WebElement element : elements) {
			System.out.println("ssdfsdf  " + element.getText());
			System.out.println("sfdf  " + columnname);
			if (element.getText().equals(columnname.trim())) {
				System.out.println("Column expected " + columnname);
				System.out.println("Column actual " + element.getText());
				js.executeScript("arguments[0].scrollIntoView();", element);
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				element.click();
				break;
			}
		}

		driver.findElement(By.xpath("//div[@class='dropdown']/button[@title='Show/Hide columns']")).click();
	}

	//386-422
	public void hideLayer(String layer) throws InterruptedException {

		Shadow shadow=new Shadow(driver);
		Thread.sleep(5000);
		WebDriverWait wait=new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOf(shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]")));
		if (shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]").getAttribute("aria-label")
				.startsWith("Hide")) {
			Actions act = new Actions(driver);
			act.moveToElement(shadow.findElementByXPath("//*[contains(@title,'" + layer + "')]")).build().perform();
			Thread.sleep(1000);
			shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]").click();
			Thread.sleep(2000);
		}

	}

	public void showLayer(String layer) throws InterruptedException {

		Shadow shadow=new Shadow(driver);
		if (shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]").getAttribute("aria-label")
				.startsWith("Show")) {
			Actions act = new Actions(driver);
			act.moveToElement(shadow.findElementByXPath("//*[contains(@title,'" + layer + "')]")).build().perform();
			Thread.sleep(1000);
			shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]").click();
			Thread.sleep(2000);
		}

	}

	public boolean layerVisibleOnMap(String layer) {

		Shadow shadow=new Shadow(driver);
		return shadow.findElementByXPath("//button[contains(@aria-label,'" + layer + "')]").getAttribute("aria-label")
				.startsWith("Hide");

	}

	public void selectOption(String layer, String option) {

		cobj.waitUntilElementToBeVisible(By.xpath("//span[text()=\"" + layer + "\"]/../././..//div[@title='Options']"))
				.click();
		cobj.waitUntilElementToBeVisible(
				By.xpath("//span[text()=\"" + layer + "\"]/../../..//li[@title='" + option + "']")).click();
	}

	public boolean isOptionPresent(String layer, String option) {

		return driver.findElement(By.xpath("//span[text()=\"" + layer + "\"]/../../..//li[@title='" + option + "']"))
				.isDisplayed()
				&& driver
						.findElement(By.xpath("//span[text()=\"" + layer + "\"]/../../..//li[@title='" + option + "']"))
						.isEnabled();
	}

	public List<String> gridTableColumnname() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(30));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//table[@class='zcta-data-table']//tr/th")));// table[@aria-label='ZCTA
		// Data
		// Table']//tr/th[4]
		driver.findElement(By.xpath("//table[@class='zcta-data-table']//tr/th")).click();
		List<WebElement> elements = driver.findElements(By.xpath("//table[@class='zcta-data-table']//tr/th"));
		System.out.println("column size on application " + elements.size());
		List<String> columns = new ArrayList<>();
		for (WebElement element : elements) {
			columns.add(element.getText());
		}
		return columns;
	}

	public void uploadFile(String fileName) {
		File file = new File("./TestDataConfig/InputData/" + fileName);
		Assert.assertTrue(file.exists());
		cobj.sleep(2);
		driver.findElement(By.xpath("//input[@type='file']")).sendKeys(file.getAbsolutePath());
	}

	public String getValidationMessage() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		return wait.until(
				ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[@class='validation-error-message']")))
				.getText();
	}

	public void selectTheColumns(Map<String, String> columns) {
		for (Map.Entry<String, String> col : columns.entrySet()) {
			WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("C_CITY")));
			Select select;
			switch (col.getKey().toLowerCase()) {
			case "address":
				select = new Select(driver.findElement(By.id("C_ADDRESS")));
				select.selectByVisibleText(col.getValue());
				break;
			case "city":
				select = new Select(driver.findElement(By.id("C_CITY")));
				select.selectByVisibleText(col.getValue());
				break;
			case "state":
				select = new Select(driver.findElement(By.id("C_STATE")));
				select.selectByVisibleText(col.getValue());
				break;
			case "zip code":
				select = new Select(driver.findElement(By.id("C_ZIP_CODE")));
				select.selectByVisibleText(col.getValue());
				break;
			case "site name":
				select = new Select(driver.findElement(By.id("C_SITE_NAME")));
				select.selectByVisibleText(col.getValue());
				break;
			case "site type":
				select = new Select(driver.findElement(By.id("C_SITE_TYPE")));
				select.selectByVisibleText(col.getValue());
				break;
			}

		}
	}

	public void enterTitle(String title) {
		driver.findElement(By.id("TitleTextBox")).sendKeys(title);
	}

	public List<String> getAddedDeliverySite() {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='my-data-row']")));
		List<WebElement> elements = driver.findElements(By.xpath("//div[@class='my-data-row']"));
		List<String> data = new ArrayList<>();
		for (WebElement result : elements)
			data.add(result.getText());
		return data;
	}
	//line 513-531
	public List<LinkedHashMap<String, String>> serviceDeliveryGridData() {
		List<LinkedHashMap<String, String>> applicationData = new ArrayList<>();
		List<String> headersData = new ArrayList<>();
		List<WebElement> headers = driver.findElements(By.xpath("//th"));
		for (WebElement header : headers) {
			headersData.add(header.getText());
		}
		List<WebElement> rows = driver.findElements(By.xpath("//table/tbody/tr"));
		for (int j=0;j<rows.size();j++) {
			LinkedHashMap<String, String> rowData = new LinkedHashMap<>();
			for (int i = 0; i < headersData.size(); i++) {
				cobj.scroll_JS(By.xpath("(//table/tbody/tr)["+(j+1)+"]//td[" + (i + 1) + "]"));
				String data = driver.findElement(By.xpath("(//table/tbody/tr)["+(j+1)+"]//td[" + (i + 1) + "]")).getText();
				rowData.put(headersData.get(i), data);
			}
			applicationData.add(rowData);
		}
		return applicationData;
	}

public List<LinkedHashMap<String,String>> zctaGridData(){
    List<LinkedHashMap<String,String>> applicationData=new ArrayList<>();
    List<String> headersData=new ArrayList<>();
    List<WebElement> headers=driver.findElements(By.xpath("//th"));
    for(WebElement header:headers){
        headersData.add(header.getText());
    }
    List<WebElement> rows=driver.findElements(By.xpath("//table/tbody/tr"));
    for(int row=1; row<rows.size();row++){
        LinkedHashMap<String,String> rowData=new LinkedHashMap<>();
        for(int i=0;i<headersData.size();i++){
            String data=rows.get(row).findElement(By.xpath("td["+(i+1)+"]")).getText();
            rowData.put(headersData.get(i),data);
        }
        applicationData.add(rowData);
    }
    return applicationData;
}

public void selectZctaOption(String option){
    driver.findElement(By.xpath("//input[@id='"+option.toLowerCase()+"']")).click();
    cobj.sleep(2);
}

	public void spanButtonExist(String btn) {
		Assert.assertEquals(true, driver.findElement(By.xpath("//span[text()='" + btn + "']")).isDisplayed());

	}
	//563
	public void expandLayer(String layer) {
		Shadow shadow = new Shadow(driver);
		((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", shadow.findElementByXPath(driver.findElement(By.xpath("//calcite-list-item[@title='" + layer + "']")), "//div[@title='Expand']"));
		shadow.findElementByXPath(driver.findElement(By.xpath("//calcite-list-item[@title='" + layer + "']")), "//div[@title='Expand']").click();

	}


	public void collapseLayer(String layer) {
		Shadow shadow = new Shadow(driver);
		shadow.findElementByXPath(driver.findElement(By.xpath("//calcite-list-item[@title='" + layer + "']")), "//div[@title='Collapse']").click();

	}

	public void clickOnMiddleOfMap(){
		cobj.sleep(30);
		WebElement canvas = driver.findElement(
				By.xpath("//div[@role='application']//canvas")
		);

		int xOffset = 650;   // horizontal pixels from canvas left
		int yOffset = 600;   // vertical pixels from canvas top

		Actions actions = new Actions(driver);
		actions.moveToElement(canvas, xOffset, yOffset).build().perform();
		actions.click().build().perform();

	}
	//591
	public void clickOnPlayButton(){
		cobj.waitUntilElementToBeVisible(By.xpath("//span[@title='Go To']")).click();
	}

	public boolean isLegendLayerPresent(String layer) {
		cobj.waitUntilElementToBeVisible(By.xpath("//h3[text()='"+layer+"']"));
		return driver.findElement(By.xpath("//h3[text()='"+layer+"']")).isDisplayed();

	}

	public List<String> getSubLegendData(String legend){
		cobj.waitUntilElementToBeVisible(By.xpath("//h3[text()='"+legend+"']/..//div[contains(@class,'layer-cell--info')]"));
		List<String> data=new ArrayList<>();
		List<WebElement> subLayers=driver.findElements(By.xpath("//h3[text()='"+legend+"']/..//div[contains(@class,'layer-cell--info')]"));
		for(WebElement subLayer : subLayers) {
			data.add(subLayer.getText());
		}
		return data;
	}

	public void selectPopulationDataAs(String data){
		cobj.waitUntilElementToBeVisible(By.xpath("(//button[@data-testid='dropdownBtn'])[1]")).click();
		cobj.waitUntilElementToBeVisible(By.xpath("//button[text()='"+data+"']")).click();
	}


	public void selectLayerDataAs(String data){
		cobj.waitUntilElementToBeVisible(By.xpath("(//button[@data-testid='dropdownBtn'])[2]")).click();
		cobj.waitUntilElementToBeVisible(By.xpath("//button[text()='"+data+"']")).click();
	}

	public void addLayer(){
		driver.findElement(By.xpath("//button[text()='Add Layer']")).click();
	}

	public String isLayerAdded(){
		return cobj.waitUntilElementToBeVisible(By.xpath("//h3[@role='heading']")).getText();
	}

	public boolean isGisLoaded(String url){
		System.out.println(url);
		driver.get(url);
		System.out.println(cobj.waitUntilElementToBeVisible(By.xpath("//i[contains(text(),'records')]")).getText());
		return cobj.waitUntilElementToBeVisible(By.xpath("//i[contains(text(),'records')]")).isDisplayed();
	}

	public void selectType(String type){
		cobj.waitUntilElementToBeVisible(By.xpath("//label[text()='"+type+"']")).click();
	}

	public void selectAllColumns() {

		driver.findElement(By.xpath("//div[@class='dropdown']/button[@title='Show/Hide columns']")).click();
		cobj.sleep(5);
		List<WebElement> elements=driver.findElements(By.xpath("//div[@class='dropdown-content']//label"));

		for (int  i=0;i<elements.size();i++) {
			cobj.scroll_JS(By.xpath("(//div[@class='dropdown-content']//label/input)["+(i+1)+"]"));
			System.out.println(elements.get(i).isSelected());
			if (!driver.findElement(By.xpath("(//div[@class='dropdown-content']//label/input)["+(i+1)+"]")).isSelected()) {
				elements.get(i).click();
			}
		}

		driver.findElement(By.xpath("//div[@class='dropdown']/button[@title='Show/Hide columns']")).click();
	}


	public void downloadTheData() {

		driver.findElement(By.xpath("//span[@title='Export CSV Data']")).click();
		cobj.sleep(5);

	}
}

