<%--
  Created by IntelliJ IDEA.
  User: zhuxiaoqiu
  Date: 2021/6/20
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
<html>
<head>
    <title>页面</title>
</head>
<body>

<select name="provice" id="provice">
    <option value="0">请选择</option>
</select>省

<%--<select name="city" id="city">--%>
<%--<option value="0">请选择</option>--%>
<%--</select>市--%>

<%--<select name="street" id="street">--%>
    <%--<option value="0">请选择</option>--%>
<%--</select>区--%>

<script type="text/javascript">
    $(function () {
        $.ajax({
            type:'get',
            url:'findprovinces',
            dataType:'json',
            success:function (data) {  //data的值就是从后端发送过来的json格式的字符串
                //拿到当前省份的元素对象
                var obj = $("#provice");
                for (var i = 0;i<data.length;i++){
                    var ob = "<option value='data[i].pid'>"+data[i].pname+"</option>";
                    obj.append(ob);
                }
            }
        });
    });
</script>

<%--<script type="text/javascript" >--%>
  <%--$("#provice").change(function(){--%>
      <%--$("#city option").remove();--%>
      <%--$.ajax({--%>
         <%--type:'get',--%>
          <%--url:'/cityServlet?id='+$("#provice").val(),--%>
          <%--dataType:'json',--%>
          <%--success:function(data){--%>
              <%--var obj = $("#city");--%>
              <%--for (var i = 0;i<data.length;i++){--%>
                  <%--var ob = "<option value='data[i].cid'>"+data[i].cname+"</option>";--%>
                  <%--obj.append(ob);--%>
              <%--}--%>
          <%--}--%>
      <%--});--%>
  <%--});--%>
<%--</script>--%>

<%--<script>--%>
    <%--$("#street").change(function(){--%>
       <%--$.ajax({--%>
           <%--type:'get',--%>
           <%--url:'/StreetServlet?id='+$("#street").val(),--%>
           <%--dataType:'json',--%>
           <%--success:function(){--%>
               <%--var obj = $("#street");--%>
               <%--for (var i = 0;i<data.length;i++){--%>
                   <%--var ob = "<option value='data[i].sid'>"+data[i].sname+"</option>";--%>
                   <%--obj.append(ob);--%>
               <%--}--%>
           <%--}--%>
       <%--}) ;--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>
