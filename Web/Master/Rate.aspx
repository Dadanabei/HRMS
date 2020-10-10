<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rate.aspx.cs" Inherits="HRMS.Web.Master.Rate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master Rate</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create Rate
						   
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">

                                <div id="DivNoPol" class="form-group">
                                    <label>Rate Code</label>
                                    <input type="text" id="txtRateType" class="form-control" />

                                </div>
                                <div  class="form-group">
                                    <label>Rate Name</label>
                                    <input type="text" id="txtRateDesc" class="form-control" />

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
                        List Rate
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="DataMobil">
                                <thead>
                                    <tr>
                                        <th>Rate Code</th>
                                        <th>Rate Name </th>
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
            var RateTypeCode = $('#txtRateType').val();
            var RateDesc = $('#txtRateDesc').val();

            if (RateTypeCode == "")
                validation += "Silahkan isi  Rate Type \n";
            if (RateDesc ==  "")
                validation += "Silahkan isi Rate Description \n";

            if (validation == "") {

                Bank.RateTypeCode = $('#txtRateType').val();
                Bank.RateDesc = $('#txtRateDesc').val();
                var oRate = { "oRate": JSON.stringify(Bank) };

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "Rate.aspx/Save",
                    data: "{'RateType':'" + RateTypeCode + "','RateDesc':'" + RateDesc +"'}",
                    // data: JSON.stringify(oBank),
                    dataType: "json",
                    success: function (e) {
                        alert("data rate tersimpan");
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