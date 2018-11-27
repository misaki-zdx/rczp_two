$(function(){
   $('#upload').click(function(){
	   $('.myFile').trigger('click');
	   //change文本的文字内容修改后激活
	   $('.myFile').change(function(){
		   //获取上传的子文件夹的名称
		  var subfolder = $('.subfolder').val();
		 //调用通过插件js 扩展的jquery方法  
     $.ajaxFileUpload(
         {
          url: 'upload/springUpload', 
          type: 'post',
          fileElementId: 'myFile', //上传的文件的 html 标签的ID
          data:{"subfolder":subfolder},//提交给服务器的参数
          dataType: 'text', //返回值类型,服务器out对象输出的内容
          success : function(uimage){//回调函数 ，服务器有返回输出的时候调用的函数
        	  $('.uploadImg').attr('src','upload/'+subfolder+'/'+uimage);
        	  //$('input[name="comment.cmdesc"]').val(imgsrc);
        	  $('.uploadimgsrc').val(uimage);
          }
        	  
          });
			 
			 
			 
			 
	   });
   });
});