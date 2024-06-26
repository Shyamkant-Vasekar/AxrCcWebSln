﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tmp.aspx.vb" Inherits="EngineersKatta_PowerData_tmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script> <!-- New -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script>
  $(function () {
    $('#datetimepicker1').datetimepicker();
  });
</script>
</head>
<body>
    <form id="form1" runat="server">
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading">Schedule an Appointment</div>
      <div class="panel-body">
         <div class="row">
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">First Name</label>
                  <input type="text" class="form-control" name="fname" id="fname"/>
               </div>
            </div>
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">Last Name</label>
                  <input type="text" class="form-control" name="lname" id="lname"/>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">Email</label>
                  <input type="text" class="form-control" name="email" id="email"/>
               </div>
            </div>
            <div class='col-md-6'>
               <div class="form-group">
                  <label class="control-label">Appointment Time</label>
                  <div class='input-group date' id='datetimepicker1'>
                     <input type='text' class="form-control" />
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
               </div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="Submit"/>
      </div>
   </div>
</div>
    </form>
</body>
</html>
