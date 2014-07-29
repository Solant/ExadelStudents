package com.services.tables;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ExcelTableService {
    private HSSFWorkbook workBook;
    private HSSFSheet sheet;
    private Row currentRow;
    private int currentRowNum;
    private int currentCellNum;

    public ExcelTableService() {
        workBook = new HSSFWorkbook();
        sheet = workBook.createSheet();
        currentRowNum = 0;
        currentCellNum = 0;
    }

    public void addNewRow() {
        currentRow = sheet.createRow(currentRowNum);
        currentRowNum++;
        currentCellNum = 0;
    }

    public void addNewCell(String value) {
        Cell cell = currentRow.createCell(currentCellNum);
        cell.setCellValue(value);
        currentCellNum++;
    }

    public void addDateAsString(){
        Row row = sheet.createRow(currentRowNum + 2);
        Cell cell = row.createCell(0);
        Calendar date = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
        cell.setCellValue(sdf.format(date.getTime()));
    }

    public void writeInStream(OutputStream os) {
        try {
            workBook.write(os);
            os.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
