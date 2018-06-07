/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;



import pw.sap.pojo.Inventarios.*;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReporteEn
{

    Connection conn;

    private static String FILE = "C:\\Users\\Adrian\\Escritorio\\pdf\\reporte-inventario-general.pdf";

    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);

    public ReporteEn() throws ClassNotFoundException, SQLException
    {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     *
     * @throws SQLException
     */
    public void openDB() throws SQLException
    {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/sap", connProp);
    }

    /**
     * Cierra la conexión con la base de datos
     *
     * @throws SQLException
     */
    public void closeDB() throws SQLException
    {
        conn.close();
    }

    public void generarReporte()
    {

        try
        {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(FILE));
            document.open();
            addMetaData(document);
            addTitlePage(document);
            addContent(document);
            document.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    private static void addMetaData(Document document)
    {
        document.addTitle("Reporte Inventario General");
        document.addSubject("Using iText");
        document.addKeywords("Java, PDF, iText");
        document.addAuthor("Lars Vogel");
        document.addCreator("Lars Vogel");
    }

    private static void addTitlePage(Document document)
            throws DocumentException
    {
        Paragraph preface = new Paragraph();
        // We add one empty line
        addEmptyLine(preface, 1);
        // Lets write a big header
        preface.add(new Paragraph("Reporte de Entradas", catFont));

        addEmptyLine(preface, 1);
        // Will create: Report generated by: _name, _date
        preface.add(new Paragraph(
                "Report generated by: " + System.getProperty("user.name") + ", " + new Date(), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                smallBold));
        addEmptyLine(preface, 3);
        preface.add(new Paragraph(
                "El siguiente reporte mostrara los productos de entrada de la empresa, así como una tabla especifíca sobre las entradas ",
                smallBold));

        addEmptyLine(preface, 8);

        preface.add(new Paragraph(
                "This document is a preliminary version and not subject to your license agreement or any other agreement with SAPito.com",
                redFont));

        document.add(preface);
        // Start a new page
        document.newPage();
    }

    private static void addContent(Document document) throws DocumentException, SQLException
    {
        Anchor anchor = new Anchor("First Chapter", catFont);
        anchor.setName("Reporte Entradas");

        // Second parameter is the number of the chapter
        Chapter catPart = new Chapter(new Paragraph(anchor), 1);

        Paragraph subPara = new Paragraph("", subFont);
        Section subCatPart = catPart.addSection(subPara);
        //subCatPart.add(new Paragraph("Hello"));

        subPara = new Paragraph("", subFont);
        subCatPart = catPart.addSection(subPara);
        //subCatPart.add(new Paragraph("Paragraph 1"));
        //subCatPart.add(new Paragraph("Paragraph 2"));
        //subCatPart.add(new Paragraph("Paragraph 3"));

        // add a list
        createList(subCatPart);
        Paragraph paragraph = new Paragraph();
        addEmptyLine(paragraph, 5);
        subCatPart.add(paragraph);

        // add a table
        createTable(subCatPart);
        
        createTabl(subCatPart);

        // now add all this to the document
        document.add(catPart);

        // Next section
//        anchor = new Anchor("Second Chapter", catFont);
//        anchor.setName("Second Chapter");
//
//        // Second parameter is the number of the chapter
//        catPart = new Chapter(new Paragraph(anchor), 1);
//
//        subPara = new Paragraph("Subcategory", subFont);
//        subCatPart = catPart.addSection(subPara);
//        subCatPart.add(new Paragraph("This is a very important message"));
//
//        // now add all this to the document
//        document.add(catPart);
    }

    private static void createTable(Section subCatPart)
            throws BadElementException, SQLException
    {
        PdfPTable table = new PdfPTable(4);

        // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);
        PdfPCell c1 = new PdfPCell(new Phrase("ORDEN DE COMPRA"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("PROVEEDOR"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("PRODUCTO"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("CANTIDAD"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        ResultSet rsTabla = consultaEntrada();
        while (rsTabla.next())
        {
            table.setHeaderRows(1);

            table.addCell(rsTabla.getString(1));
            table.addCell(rsTabla.getString(2));
            table.addCell(rsTabla.getString(3));
            table.addCell(rsTabla.getString(4));
        }

        subCatPart.add(table);
    }

    public static ResultSet consultaEntrada() throws SQLException
    {
        Connection conn;
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "Gorostieta123");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);

        PreparedStatement ps;

           ps = conn.prepareStatement("select ord_folio,  prov_nom_emp, nombre, req_cantidad\n" +
"from orden_compra \n" +
"inner join requisicion on orden_compra.req_folio = requisicion.req_folio\n" +
"inner join producto on producto.id_producto = requisicion.id_producto\n" +
"inner join proveedor on proveedor.prov_rfc = producto.proveedor;");
                                                    ResultSet rs= ps.executeQuery();
        System.out.println(ps);

        conn.close();
        return rs;
    }

    
    private static void createTabl(Section subCatPart)
            throws BadElementException, SQLException
    {
        PdfPTable table = new PdfPTable(1);

        // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);
        PdfPCell c1 = new PdfPCell(new Phrase("CANTIDAD"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);
        
        ResultSet rsTabla = consultaEntrada2();
        while (rsTabla.next())
        {
            table.setHeaderRows(1);

            table.addCell(rsTabla.getString(1));
            
        }

        subCatPart.add(table);
    }

    public static ResultSet consultaEntrada2() throws SQLException
    {
        Connection conn;
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);

        PreparedStatement ps;

          ps = conn.prepareStatement("select ord_fecha \n" +
"from orden_compra \n" +
"inner join requisicion on orden_compra.req_folio = requisicion.req_folio\n" +
"inner join producto on producto.id_producto = requisicion.id_producto\n" +
"inner join proveedor on proveedor.prov_rfc = producto.proveedor;");
                                                    ResultSet rs= ps.executeQuery();

        System.out.println(ps);

        conn.close();
        return rs;
    }

    
    
    private static void createList(Section subCatPart)
    {
        List list = new List(true, false, 10);
        list.add(new ListItem(""));
        list.add(new ListItem(""));
        list.add(new ListItem(""));
        subCatPart.add(list);
    }

    private static void addEmptyLine(Paragraph paragraph, int number)
    {
        for (int i = 0; i < number; i++)
        {
            paragraph.add(new Paragraph(" "));
        }
    }

}
