<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="admin_Access.aspx.cs" Inherits="admin_page_module_access_admin_Access" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script type="text/javascript">
        function GUM() {
            swal("Bạn muốn đặt quyền hạn cho module này?",
                 "",
                 "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var change = document.getElementById('<%=btnAccessGUM.ClientID%>');
                        change.click();
                    }
                });
            }
            function GUF() {
                swal("Bạn muốn đặt quyền hạn cho form này?",
                     "",
                     "warning",
                    {
                        buttons: true,
                        dangerMode: true
                    }).then(function (value) {
                        if (value == true) {
                            var change = document.getElementById('<%=btnAccessGUF.ClientID%>');
                            change.click();
                        }
                    });
                }
                function UF() {
                    swal("Bạn muốn đặt quyền hạn cho user này?",
                         "",
                         "warning",
                        {
                            buttons: true,
                            dangerMode: true
                        }).then(function (value) {
                            if (value == true) {
                                var change = document.getElementById('<%=btnAccessUF.ClientID%>');
                                change.click();
                            }
                        });
                    }
                   function btnChiTiet() {
                        document.getElementById('<%=btnChiTiet.ClientID%>').click();
                    };
    </script>
    <asp:UpdatePanel ID="udAccess" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnAccessGUM" runat="server" CssClass="invisible" ClientIDMode="Static" OnClick="btnAccessGUM_Click" />
            <asp:Button ID="btnAccessGUF" runat="server" CssClass="invisible" ClientIDMode="Static" OnClick="btnAccessGUF_Click" />
            <asp:Button ID="btnAccessUF" runat="server" CssClass="invisible" ClientIDMode="Static" OnClick="btnAccessUF_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="title-block hidden-xs-up">
        <h3 class="title">Phân quyền Group User - Module - Form<span class="sparkline bar" data-type="bar"></span></h3>
    </div>
    <div class="card card-block">
        <div class="row">
            <div class="col-lg-3">
                <div class="ct" style="display:none" >
                    <asp:Button CssClass="btn btn-primary" ID="btnChiTiet" runat="server" OnClick="btnChiTiet_Click" Text="Chi tiết"></asp:Button>
                </div>
                <h4 class="title">Group User</h4>
                <dx:ASPxGridView ID="grvGUser" runat="server" ClientInstanceName="grvGUser" KeyFieldName="groupuser_id" Width="100%">
                    <Columns>
                        <dx:GridViewDataColumn Caption="Groupuser Name" FieldName="groupuser_name" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
                    </Columns>
                    <ClientSideEvents RowDblClick="btnChiTiet" />
                    <ClientSideEvents FocusedRowChanged="function(s,e){grvModule.Refresh();grvForm.Refresh();}" />
                    <SettingsBehavior AllowFocusedRow="true" />
                    <SettingsText EmptyDataRow="Empty" />
                    <SettingsLoadingPanel Text="Loading..." />
                    <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
                </dx:ASPxGridView>
            </div>
            <div class="col-lg-4">
                <h4 class="title">List Module</h4>
                <dx:ASPxGridView ID="grvModule" runat="server" ClientInstanceName="grvModule" KeyFieldName="module_id" Width="90%">
                    <Columns>
                        <dx:GridViewDataColumn Caption="Module Name" FieldName="module_name" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Status" FieldName="status" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">
                        </dx:GridViewDataColumn>
                    </Columns>
                    <ClientSideEvents FocusedRowChanged="function(s,e){grvForm.Refresh()}" RowDblClick="function(s,e){GUM()}" />
                    <SettingsBehavior AllowFocusedRow="true" />
                    <SettingsText EmptyDataRow="Empty" />
                    <SettingsLoadingPanel Text="Loading..." />
                    <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
                </dx:ASPxGridView>
            </div>
            <div class="col-lg-5">
                <h4 class="title">List Form</h4>
                <dx:ASPxGridView ID="grvForm" runat="server" ClientInstanceName="grvForm" KeyFieldName="form_id" Width="100%">
                    <Columns>
                        <dx:GridViewDataColumn Caption="Form Name" FieldName="form_name" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="Status" FieldName="status" HeaderStyle-HorizontalAlign="Center" CellStyle-VerticalAlign="Middle" CellStyle-HorizontalAlign="Center">
                        </dx:GridViewDataColumn>
                    </Columns>
                    <ClientSideEvents RowDblClick="function(s,e){GUF()}" />
                    <SettingsBehavior AllowFocusedRow="true" />
                    <SettingsText EmptyDataRow="Empty" />
                    <SettingsLoadingPanel Text="Loading..." />
                    <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
                </dx:ASPxGridView>
            </div>
        </div>
    </div>

    <div class="title-block">
        <h3 class="title">Phân quyền User - Form<span class="sparkline bar" data-type="bar"></span></h3>
    </div>
    <div class="card card-block">
        <div class="col-lg-3">
            <h4 class="title">User</h4>
            <dx:ASPxGridView ID="grvUser" runat="server" ClientInstanceName="grvUser" KeyFieldName="username_id" Width="100%">
                <Columns>
                    <dx:GridViewDataColumn Caption="User Name" FieldName="username_username" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents FocusedRowChanged="function(s,e){grvUserForm.Refresh();}" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Empty" />
                <SettingsLoadingPanel Text="Loading..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
        <div class="col-lg-4">
            <h4 class="title">List Form</h4>
            <dx:ASPxGridView ID="grvUserForm" runat="server" ClientInstanceName="grvUserForm" KeyFieldName="form_id" Width="100%">
                <Columns>
                    <dx:GridViewDataColumn Caption="Module Name" FieldName="form_name" HeaderStyle-HorizontalAlign="Center"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Status" FieldName="status" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">
                    </dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="function(s,e){UF()}" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Empty" />
                <SettingsLoadingPanel Text="Loading..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

