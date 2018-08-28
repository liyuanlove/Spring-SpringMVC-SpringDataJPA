<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Input Page</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#lastName").change(function () {
                var val = $(this).val();
                val = $.trim(val);
                $(this).val(val);

                //若修改的lastName和之前的lastName一致，则不发送Ajax请求，直接弹出lastName可用
                var _oldLastName = $("#_oldLastName").val();
                _oldLastName = $.trim(_oldLastName);
                if (_oldLastName != null && _oldLastName != "" && _oldLastName == val) {
                    alert("lastName可用");
                    return;
                }

                var url = "${pageContext.request.contextPath}/ajaxValidateLastName";
                var args = {"lastName": val, "date": new Date()};

                $.post(url, args, function (data) {
                    if (data == "0") {
                        alert("lastName可用");
                    } else if (data == "1") {
                        alert("lastName不可用");
                    } else {
                        alert("网络或程序出错");
                    }
                });
            });
        })
    </script>
</head>
<body>
<c:set value="${pageContext.request.contextPath}/emp" var="url"/>
<c:if test="${employee.id != null}">
    <c:set value="${pageContext.request.contextPath}/emp/${employee.id}" var="url"/>
</c:if>

<form:form action="${url}" method="POST" modelAttribute="employee">
    <c:if test="${employee.id != null}">
        <input type="hidden" id="_oldLastName" value="${employee.lastName}"/>
        <form:hidden path="id"/>
        <input type="hidden" name="_method" value="PUT"/>
    </c:if>
    <br>
    LastName: <form:input path="lastName" id="lastName"/>
    <br>
    Email: <form:input path="email"/>
    <br>
    Birth: <form:input path="birth"/>
    <br>
    Department: <form:select path="department.id" items="${departments}" itemLabel="departmentName" itemValue="id"/>
    <br>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>