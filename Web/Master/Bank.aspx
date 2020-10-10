<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="HRMS.Master.Bank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master Bank</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Bank
						   
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">

                                <div id="DivNoPol" class="form-group">
                                    <label>Bank Code</label>
                                    <input type="text" id="txtBankCode" class="form-control" />

                                </div>
                                <div  class="form-group">
                                    <label>Bank Name</label>
                                    <input type="text" id="txtBankName" class="form-control" />

                                </div>
                               
                                <button type="submit" id="btnSave" class="btn btn-success">Simpan</button>
                                <button type="reset" class="btn btn-danger">Hapus</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        List Bank
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="DataBank">
                                <thead>
                                    <tr>
                                        <th>Bank Code</th>
                                        <th>Bank Name </th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                            </table>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        var ListData = '<%= _ListData %>'

        var oData = $('#DataBank').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [

                
                { "mDataProp": "BankCode" },
                { "mDataProp": "BankName" },
                { "mDataProp": "ID" }

            ]
        });



        var glbid = "0";

        var obj = (ListData == '' ? [] : jQuery.parseJSON(ListData));

        if (obj.length > 0) {


            var Bank = new Object();

            for (var i = 0; i < obj.length; i++) {


                Bank.BankCode = obj[i]["BankCode"];
                Bank.BankName = obj[i]["BankName"];

                Bank.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + obj[i]["BankCode"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + obj[i]["BankCode"] + "'  class='delete'/>";


                oData.fnAddData(Bank);
            }


        }

        $('#btnSave').on('click', function () {

            var Bank = new Object();


            var validation = "";
            var BankCode = $('#txtBankCode').val();
            var BankName = $('#txtBankName').val();

            if (BankCode == "")
                validation += "Silahkan isi Bank Code \n";
            if (BankName == "")
                validation += "Silahkan isi Bank Name \n";

            if (validation == "") {

                Bank.BankCode = $('#txtBankCode').val();
                Bank.BankName = $('#txtBankName').val();
                var oBank = { "oBank": JSON.stringify(Bank) };

                $.ajax({
                    type: "POST",
                    async: true,
                    contentType: "application/json; charset=utf-8",
                    url: "Bank.aspx/Save",
                    data: "{'BankCode': '" + BankCode + "','BankName':'" + BankName +"'}",
                    // data: JSON.stringify(oBank),
                    dataType: "json",
                    success: function (data, textStatus, xhr) {
                        alert(data);
                        //location.reload();

                    },
                    error: function (xhr, textStatus, error) {
                       
                        alert(xhr.statusText);
                        return false;
                    }
                });
            } else {
                alert(validation);
            }
        
        });

    </script>
</asp:Content>
