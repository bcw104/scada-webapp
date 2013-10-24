 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${endTag.name}油井实时数据</title>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/show/css/show.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/show/css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/show/css/jquery.tools.css">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/show/css/sen.full.min.css">
        <script src="${ctx}/static/jquery/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/static/show/js/jquery-ui.js"></script>
        <style> 
            ul{ clear:both;list-style:none; margin:0;padding:0; border-top:dotted 1px #000} 
            ul li{ text-align:left;line-height:16px;padding:2px;} 
            .yxTable tbody tr:nth-child(odd) td{
            	background-color: red;
            }
            tr {
            	yexj00:expression(this.style.backgroud=(rowIndex%2==1)?'YELLOW':'RED')
            }
            .even {background: #F4EDFF;}
            .odd {background: #FFFFFF; }
            .selected {background: #D8D8D8;}
        </style> 
        <script>
            $(function() {
                // 加载Tab控件
            	$( "#tabs" ).tabs();
                
                // 表格奇偶行不同颜色
                $("tbody>tr:odd").addClass("odd"); // 为奇数行添加样式
                $("tbody>tr:even").addClass("even"); // 为偶数行添加样式 
                $("tbody>tr").mouseover(function(){
                	$(this).addClass("selected");
                }).mouseout(function(){
                	$(this).removeClass("selected");
                });
              });
        </script>
    </head>
    <body>
         <div id="tabs"  style="font-size: 14px;">
             <ul>
                 <c:forEach items="${tempWrapperList}" var="tempWrapper" varStatus="status">
                     <li>
                         <a href="#tabs-${status.index + 1}">${tempWrapper.varGroupValue}</a>
                     </li>
                 </c:forEach>
            </ul>
               <c:forEach items="${tempWrapperList}"  varStatus="sub_status"  var="tempWrapper" >
               <div id="tabs-${sub_status.index + 1}">
               	 <c:if test="${tempWrapper.tempYxList != null && fn:length(tempWrapper.tempYxList) > 0}">
                <table class="dataintable" style="float: left; margin-right: 5px;" class="yxTable">
                	<tbody>
                       		 <tr style="font-weight: bold;">
                               <td>遥信</td> 
                               <td>状态</td>
                           </tr>
                           <c:forEach items="${tempWrapper.tempYxList}" var="tempYX" >
                               <tr>
                                   <td>${tempYX.varName}</td>
									<td align="center">
										<c:if test="${tempYX.varValue=='false'}">
											0
										</c:if>
										<c:if test="${tempYX.varValue=='true'}">
											1
										</c:if>
										
									</td>
                               </tr>
                           </c:forEach>
                           </tbody>
                   </table>
                   </c:if>
                   <c:if test="${tempWrapper.tempYcList != null && fn:length(tempWrapper.tempYcList) > 0}">																	
                   <table class="dataintable" style="float: left; margin-right: 5px;">
                   		<tbody>
                     		<tr style="font-weight: bold;">
                               <td>遥测</td> 
                               <td>变量值</td>
                           </tr>
                       
                          <c:forEach items="${tempWrapper.tempYcList}" var="tempYC" >
                              <tr>
                                  <td>${tempYC.varName}</td> 
                                  <td>${tempYC.varValue}</td>
                              </tr>
                          </c:forEach>
                       </tbody>
                  </table>
                  </c:if>
                   <c:if test="${tempWrapper.tempYmList != null && fn:length(tempWrapper.tempYmList) > 0}">
                  <table class="dataintable" style="float: left; margin-right: 5px;">
                      <tbody>
                       	<tr style="font-weight: bold;">
                               <td>遥脉</td> 
                               <td>变量值</td>
                           </tr>
                          <c:forEach items="${tempWrapper.tempYmList}" var="tempYM" >
                              <tr>
                                  <td>${tempYM.varName}</td> 
                                  <td>${tempYM.varValue}</td>
                              </tr>
                          </c:forEach>
                       </tbody>
                  </table>
                  </c:if>
                  <c:if test="${tempWrapper.tempQtList != null && fn:length(tempWrapper.tempQtList) > 0}">
                    <table class="dataintable" style="float: left; margin-right: 5px;">
                 		<tbody>	
                 			<tr style="font-weight: bold;">
                               <td>其他</td> 
                               <td>变量值</td>
                           </tr>
                           <c:forEach items="${tempWrapper.tempQtList}" var="tempQT" >
                               <tr>
                                   <td>${tempQT.varName}</td> 
                                   <td>${tempQT.varValue}</td>
                               </tr>
                           </c:forEach>
                  		</tbody>
                   </table>
                  </c:if>
                </div>
                 </c:forEach>
         </div>
    </body>
</html>
   