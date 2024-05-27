<%@ page import="com.phutl.model.Medicine" %>
<%@ page import="java.util.List" %>
<%@ page import="com.phutl.service.MedicineService" %>
<%@ page import="com.phutl.repository.impl.MedicineRepositoryImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/11/2021
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>


<h2 style="text-align: center; padding: 5% 0px">Chọn thuốc cho bệnh nhân</h2>
<div style="margin: 2% 2%">
    <a class="btn btn-primary" href="<c:url value="/admin/khambenh/chonthuoc/checklist"/>">Danh sách thuốc đã chọn</a>
</div>
<%
    int start = 0;
    Object a  =  request.getAttribute("medicines");
    List<Object> list = new ArrayList<>();
    if (a.getClass().isArray()) {
        list = Arrays.asList((Object[])a);
    } else if (a instanceof Collection) {
        list = new ArrayList<>((Collection<?>)a);
    }
    int elementsLen = list.size();


    int counter = 1;
    int noOfItemsInRow = 3; //set number of td you want in tr
    StringBuilder sb = new StringBuilder();
    noOfItemsInRow++;

    //start table

    while(start<elementsLen){
        Medicine c = (Medicine)list.get(start);
        sb.append("<a href=\"/phongKhamTu_war/admin/khambenh/chonthuoc/buy/"+c.getMedicineId()+"\"  \" class=\"card\" style=\"width: 18rem; margin:0 0.5%\">\n" +
                "  <img class=\"card-img-top\" src=\"/phongKhamTu_war"+c.getPic()+"\" alt=\"Card image cap\">\n" +
                "  <div class=\"card-body\">\n" +
                "    <h5 class=\"card-title\">"+c.getFullname()+"</h5>\n" +
                "    <p class=\"card-text\">"+"Giá cả: "+c.getPrice()+"</p>\n" +
                "  </div>\n" +
                "</a>");


        //check if noOfElemntsInRow elements is reached keep it in a new row
        if(++counter==noOfItemsInRow){
            out.println("<div style=\"padding-bottom: 3%;\" class=\"row d-flex justify-content-center\" >");
            out.println(sb.toString());
            out.println("</div>");
            sb.setLength(0);
            counter = 1;
        }
        start++;
    }
    //print remaining td elements in a new row
    if(sb.length()>1){
        out.println("<div style=\"padding-bottom: 3%;\" class=\"row d-flex justify-content-center\" >");
        out.println(sb.toString());
        out.println("</div>");
    }


%>