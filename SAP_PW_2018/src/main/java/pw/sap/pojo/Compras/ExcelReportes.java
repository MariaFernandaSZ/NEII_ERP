/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Adrian
 */
public class ExcelReportes
{
    public static void cearExcel(){
        Workbook libro = new HSSFWorkbook();
        org.apache.poi.ss.usermodel.Sheet hoja = libro.createSheet("Reporte Compras");
        
        try
        {
            FileOutputStream archivo = new FileOutputStream("C:\\Users\\Adrian\\Escritorio\\excel\\Reporte Compras Productos.xls");
            libro.write(archivo);
            archivo.close();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                
    }
    
    public static void crearExcelNuevo(){
        Workbook libro = new XSSFWorkbook();
        org.apache.poi.ss.usermodel.Sheet hoja = libro.createSheet("Reporte Compras");
        
        //Creacion de filas y cledas relacionadas con la fila
        Row fila = hoja.createRow(5);
        fila.createCell(6).setCellValue("Primer Reporte");
        fila.createCell(2).setCellValue(780505.2);
        fila.createCell(3).setCellValue(true);
        
        //Celda por separado para formulas, para dar mas caracteristicas a la celda
        Cell celda = fila.createCell(7);
        celda.setCellFormula(String.format("1+1", ""));
        
        
        
        
        try
        {
            FileOutputStream archivo = new FileOutputStream("C:\\Users\\Adrian\\Escritorio\\excel\\Reporte Productos.xlsx");
            libro.write(archivo);
            archivo.close();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }               
    }
    
}
