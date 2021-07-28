package com.rk.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean saveFile(InputStream is, String path)
	{
		boolean flag=false;
		
		try {
			byte b[]=new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos= new FileOutputStream(path);
			fos.write(b);
			
			fos.flush();
			fos.close();
			
			flag=true;
			
		}//try
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}//save method
	
	
	//delete file
	public static boolean deleteFile(String path)
	{
		boolean flag=false;
		
	try {
			
		File file=new File(path);
		file.delete();	
		flag=true;
		
		}//try
	catch (Exception e) {
		e.printStackTrace();

		}
		
		return flag;
	}//delete method
}//class
