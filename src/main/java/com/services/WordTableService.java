package com.services;

import org.apache.poi.xwpf.usermodel.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class WordTableService {

    private XWPFDocument document;
    private XWPFTable table;
    private XWPFTableRow currentRow;
    private XWPFParagraph cellParagraph;
    private int currentRowNum;
    private int currentCellNum;

    public WordTableService() {
        document = new XWPFDocument();
        table = document.createTable();
        currentRowNum = 0;
        currentCellNum = 0;

    }

    public WordTableService(String title) {
        document = new XWPFDocument();
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun paragraphRun = paragraph.createRun();
        paragraphRun.setBold(true);
        paragraphRun.setFontSize(20);
        paragraphRun.setText(title);
        table = document.createTable();
    }


    public void addNewRow() {
        XWPFTableRow row;
        if (currentRowNum != 0) row = table.createRow();
        else row = table.getRow(0);
        currentRowNum++;
        currentCellNum = 0;
        currentRow = row;
    }

    public void addNewCell(String value) {
        XWPFTableCell cell = currentRow.getCell(currentCellNum);
        if (cell == null) cell = currentRow.createCell();
        cell.setText(value);
        if(currentRowNum == 0) cell.setColor("blue");
        currentCellNum++;
    }


    public void addDateAsString(){
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun paragraphRun = paragraph.createRun();
        paragraphRun.setItalic(true);
        Calendar date = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.mm.yyyy");
        paragraphRun.setText(sdf.format(date.getTime()));
    }


    public void writeInStream(OutputStream os) {
        try {
            document.write(os);
            os.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}