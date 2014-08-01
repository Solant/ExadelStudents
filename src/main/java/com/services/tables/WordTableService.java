package com.services.tables;

import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;
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
        table.getCTTbl().getTblPr().getTblW().setW(BigInteger.valueOf(5000));

        table.getCTTbl().getTblPr().getTblW().setType(STTblWidth.PCT);
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
        table.getCTTbl().getTblPr().getTblW().setW(BigInteger.valueOf(5000));

        table.getCTTbl().getTblPr().getTblW().setType(STTblWidth.PCT);
    }

    public WordTableService(boolean isA4, String title){
        document = new XWPFDocument();
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun paragraphRun = paragraph.createRun();
        paragraphRun.setBold(true);
        paragraphRun.setFontSize(20);
        paragraphRun.setText(title);
        table = document.createTable();
    }

    public WordTableService(boolean isA4) {
        document = new XWPFDocument();
        table = document.createTable();
        currentRowNum = 0;
        currentCellNum = 0;

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
        currentCellNum++;
    }


    public void addDateAsString(){
        XWPFParagraph paragraph = document.createParagraph();
        XWPFRun paragraphRun = paragraph.createRun();
        paragraphRun.setItalic(true);
        Calendar date = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
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