package com.qa.util;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import com.qa.Factory.Driverfactory;

import PageObjectRepository.CommonObject;

public class CsvReadAndWrite {


    private CSVParser csvParser;
    private CommonObject cobj = new CommonObject(Driverfactory.getDriver());
    public CsvReadAndWrite(String fileName) {
    	cobj.findFile(new File(fileName));  
        if (fileName.endsWith(".csv")) {
            try {        
                csvParser = new CSVParser(new FileReader(fileName), CSVFormat.DEFAULT);
            }catch (Exception e) {
                e.printStackTrace();
            }


        }

    }
   
    public List<LinkedHashMap<String, String>> readData() {
        List<LinkedHashMap<String, String>> data = new ArrayList<>();
        try {
            List<CSVRecord> records = csvParser.getRecords();
            for (int i = 1; i < records.size(); i++) {
                LinkedHashMap<String, String> rowData = new LinkedHashMap<>();
                CSVRecord record = records.get(i);
                for (int j = 0; j < record.size(); j++) {
                    rowData.put(records.get(0).get(j).trim(), record.get(j).trim());
                }
                data.add(rowData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public List<LinkedHashMap<String, String>> readData(int startRow,int endRow) {
        List<LinkedHashMap<String, String>> data = new ArrayList<>();
        try {
            List<CSVRecord> records = csvParser.getRecords();
            System.out.println(records.size());
            for (int i = startRow; i < endRow; i++) {
                LinkedHashMap<String, String> rowData = new LinkedHashMap<>();
                CSVRecord record = records.get(i);
                for (int j = 0; j < record.size(); j++) {
                    rowData.put(records.get(startRow-1).get(j).trim(), record.get(j).trim());
                }
                data.add(rowData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }


    public List<LinkedHashMap<String, String>> readDataWithHeadersAreFromStart(int startRow,int endRow) {
        List<LinkedHashMap<String, String>> data = new ArrayList<>();
        try {
            List<CSVRecord> records = csvParser.getRecords();
            System.out.println(records.size());
            for (int i = startRow; i < endRow; i++) {
                LinkedHashMap<String, String> rowData = new LinkedHashMap<>();
                CSVRecord record = records.get(i);
                for (int j = 0; j < record.size(); j++) {
                    rowData.put(records.get(0).get(j).trim(), record.get(j).trim());
                }
                data.add(rowData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

}
