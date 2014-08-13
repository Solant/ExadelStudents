package com.services.tables;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class PDFTableService {

    private Document document;
    private PdfPTable table;
    private Paragraph paragraph;
    private int numberOfCell;
    private int numberOfColumns;

    public PDFTableService(int numberOfColumns, OutputStream os, boolean isHorizontal) {
        Rectangle pageRect = new Rectangle(PageSize.A4);
        if(isHorizontal){
            float tempWidth = pageRect.getWidth();

            pageRect.setRight(pageRect.getLeft() + pageRect.getHeight());
            pageRect.setTop(pageRect.getBottom() + tempWidth);
        }
        document = new Document(pageRect);

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

    public PDFTableService(String title, int numberOfColumns, OutputStream os, boolean isHorizontal) {
        Rectangle pageRect = new Rectangle(PageSize.A4);
        if(isHorizontal){
            float tempWidth = pageRect.getWidth();

            pageRect.setRight(pageRect.getLeft() + pageRect.getHeight());
            pageRect.setTop(pageRect.getBottom() + tempWidth);
        }
        document = new Document(pageRect);
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
        if(value == null)
            value = "";
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
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
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
