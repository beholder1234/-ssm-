<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>电梯信息管理系统</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/flatpickr.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<meta http-equiv="Cache-Control" content="no-cache">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link href="css/stylepart.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="css/flatpickr.min.css" rel="stylesheet" type="text/css" />

<!--弹窗插件  -->
<script type="text/javascript" src="js/popup.js"></script>
<link href="css/popup.css" rel="stylesheet" type="text/css" />	

<script type="text/javascript">


//1秒自动消失弹窗
function win1(msg){
    var popup = new Popup({
        'type': 'info',
        'title': '提示信息',
        'text': msg,
        'color': '#fff',
        'bgcolor': '#353b4b',
        'autohide': true,
        'showtime': 1000
    });	
	
}


</script>





</head>


<body>
<!-- main -->


<%-- 	<form id="check"
		action="${pageContext.request.contextPath }/login.action"
		method="post">
		<table width="100%">
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" />
				</td>
			</tr>
		</table>
	</form>





	<form id="check"
		action="${pageContext.request.contextPath }/orderPCheckList.action"
		method="post">
		<table width="100%">
			<tr>
			
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" />
				</td>
			</tr>
		</table>
	</form>

 --%>











    <!--content-->
    <div class="content">
        <!--发货通知单录入-->
        <div class="add_delivery_notice">
            <div class="box">
                <div class="box_t">
                    <h3>采购单审核-查询信息</h3>
                </div>
                <div class="box_c">
                    <form action="${pageContext.request.contextPath }/orderPCheckList.action" method="post">
                        <fieldset>
                            
                            
                            <div class="box_c_item">
                                    <label class="l_title">供应商：</label>
                                    <input class="text_input w200 fl" type="text" name="supplierS" id="supplierS" placeholder="请输入公司名称"> 
                                    <label class="l_title">下单员：</label>
                                    <input class="text_input w200 fl" type="text" name="Emp1S" id="Emp1S" placeholder="请输入公司名称"> 
                                                                  
                                   <div class="clear"></div>                             
                            </div>                            
                            
                            
<!--                             <div class="box_c_item">
                                    <label class="l_title">订单生成时间段：</label>
                                    <input class="calendar text_input w200 fl" type="text" name="beTimeS" id="corporate_name" placeholder="请输入公司名称"> 
									<span class="l_con">-</span>
                                    <input class="calendar text_input w200 fl" name="finalTimeS" type="text" id="consignee" placeholder="请输入收货单位">  
                                    
                                   <div class="clear"></div>                             
                            </div>    -->                          
                            
                            <div class="fr">
                        		<label class="l_title"></label>
                        		<button class="btn btn_commit" type="submit">确认提交</button>
                   			</div>
                        </fieldset>
                    </form>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="box">
                <div class="box_t box_t_bottom">
                    <h3>采购单审核-订单信息</h3>
                </div>
                <div class="box_c box_c_reset">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>序号</th>
                                <th>订单类型</th>
                                <th>供应商</th>
                                <th>生成日期</th>
                                <th>总价</th>
                                <th>状态</th>
                                <th class="text-right">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                                          	<!-- 行号设初始值 -->
								<%
									int num = -1;
								%>
								<c:forEach begin="0" end="${(page.page-1)*page.size}">
									<%
										num++;
									%>
								</c:forEach>
                        	<c:forEach items="${page.rows}" var="order">
                            <tr>
                            	 <td  style='display:none'> <input type = 'hidden' name='goodsId' value= ${order.id }> </td >      
                                <td><%=++num%></td>
                  	       
       
                                <td >采购单 </td>
                                <td>${order['supplier'].name } </td>
                                <td ><fmt:formatDate value="${order.createtime }" pattern="yyyy-MM-dd"/></td>
                                <td>${order.totalprice }</td>
								<td>审核</td>
                                <td class="text-right"><a href="#" onclick="getOrderdetailList(${order.id})">订单明细</a> | <a href="#" onClick="verifyPOrder(${order.id},${oneRole.id })">审核</a>
                                </td>
                            </tr><!-- 最多7行 -->
                            </c:forEach>
                        </tbody>
                    </table>
					<div class="clear"></div>
                    <!-- 页码框选项，与页面跳转实现 -->
					<itcast:page url="${pageContext.request.contextPath }/orderPCheckList.action" />
                


            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
                            
<div class="box_c hide" id="ordertail_list_form">
	 <form action="${pageContext.request.contextPath }/" method="post">
			<fieldset>
			
			
<table class="table" width="80%"  style="border-spacing:0; border-collapse: collapse;text-align: center;" border="1">
<thead style="width:99%;display: table;table-layout: fixed;">
  <tr>
    <th colspan="10"><div align="center">订单表-基本信息</div></th>
  </tr>
</thead>
<tbody style="display: block;height:100%;">
  <tr style=" display: table;width: 99%;table-layout: fixed;">
  
  
    <td ><div align="right">供应商：</div></td>    
    <td colspan="2" id="DSuppOrCustName"></td>
    
    
    
    <td><div align="right">生成日期：</div></td>
    <td  id="DCreateTime"><div align="center"></div></td>
    
    
    
    <td><div align="right">下单员：</div></td>
    <td  id="DCreater"><div align="right"></div></td>
    
    
  </tr>
  
  <tr style=" display: table;width: 99%;table-layout: fixed;">
  
    <td ><div align="right">联系人：</div></td>
    <td colspan="2"  id="DContact"><div align="right"></div></td>
    
    
    <td><div align="right" >审核日期：</div></td>
    <td  id="DCheckTime"><div align="right"></div></td>
    
    
    <td><div align="right">审核员：</div></td>
    <td  id="DChecker"><div align="right"></div></td>
    
    
  </tr>
  
  
  
  <tr style=" display: table;width: 99%;table-layout: fixed;">
  
    <td><div align="right">电话：</div></td>
    <td colspan="2" id="DTele"><div align="right"></div></td>
    
    
    <td><div align="right" >采购日期：</div></td>
    <td  id="DStartTime"><div align="right"></div></td>
    
    
    <td><div align="right">采购员：</div></td>
    <td  id="DStarter"><div align="right"></div></td>
    
    
  </tr>
  
  <tr style=" display: table;width: 99%;table-layout: fixed;">
  
    <td><div align="right">地址：</div></td>
    <td colspan="2" id="DAddress"><div align="right"></div></td>
       
    
    <td><div align="right">订单总价：</div></td>
    <td  id="DTotalprice"><div align="right"></div></td>
    
        <td><div align="right"></div></td>
    <td  id="DStarter"><div align="right"></div></td>
  </tr>
</tbody>

<thead 	style="width:98%;display: table;table-layout: fixed;">
  <tr>
    <th colspan="7"><div align="center">订单表-商品信息</div></th>
  </tr>
  <tr>
    <th><div align="center">序号</div></th>
    <th><div align="center">商品名称</div></th>
    <th><div align="center">型号</div></th>
    <th><div align="center">商品类型</div></th>
    <th><div align="center">单价</div></th>
    <th><div align="center">数量</div></th>
    <th><div align="center">总价</div></th>
  </tr>
</thead>

<tbody style="display: block;height:180px;overflow-y: scroll;"  id="OrderDGoods">


	

</tbody>

</table>

 <button class="btn btn_commit" type="sumbit"  id="saveButton" style="float:right">保存</button>

			</fieldset>
			</form>
		</div>         
            
            
        </div>
      
        <!-- END 发货通知单产品录入弹窗-->
    </div>
    <!--END content-->
</div>

</body>

<script type="text/javascript">


  

$(function(){
	
	
	//使用jQuery
	$(".calendar").flatpickr();  
	
	
	
});


</script>





<script type="text/javascript">

function getOrderdetailList(orderId) {
	
	$.ajax({
		type : "post",
		url : "getorderdetailList.action",
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		data : {
			orderId : orderId
		},
		success : function(order) {
			
			
			
			
			if(order != null){
				
				
				if(order.supplier != null){
					
					$("#DSuppOrCust").text("供应商");
					$("#DSuppOrCustName").text(order.supplier.name);
					$("#DContact").text(order.supplier.contact);
					$("#DTele").text(order.supplier.tele);
					$("#DAddress").text(order.supplier.address);
					
				}

				
				
				$("#DCreateTime").text(formatDate(new Date(order.createtime)));
				$("#DCheckTime").text(formatDate(new Date(order.checktime)));
				$("#DStartTime").text(formatDate(new Date(order.starttime)));
				$("#DEndTime").text(formatDate(new Date(order.endtime)));
				
				
				$("#DCreater").text(order.creater);
				$("#DChecker").text(order.checker);
				$("#DStarter").text(order.starter);
				$("#DTotalprice").text(order.totalprice);
				
				var hangLeft = "<tr style=' display: table;width: 100%;table-layout: fixed;' > ";
				var hangRight= "</tr>" ;
				var hangCenterLetf="<td>";
				var hangCenterRight="</td>";				
				
				
				
				
				var orderD = order.orderdetails;
				
 				for(var i=0 ; orderD[i] != null;i++){

 					

 					
 					
					/*  win1(orderD[i].goods.name); */
					var goods = orderD[i].goods;
					var store = orderD[i].store;
					
					var count = i+1;
					var name = goods.name;
					var model = goods.model;
					var goodstype =  goods['goodstype'].name;
					var price = orderD[i].price;
					var num = orderD[i].num;
					var totalprice = price * num;
					
					
					
					var data = hangCenterLetf + count + hangCenterRight;
					var data =data + hangCenterLetf + name + hangCenterRight;
					var data =data + hangCenterLetf + model + hangCenterRight;
					var data =data + hangCenterLetf + goodstype + hangCenterRight;
					var data =data + hangCenterLetf + price + hangCenterRight;
					var data =data + hangCenterLetf + num + hangCenterRight;
					var data =data + hangCenterLetf + totalprice + hangCenterRight;
					
					
					
					var hang = hangLeft + data + hangRight;
					$("#OrderDGoods").append(hang);
					
				} 
				
				
				
			}
 			layer.open({
				 type : 1,
				 skin : 'layui-layer-rim', //加上边框
				 area : [ '900px', '400	px' ], //宽高
				 title : false,
				 closeBtn : 1,
				 shadeClose : true,
				 content : $(ordertail_list_form),
				 cancel: function (index, layero) {//取消事件
					 
					 $("#OrderDGoods").empty();
				 }
				 });  
		},
		error : function() {
			win1("失败");
		}
	});
	
}


function formatDate(date) {
	   var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? '0' + m : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    return y + '-' + m + '-' + d;//这里可以写格式
	    //输出：2017-10-9
	}



</script>







<script type="text/javascript"> 


 	var datas = getData();
	 $( "#supplierS" ).autocomplete({
	      source: datas
	    });

	 

		var empNames = getEmpNames();
			 $( "#Emp1S" ).autocomplete({
			      source: empNames
			    });			 			 
		 
	 function getData(){
	 	var result;
	 	$.ajax({
	 		type : "POST",
	 		url : "getSupplierName.action",
	 		dataType : "json",
	 		cache : false,
	 		async:false,
	 		success : function(datas) {
	 			
	 			result = [datas.length];
	 			for(var i=0;i<datas.length;i++){
	 				result[i] = datas[i];
	 			}
	 			}
	 		});
	 	return result;
	 }
	 
	 
	 

	 function getEmpNames(){
		 	var result;
		 	$.ajax({
		 		type : "POST",
		 		url : "getEmpName.action",
		 		dataType : "json",
		 		cache : false,
		 		async:false,
		 		success : function(datas) {
		 			/* alert(datas == null); */
		 			result = [datas.length];
		 			for(var i=0;i<datas.length;i++){
		 				result[i] = datas[i];
		 			}
		 			}
		 		});
		 	return result;
		 }


</script>

<script type="text/javascript">





function verifyPOrder(orderId,checkerId){
	
	/* alert(checkerId); */
	var r=confirm("确定通过审核吗？？？");	
	
	if(r){
 	$.ajax({
 		type : "POST",
 		url : "verifyPOrder.action",
 		dataType : "json",
 		cache : false,
 		async:false,
 		data:{orderId:orderId,
 			checkerId:checkerId},
 		success : function(datas) {
 			
 			win1("审核完成");
 			location.reload();
 			

 			
 			},
 		error : function() {
			win1("审核失败");
			}
 		});
	
	
	
	}
	else{return;}
		
	
	
	
	
	
	
	
	
	
}



</script>






</html>