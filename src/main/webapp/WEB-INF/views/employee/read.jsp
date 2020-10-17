<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<style>
    .modal-body {
        color: #6C6C6C;
        padding:16px 16px;

    }
    .row:last-child{
        height:30px;
    }
    .modal-header{
        text-align:center;
        font-size:2.5em;
        font-family:Verdana,Arial,sans-serif;
        text-shadow:1px 1px 1px dimgray;
    }

    .red{
        color:red;
    }
    .row{
        height:55px;
    }
  /*  .form-control{
        display: inline;
        width: 70%;
    }
*/
</style>
<body>
    <div class="modal-header">
        <span class="header">员工信息</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="close">
            <span >x</span>
        </button>
    </div>
    <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="name" class="form-inline"><span class="red ">*</span>姓名:</label>
                        <input type="text" name="name" id="name" readonly value="${empInfo.name}"  class="form-control" placeholder="员工姓名" >
                    </div>

                    <div class="form-group col-md-4">
                        <label for="workid"><span class="red">*</span>工号:</label>
                            <input type="text" name="workid" readonly id="workid"  value="${empInfo.workid}"  class="form-control" placeholder="格式：XX(部门缩写)123456">
                    </div>

                    <div class="radio col-md-4 disabled" >
                        <label><span class="red">*</span>性别：</label>
                        <label class="checkbox-inline">
                            <input type="radio" readonly name="gender" value="男" ${empInfo.gender=="男"?'checked':''}>
                            男
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="gender" value="女" ${empInfo.gender=="女"?'checked':''}>
                            女
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="nation"><span class="red">*</span>民族:</label>
                            <input type="text" readonly name="nation" id="nation" value="${empInfo.nation}" class="form-control" placeholder="如：汉族" >
                    </div>

                    <div class="form-group col-md-4">
                        <label for="specialty"><span class="red">*</span>专业:</label>
                            <input type="text" readonly name="specialty" id="specialty" value="${empInfo.specialty}" class="form-control" placeholder="请填写大学专业">

                    </div>
                    <div class="radio col-md-4 disabled">
                        <label>在职状态：</label>
                        <label class="checkbox-inline">
                            <input type="radio" name="workstate" ${(empInfo.workstate=="在职")?'checked' : ''} value="在职" >
                            在职
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="workstate" ${(empInfo.workstate=="离职")?'checked' : ''} value="离职">
                            离职
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-4">
                        <label for="address"><span class="red">*</span>地址:</label>
                            <input type="text" readonly name="address" id="address" value="${empInfo.address}" class="form-control" placeholder="请输入详细住址">

                    </div>

                    <div class="form-group col-md-4">
                        <label for="phone"><span class="red">*</span>号码:</label>
                            <input type="text" readonly name="phone" id="phone" class="form-control" value="${empInfo.phone}" placeholder="请输入联系号码" aria-describedby="helpId">

                    </div>


                    <div class="form-group col-md-4">
                        <label for="nativeplace"><span class="red">*</span>籍贯:</label>
                            <input type="text" readonly name="nativeplace" id="nativeplace" value="${empInfo.nativeplace}" class="form-control" placeholder="请输入详细住址">

                    </div>
                </div>
            <div class="row">
                <div class="form-group col-md-4">
                <label for="school"><span class="red">*</span>院校:</label>
                <input type="text" name="school" readonly id="school" value="${empInfo.school}" class="form-control" placeholder="请输入毕业院校">
                </div>

                <div class="form-group col-md-4.5">
                    <label for="idcard"><span class="red">*</span>身份证:</label>
                    <input type="text" name="idcard" readonly id="idcard" value="${empInfo.idcard}" class="form-control" placeholder="请输入身份证号">
                </div>
                <div class="form-group col-md-4">
                    <label for="email"><span class="red">*</span>邮箱:</label>
                    <input type="text" name="email" readonly id="email" value="${empInfo.email}" class="form-control" placeholder="例如：aa@163.com">
                </div>
            </div>


            <div class="row disabled">
                <div class="radio col-md-3">
                    <label><span class="red">*</span>学历：</label>
                        <select class="form-control" name="tiptopdegree">
                            <option  ${(empInfo.tiptopdegree==null)?'selected' : ''}>请选择</option>
                            <option value="本科" ${(empInfo.tiptopdegree=="本科")?'selected' : ''}>本科</option>
                            <option value="硕士" ${(empInfo.tiptopdegree=="硕士")?'selected' : ''}>硕士</option>
                            <option value="博士" ${(empInfo.tiptopdegree=="博士")?'selected' : ''}>博士</option>
                            <option value="大专" ${(empInfo.tiptopdegree=="大专")?'selected' : ''}>大专</option>
                            <option value="高中" ${(empInfo.tiptopdegree=="高中")?'selected' : ''}>高中</option>
                            <option value="初中" ${(empInfo.tiptopdegree=="初中")?'selected' : ''}>初中</option>
                            <option value="小学" ${(empInfo.tiptopdegree=="小学")?'selected' : ''}>小学</option>
                            <option value="其他" ${(empInfo.tiptopdegree=="其他")?'selected' : ''}>其他</option>
                        </select>

                </div>
                <div class="col-md-3 disabled">
                    <lable><span class="red">*</span>职位：</lable>
                        <select class="form-control" name="posid">
                            <option  ${(empInfo.posid==null)?'selected' : ''}>请选择</option>
                           <c:forEach var="position" items="${positions}">
                               <option value="${position.id}" ${(empInfo.posid==position.id)?'selected' : ''}>${position.name}</option>
                           </c:forEach>
                        </select>
                </div>
                <div class="radio col-md-3 disabled">
                    <label><span class="red">*</span>所属部门：</label>
                        <select class="form-control" name="departmentid">
                            <option  ${(empInfo.departmentid==null)?'selected' : ''}>请选择</option>
                            <c:forEach var="dept" items="${depts}">
                                <option value="${dept.id}" ${(empInfo.departmentid==dept.id)?'selected' : ''}>${dept.name}</option>
                            </c:forEach>
                        </select>
                </div>

                <div class="radio col-md-3 disabled">
                    <label>政治面貌：</label>
                        <select class="form-control" name="politic">
                            <option  ${(empInfo.politic==null)?'selected' : ''}>请选择</option>
                            <option value="群众" ${(empInfo.politic=="群众")?'selected' : ''}>群众</option>
                            <option value="共产党员" ${(empInfo.politic=="共产党员")?'selected' : ''}>共产党员</option>
                            <option value="共青团员" ${(empInfo.politic=="共青团员")?'selected' : ''}>共青团员</option>
                            <option value="其他" ${(empInfo.politic=="其他")?'selected' : ''}>其他</option>
                        </select>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-4">
                    <label><span class="red">*</span>出生日期:</label>
                    <input type="date" class="form-control" readonly name="birthday" value="<fmt:formatDate value="${empInfo.birthday}" pattern="yyyy-MM-dd"/>" >

                </div>

                <div class="form-group col-md-4">
                    <label for=""><span class="red">*</span>入职日期:</label>
                    <input type="date"class="form-control" readonly name="begindate" value="<fmt:formatDate value="${empInfo.begindate}" pattern="yyyy-MM-dd"/>" >
                </div>

                <div class="form-group col-md-4">
                    <label for=""><span class="red">*</span>转正日期：</label>
                    <input type="date" class="form-control" readonly name="conversiontime" value="<fmt:formatDate value="${empInfo.conversiontime}" pattern="yyyy-MM-dd"/>">
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-6">
                    <label for=""><span class="red">*</span>合同起始日期:</label>
                    <input type="date" name="begincontract" readonly value="<fmt:formatDate value="${empInfo.begincontract}" pattern="yyyy-MM-dd"/>"  class="form-control">
                </div>
                <div class="form-group col-md-6">
                <label for=""><span class="red">*</span>合同终止日期:</label>
                <input type="date" name="endcontract" readonly value="<fmt:formatDate value="${empInfo.endcontract}" pattern="yyyy-MM-dd"/>" class="form-control">
                </div>
            </div>

                <div class="row disabled">
                    <div class="radio col-md-6">
                        <label><span class="red">*</span>聘用形式：</label>
                        <label class="checkbox-inline" >
                            <input type="radio" name="engageform" value="劳务合同" ${empInfo.engageform=="劳务合同"?'checked':''}>
                            劳务合同
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="engageform"  value="劳动合同" ${empInfo.engageform=="劳动合同"?'checked':''}>
                            劳动合同
                        </label>
                    </div>

                    <div class="radio col-md-6 disabled">
                        <lable>婚姻状况：</lable>
                        <label class="checkbox-inline" >
                            <input type="radio" name="wedlock"${empInfo.wedlock=="未婚"?'checked':''} value="未婚">
                            未婚
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="wedlock" ${empInfo.wedlock=="已婚"?'checked':''} value="已婚">
                            已婚
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="wedlock" ${empInfo.wedlock=="离异"?'checked':''} value="离异">
                            离异
                        </label>
                    </div>
                </div>

                <div class="modal-footer" style="margin-top: -20px">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </form>
    </div>


</body>
</html>
