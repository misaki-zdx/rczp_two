package com.sccc.rczp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@RequestMapping("/upload")
@Controller
public class UploadController {
	private String savePath = "upload";

	private String subfolder;

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getSubfolder() {
		return subfolder;
	}

	public void setSubfolder(String subfolder) {
		this.subfolder = subfolder;
	}

	@RequestMapping(value="/springUpload",method=RequestMethod.POST)
	@ResponseBody
	public String springUpload(HttpServletRequest request) throws IllegalStateException, IOException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");//设置日期格式
		String newFileName = "";
		
		long startTime = System.currentTimeMillis();
		// 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 检查form中是否有enctype="multipart/form-data"
		if (multipartResolver.isMultipart(request)) {
		       //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            subfolder = multiRequest.getParameter("subfolder");
            
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();
             
            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                  	String uploadPath = request.getRealPath(getSavePath());

                  	
                  	System.out.println(uploadPath);
                  	
                  	String fileName = file.getOriginalFilename();
                  	
                  	newFileName = df.format(new Date())+fileName.substring(fileName.lastIndexOf("."));
    				
                  	
                    String path= uploadPath + "/" + getSubfolder()+ "/" +newFileName;
                    
                    
                    System.out.println(path);
                    File fileparent = new File(path);
					
					
		

					if (!fileparent.exists()) {
						fileparent.mkdirs();
					}
                    
                    //上传
                    file.transferTo(new File(path));
                    
                    String  bcakPath = "D:/img/" + getSubfolder() + "/" +  newFileName;
                    
                    File backFile = new File(bcakPath);


                    
					File backfileparent = backFile.getParentFile();

					if (!backfileparent.exists()) {
						backfileparent.mkdirs();
					}
					
					file.transferTo(new File(bcakPath));
                }
                 
            }
			
			
			
			
		
			

		}
		long endTime = System.currentTimeMillis();
		//System.out.println("运行时间：" + String.valueOf(endTime - startTime) + "ms");
		return newFileName;
	}
}
