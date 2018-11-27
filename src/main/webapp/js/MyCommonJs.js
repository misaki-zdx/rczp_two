
//转换时间函数 String 格式也可以进行转换
function convertDateTimeStamp(date) {
    var date = new Date(date);
    //date_value=date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
    var date_value = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
    return date_value;
}

function convertDateBirthday(date) {
    var date = new Date(date);
    var date_value = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() ;
    return date_value;
}

//添加css
function bindCss(selectedDom,type,cssName) {
    var dom ;
    if(type  == 'class'){
       dom = $('.'+selectedDom);
       $.each(dom,function (x,y) {
           $(y).addClass(cssName)
       })
    }else if(type == "id"){
        $('#'+selectedDom).addClass(cssName);
    }
}
