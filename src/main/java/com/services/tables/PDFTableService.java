package com.services.tables;

import java.io.FileOutputStream;
import java.util.Date;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class PDFTableService {

    private Document document;
    private PdfPTable table;
    private Paragraph paragraph;
    private int numberOfCell;
    private int numberOfColumns;

    public PDFTableService(int numberOfColumns, OutputStream os) {
        document = new Document();
        try {
            PdfWriter.getInstance(document, os);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        document.open();
        paragraph = new Paragraph("Table");
        paragraph.setAlignment(100);
        table = new PdfPTable(numberOfColumns);

        numberOfCell = 0;
        this.numberOfColumns = numberOfColumns;
    }

    public PDFTableService(String title, int numberOfColumns, OutputStream os) {

        document = new Document();
        try {
            PdfWriter.getInstance(document, os);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        document.open();
        paragraph = new Paragraph(title);
        table = new PdfPTable(numberOfColumns);

        numberOfCell = 0;
        numberOfColumns = numberOfColumns;
    }

    public void addNewCell(String value) {
        PdfPCell cell = new PdfPCell();
        cell.setPhrase(Phrase.getInstance(value));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        if (numberOfCell < numberOfColumns) {
            cell.setBorderColor(BaseColor.BLUE);
            cell.setBorderWidth(1);
        }
        table.addCell(cell);
        numberOfCell++;
    }


    public void finishWritingInStream() {

        paragraph.add(table);
        Calendar date = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.mm.yyyy");
        Paragraph paragraphDate =new Paragraph(sdf.format(date.getTime()));
        try {
            document.add(paragraph);
            document.add(paragraphDate);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        document.close();
    }
}



        /*ExcelTableService ets = new ExcelTableService();

        for (int i = 0; i < 10; i++) {
            ets.addNewRow();
            for (int k = 0; k < 10; k++)
                ets.addNewCell("Я Алёша " + i + " " + k);
        }
        ets.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.xls");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ets.writeInStream(os);


        WORD
        WordTableService wts = new WordTableService("Test table");

        for (int i = 0; i < 10; i++) {
            wts.addNewRow();
            for (int k = 0; k < 20; k++)
                wts.addNewCell("Я Алёша " + i + " " + k);
        }
        wts.addDateAsString();

        response.setHeader("Content-Disposition", "attachment;filename=table.doc");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        wts.writeInStream(os);




        PDF
        response.setHeader("Content-Disposition", "attachment;filename=table.pdf");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        PDFTableService pdfts = new PDFTableService(20, os);

        for (int i = 0; i < 10; i++) {
            for (int k = 0; k < 20; k++)
                pdfts.addNewCell("Ya Alesha " + i + " " + k);
        }

        pdfts.finishWritingInStream();    */