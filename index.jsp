
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%--不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题
    以/开始的相对路径，找资源，以服务器的路径为标准（ http://localhost:3306),需要加上项目名
    --%>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>

    <script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.5.1.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--员工修改的模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@mrchang.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<%--员工添加的模态框--%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@mrchang.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_sava_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1 style="color: #269abc">员工增删改查</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_modal_btn">删除</button>
        </div>
    </div>
    <%--显示表格诗句--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord,currentPage;
    //页面加载完成以后，直接区发送一个ajax请求，要到分页数据
    $(function (){
        to_page(1);
    });

    function to_page(pn){
        $.ajax({
            url:"${APP_PATH }/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (msg){
                //console.log(msg);
                //解析并显示员工数据
                build_emps_table(msg)
                //解析并显示分页信息
                build_emps_info(msg)
                //解析显示分页条数据
                build_emps_nav(msg)

            }
        });
        $("#check_all").prop("checked",false);
    }

    function build_emps_table(msg){
        $("#emps_table tbody").empty();
        var emps = msg.extend.pageInfo.list;
        $.each(emps,function (index,item){
            /*alert(item.empName);*/
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(checkBoxTd)
                .append(empIdTd)
            .append(empNameTd)
            .append(genderTd)
            .append(emailTd)
            .append(deptNameTd)
            .append(btnTd)
            .appendTo("#emps_table tbody");
        });
    }
    //解析显示分页信息
    function build_emps_info(msg){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+msg.extend.pageInfo.pageNum +"页,共"+
            msg.extend.pageInfo.pages +"页,共"+
            msg.extend.pageInfo.total +"条记录");
        totalRecord = msg.extend.pageInfo.total;
        currentPage = msg.extend.pageInfo.pageNum;
    }

    function build_emps_nav(msg){
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (msg.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function (){
                to_page(1);
            });
            prePageLi.click(function (){
                to_page(msg.extend.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (msg.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function (){
                to_page(msg.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function (){
                to_page(msg.extend.pageInfo.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(msg.extend.pageInfo.navigatepageNums,function (index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (msg.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function (){
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    $("#emp_add_modal_btn").click(function (){
        //清除表单数据（表单完整充值（表单的数据，表单的样式））
        reset_form("#empAddModal form");
        //$("#empAddModal form")[0].reset();
        getDepts("#dept_add_select");
        $("#empAddModal").modal({
           backdrop:"static"
        });
    });
    //查出所有部门信息并显示在下拉列表
    function getDepts(ele){
        $(ele).empty();
       // $("#dept_add_select").empty();
        $.ajax({
           url:"${APP_PATH}/depts",
            type:"GET",
            success:function (msg){
               //console.log(msg)
                //$("#dept_add_select").append("")
                $.each(msg.extend.depts,function(){
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }
    function validate_add_form(){
        var empName = $("#empName_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)){
            //alert("用户名可以是2-5位中文或者6-16位英文数字组合")
            show_validate_msg("#empName_input","error","用户名可以是2-5位中文或者6-16位英文数字组合");
            return false;
        }else{
            show_validate_msg("#empName_input","success","")
        };
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            //alert("邮箱格式不正确");
            show_validate_msg("#email_add_input","error","邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }
    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_input").change(function (){
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName=" + empName,
            type:"POST",
            success:function (msg){
                if (msg.code==100){
                    show_validate_msg("#empName_input","success","用户名可用");
                    $("#emp_sava_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_input","error",msg.extend.va_msg);
                    $("#emp_sava_btn").attr("ajax-va","error");
                }
            }
        });
    });

    $("#emp_sava_btn").click(function () {

        if (!validate_add_form()) {
            return false;
        };

        if ($(this).attr("ajax-va")=="error"){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (msg){
                if (msg.code == 100){
                    // alert(msg.msg);
                    $("#empAddModal").modal('hide');
                    to_page(totalRecord);
                }else{
                    //显示失败信息
                    //console.log(msg);
                    if (undefined != msg.extend.errorFields.email){
                        show_validate_msg("#email_add_input","error",msg.extend.errorFields.email);
                    }
                    if (undefined != msg.extend.errorFields.empName){
                        show_validate_msg("#empName_input","error",msg.extend.errorFields.empName);
                    }

                }

            }
        });

    });

    //我们是按钮创建之前就绑定了click，所以绑定不上。
    //可以在创建按钮的时候绑定 /绑定点击.live()
    //jquery新版没有live，使用on()方法进行替代
    $(document).on("click" , ".edit_btn", function (){
        //alert("edit");
       // $("#empUpdateModal select").empty();
        getDepts("#empUpdateModal select");
        //查询员工信息
        getEmp($(this).attr("edit-id"));
        //把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emp/" + id,
            type:"GET",
            success:function (msg){
                var empDate = msg.extend.emp;
                $("#empName_update_static").text(empDate.empName);
                $("#email_update_input").val(empDate.email);
                $("#empUpdateModal input[name=gender]").val([empDate.gender]);
                $("#empUpdateModal select").val([empDate.dId]);
            }
        });
    }

    $("#emp_update_btn").click(function (){
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","");
        }
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function (){
                //alert(msg.msg);
                $("#empUpdateModal").modal("hide");
                to_page(currentPage);
            }
        })


    });
    $(document).on("click",".delete_btn",function (){
        //alert($(this).parents("tr").find("td:eq(1)").text());
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if (confirm("确认删除["+ empName +"]吗")){
            $.ajax({
                url:"${APP_PATH}/emp/" + empId,
                type:"DELETE",
                success:function (){
                   // alert(msg.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    $("#check_all").click(function (){
        //attr获取checked是undefined;
        //prop修改和读取dom原生属性的值
        //attr获取自定义属性的值
       $(".check_item").prop("checked",$(this).prop("checked"));

    });

    $(document).on("click",".check_item",function (){
       var flag = $(".check_item:checked").length==$(".check_item").length;
       $("#check_all").prop("checked",flag);
    });

    $("#emp_delete_modal_btn").click(function (){
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function (){

           empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
           del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-"
        });
        empNames = empNames.substring(0,empNames.length - 1);
        del_idstr = del_idstr.substring(0,del_idstr.length - 1);
        if (confirm("确认删除["+ empNames +"]吗")){
            $.ajax({
               url:"${APP_PATH}/emp/" + del_idstr,
               type:"DELETE",
               success:function (){
                    to_page(currentPage);
               }
            });
        }
    });
</script>
</body>
</html>
