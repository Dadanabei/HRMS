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
                            <table class="table table-striped table-bordered table-hover" id="DataMobil">
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
                    contentType: "application/json",
                    url: "Bank.aspx/Save",
                    data: "{'BankCode':'ok','BankName':'ok'}",
                    // data: JSON.stringify(oBank),
                    dataType: "json",
                    success: function (e) {
                        alert("");
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
