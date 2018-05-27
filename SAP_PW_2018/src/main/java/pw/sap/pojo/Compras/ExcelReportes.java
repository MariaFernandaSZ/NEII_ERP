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
    
    public static void cearExcelNuevo(){
        Workbook libro = new XSSFWorkbook();
        org.apache.poi.ss.usermodel.Sheet hoja = libro.createSheet("Reporte Compras");
        
        try
        {
            FileOutputStream archivo = new FileOutputStream("C:\\Users\\Adrian\\Escritorio\\excel\\Reporte Compras Productos.xlsx");
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
