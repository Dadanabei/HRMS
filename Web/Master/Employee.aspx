<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="HRMS.Master.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="page-wrapper">

       
        <div class="row">
            <h3 class="page-header">Employee</h3>
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                      Form Employee
                           
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="DivNoSim" class="form-group">
                                    <label>NIP</label>
                                    <input type="text" id="txtNip" class="form-inline" />

                                </div>

                                <button type="submit" id="btnSave" class="btn btn-success">Simpan</button>
                                <button type="reset" class="btn btn-danger">Hapus</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
</asp:Content>
