<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script>
<!--分页工具， 依赖jQuery插件，使用前先加载jQuery -->
	function pageHelpers(url, onLoadView, index, size) {
		var indexPage = index ? index : 1;//当前页索引
		var fistPage = 1;
		var lastPage = 1;//不可作为最后一页
		var pages = 1;//页数
		var total = 0;//总条数
		var pageSize = size ? size : 10;
		var data = [];

		function loadData(i, s) {
			$.ajax({
				url : url,
				type : "GET",
				data : {
					pageNum : i ? i : indexPage,
					pageSize : s ? s : pageSize
				},
				success : function(obj) {
					//console.log(obj);
					data = obj.list;
					fistPage = obj.firstPage;
					lastPage = obj.lastPage;
					total = obj.total;
					pages = obj.pages;
					if (obj.isFirstPage) {
						indexPage = obj.firstPage;
					}
					if (obj.isLastPage) {
						indexPage = obj.lastPage
					}
					loadView();
				},
				error : function(err) {
					alert("网络异常");
				}
			});
		}

		function loadView() {
			if (typeof (onLoadView) === "function") {
				onLoadView(data);
			}
		}

		function prePageData() {
			indexPage--;
			if (indexPage < 1) {
				indexPage = 1;
				return;
			}
			loadData();
		}

		function nextPageData() {
			indexPage++;
			if (indexPage > lastPage) {
				indexPage = lastPage;
				return;
			}
			loadData();
		}

		loadData();

		return {
			loadData : loadData,
			prePageData : prePageData,
			nextPageData : nextPageData,
			pages : function() {
				return pages
			},
			indexPage : function() {
				return indexPage
			},
			total : function() {
				return total
			},
		}
	}
</script>

