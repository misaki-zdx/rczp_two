var indexPage = 1;
var lastPage = 10;
var datas = [];
var Localpath = '';
var pagecount = 0;
var pagenum = 0;
var contentTemp = 1;
var informationCount = 0;
var objLength = 0;
var queryFun = 'selectAll';

/*var hostname = document.location.hostname;
var href = document.location.href;*/

function loadData(controller, objL) {
    // var host = document.location.host;
    Localpath = controller;
    objLength = objL;
    insureSuccess();
    $.ajax({
        url: controller + "/"+queryFun,
        type: "GET",
        dataType: "JSON",
        data: {
            pageNum: indexPage,
            pageSize: 10
        },
        success: function (obj) {
            //console.log(controller);
            datas = obj.list;
            pagecount = obj.pages;
            pagenum = obj.pageNum;
            informationCount = obj.list.length;
            //console.log(informationCount);
            lastPage = obj.lastPage;
            if (obj.isFirstPage) {
                indexPage = obj.firstPage;

            }
            if (obj.isLastPage) {
                indexPage = obj.lastPage;

            }
            loadView2(); //js function parm not transmit
            //loadPageing();

        },
        error: function (err) {
            alert("网络异常");
        }
    });
}

function insureSuccess() {
    if(indexPage == 0){
        indexPage == 1;
    }
}

/*function loadView() {
    var tbody = $("#tbody");
    var trs = "";
    tbody.html("");

    for (var i = 0; i < datas.length; i++) {
        trs += "<tr>";
        var count = 0;
        var prKeyVal = 0;
        $.each(datas[i], function (x, val) {
            count+=1;
            console.log(i+":"+prKeyVal);
            if (1 == count) {
                prKeyVal = val;
            }
            if (val != null) {
                trs += "<td>" + val + "</td>"
            }
        });
        trs += "<a href='" + Localpath + "/detail/" + prKeyVal + "'>详情</a></td>"
            + "<td><a href='" + Localpath + "/showByPk/" + prKeyVal + "'>修改</a></td>"
            + "<td><a href='" + Localpath + "/delete/" + prKeyVal + "'>删除</a></td>"
            + "<td><a href='" + Localpath + "/forwardAdd'>添加</a></td>" + "</tr>";
    }
    tbody.append(trs);
}*/
function loadView2() {
    //console.log(objLength);
    var tbody = $("#tbody");
    var trs = "";
    tbody.html("");
    var id = 0;
    for (var i = 0; i < datas.length; i++) {
        trs += "<tr>";
        var count = 0;
        $.each(datas[i], function (x, val) {
            if (count >= objLength) {
                return false;
            }
            if (x == 'uid' || x == 'rid') {
                id = val;
                if(Localpath == 'user'){
                    trs+="<td><span class='user-td-span'>" + val + "</span></td>";
                }else {
                    trs += "<td class='checkbox-other' style='padding-top: 15px'><span class='user-td-span'><input type='checkbox' value='" + val + "'/>" +
                        "</span></td><td><span class='user-td-span'>" + val + "</span></td>";
                }
            } else if (x == 'uimage') {
                trs += "<td><span class='user-td-span'><img src='" + val + "' class='head-portrait img-circle' alt=''></span>";
            } else if (x == 'tid' || x == 'jobdes' || x=='enterprise') {

            } else {
                //if (val != null)
                trs += " <td class='am-hide-sm-only'><span class='user-td-span'>" + val + "</span></td>";
            }

            count += 1;
        });
        trs += "<td class='edit'><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'>" +
            "<button class='am-btn am-btn-default am-btn-xs am-text-secondary' id='edit-btn'><span class='am-icon-pencil-square-o'></span> <a href='" + Localpath + "/showID/" + id + "'>编辑 </a></button>";
        if (Localpath == 'recruit') {
            trs += "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only'><span class='am-icon-trash-o'></span><a href='" + Localpath + "/deleteID/" + id + "' class='delete_a'>删除 </a></button></div></div></td></tr>"
        }
        /* +
                    "<button class='am-btn am-btn-default am-btn-xs am-hide-sm-only'><span class='am-icon-copy'></span> 复制</button>"
                    + "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only'><span class='am-icon-trash-o'></span> 删除</button></div></div></td></tr>";*/
    }
    tbody.append(trs);
    if(pagenum == 1){
        initPageView();
    }
    setInformationCount();
    checkStatus();
}

function initPageView() {
    var pageView = $('.am-pagination');
    pageView.html("");
    var trs = "";
    if(pagecount >= 1) {
        trs += '<li id="indexpage-span" class="am-disabled"><span class="am-pagination-span" onclick="tindexPage()">首页</span></li>';


        for (var i = 1; i <= 3 && i <= pagecount; i++) {
            if (i == 1) {
                trs += ' <li class="am-active"><span class="am-pagination-span forward-page " onclick="forwardPage(this)">' + i + '</span></li>'
            } else {
                trs += ' <li><span class="am-pagination-span forward-page" onclick="forwardPage(this)">' + i + '</span></li>'
            }
        }
        trs += ' <li id="endPage-span"><span class="am-pagination-span" onclick="tendPage()">尾页</span></li>';
    }
    pageView.append(trs);
}

function tindexPage() {
    indexPage = 1;
    loadData(Localpath,objLength);
    tXpage(indexPage);
}

function tendPage() {
    indexPage = pagecount;
    loadData(Localpath,objLength);
    tXpage(indexPage);
}

function tXpage(i) {
    var x1 = $('.forward-page');
    CancelChecked();
    contentTemp =indexPage;
    for (var x2 = 0; x2 < x1.length; x2++) {
        if (i == 1) {
            x1[x2].innerHTML = i + x2;
            if (x2 == 0) {
                var parentNode = x1[x2].parentNode;
                parentNode.setAttribute('class', 'am-active');
            }
        } else {
            x1[x2].innerHTML = i - x1.length + x2 + 1;
            //console.log(x1.length);
            if (x2 == x1.length - 1) {
                var parentNode = x1[x2].parentNode;  //这样取父节点 还不能变为jq对象
                //console.log(parentNode);
                parentNode.setAttribute('class', 'am-active');
            }
        }
    }
}


function forwardPage(i) {
    var x = $(i);
    var content = i.innerHTML;
    var parentNode = i.parentNode;        //laji  不能直接操作node元素 ，必须要用一个对象装下才能直接操作
    content = parseInt(content);
    if (content != contentTemp) {
        contentTemp = content;
        indexPage = content;
        CancelChecked();
        if (contentTemp > 1 && contentTemp < pagecount) {
            var classList = i.classList;
            var className = classList[classList.length - 1];
            var flag_class = $('.' + className);
            for(var x =0;x<flag_class.length;x++){
                if(x == 0){
                    flag_class[x].innerHTML = content - 1;
                }
                if(x == 1){
                    flag_class[x].innerHTML = content;
                }
                if(x == 2){
                    flag_class[2].innerHTML = content + 1;
                }
            }

            var parentNode = flag_class[1].parentNode;
            parentNode.setAttribute('class', 'am-active');
            loadData(Localpath,objLength)
        }
        else {
            parentNode.setAttribute('class', 'am-active');
            loadData(Localpath,objLength)
        }
    }

}

//移除class

function CancelChecked() {
    var classElement = $('.am-active');
    classElement.removeClass('am-active');
}

function checkStatus() {
    var indexPag_li = $('#indexpage-span');
    var endPage_li = $('#endPage-span');
    if (pagenum == 1) {
        indexPag_li.attr('class', 'am-disabled');
        //indexPag_li.setAttribute('color','red');
    } else {
        indexPag_li.removeClass('am-disabled');
    }

    if (pagenum == pagecount) {
        endPage_li.attr('class', 'am-disabled');
    } else {
        endPage_li.removeClass('am-disabled');
    }
}

function setInformationCount() {
    var temp = $("#span_dataRecordCount");
    temp[0].innerHTML = informationCount;
    //console.log(temp[0].innerHTML);
}

function addEvent() {
    window.navigate("/user/addUser");
    console.log("ddd")
}

//$('.forward-page').onclick(forwardPage());


/*function loadPageing() {
    //console.log(pagenum+" "+pagecount);
    var navigat = $('.navigat');
    var nav = '';
    navigat.html('');
    nav += "<span>pages:" + pagecount + "</span><span>now:" + pagenum + "</span><span  onclick='tindexPage()'>indexPage</span>"
        + "<button id='pre' onclick='prePageData()'>pre</button>"
        + "<button id='next' onclick='nextPageData()'>next</button><span onclick='tendPage()'>endPage</span>";
    navigat.append(nav);
}*/


/*
function prePageData() {
    indexPage--;
    if (indexPage < 1) {
        indexPage = 1;
        return;
    }
    loadData(Localpath);

}

function nextPageData() {
    indexPage++;
    if (indexPage > lastPage) {
        indexPage = lastPage;
        return;
    }
    loadData(Localpath);

}
*/

/*function jude() {
    if (pagenum == 1) {
        $("#pre").attr("disable",true);
    } else if (pagenum == pagecount) {
        $("#next").attr("disable",true);
    }
}*/
