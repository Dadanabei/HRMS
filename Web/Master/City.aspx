<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="City.aspx.cs" Inherits="HRMS.Web.Master.City" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Create Master City</h1>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create City
						   
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">

                                <div id="DivNoPol" class="form-group">
                                    <label>City Code</label>
                                    <input type="text" id="txtCityCode" class="form-control" />

                                </div>
                                <div  class="form-group">
                                    <label>City Name</label>
                                    <input type="text" id="txtCityName" class="form-control" />

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
                        List City
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="DataCity">
                                <thead>
                                    <tr>
                                        <th>City Code</th>
                                        <th>City Name </th>
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

        var oData = $('#DataCity').dataTable({
            "sPaginationType": "full_numbers",
            "bSort": false,
            "bFilter": false,
            "bPaginate": false,
            "aoColumns": [


                { "mDataProp": "City_Code" },
                { "mDataProp": "City_Name" },
                { "mDataProp": "ID" }

            ]
        });



        var glbid = "0";

        var obj = (ListData == '' ? [] : jQuery.parseJSON(ListData));

        if (obj.length > 0) {


            var City = new Object();

            for (var i = 0; i < obj.length; i++) {


                City.City_Code = obj[i]["City_Code"];
                City.City_Name = obj[i]["City_Name"];

                City.ID = "<img src='../css/icons/16/edit.png' title='Edit'  id='" + obj[i]["City_Code"] + "'  class='edit'/>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                    "<img src='../css/icons/16/cross.png' title='Hapus'  id='" + obj[i]["City_Code"] + "'  class='delete'/>";


                oData.fnAddData(City);
            }


        }

        $('#btnSave').on('click', function () {

            var Bank = new Object();


            var validation = "";
            var CityCode = $('#txtCityCode').val();
            var CityName = $('#txtCityName').val();

            if (City_Code == "")
                validation += "Silahkan isi City Code \n";
            if (CityName == "")
                validation += "Silahkan isi Cit Name \n";

            if (validation == "") {

                Bank.City_Code = $('#txtCityCode').val();
                Bank.CityName = $('#txtCityName').val();
                var oCity = { "oCity": JSON.stringify(Bank) };

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "City.aspx/Save",
                    data: "{'CityCode':'" + CityCode + "','CityName':'" + CityName + "'}",
                    // data: JSON.stringify(oBank),
                    dataType: "json",
                    success: function () {
                        alert("data City tersimpan");
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

