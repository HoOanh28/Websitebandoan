<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="admin_QuanLyNhomSanPham.aspx.cs" Inherits="admin_page_module_function_module_QuanLySanPham_admin_QuanLyNhomSanPham" %>

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
        function func() {
            grvList.Refresh();
            popupHide();
        }
        function popupShow() {
            document.getElementById('showPopup').click();
        }
        function popupHide() {
            document.getElementById('btnClosePopup').click();
        }
        function btnChiTiet() {
            document.getElementById('<%=btnChiTiet.ClientID%>').click();
        }
        function checkNULL() {
            var name = document.getElementById('<%= txtName.ClientID%>');
            var link = document.getElementById('<%= txtLink.ClientID%>');
            var key = document.getElementById('<%= txtKeywords.ClientID%>');
            var des = document.getElementById('<%= txtDescription.ClientID%>');

            if (name.value.trim() == "") {
                swal('Tên không được để trống!', '', 'warning').then(function () { name.focus(); });
                return false;
            }
            if (key.value.trim() == "") {
                swal('Từ khoá không được để trống!', '', 'warning').then(function () { position.focus(); });
                return false;
            }
            if (des.value.trim() == "") {
                swal('Mô tả không được để trống!', '', 'warning').then(function () { position.focus(); });
                return false;
            }
            if (link.value.trim() == "") {
                swal('Url thân thiện form không được để trống!', '', 'warning').then(function () { link.focus(); });
                return false;
            }
            return true;
        }
        function confirmDel() {
            swal("Bạn có thực sự muốn xóa?",
                "Nếu xóa, dữ liệu sẽ không thể khôi phục.",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var xoa = document.getElementById('<%=btnXoa.ClientID%>');
                        xoa.click();
                    }
                });
        }
    </script>
    <div class="card card-block">
        <center style="font-size: 50px">
            <p>Quản lý nhóm sản phẩm</p>
        </center>
        <div class="form-group row">
            <div class="col-sm-10 col-sm-offset-2">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                        <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="cate_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Tên thực đơn" FieldName="cate_name" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Từ khoá" FieldName="_keywords" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Mô tả ngắn" FieldName="_description" HeaderStyle-HorizontalAlign="Center" Width="55%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Url thân thiện" FieldName="link" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="btnChiTiet" />
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Empty" />
                <SettingsLoadingPanel Text="Loading..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
    <div>
        <!-- Trigger the modal with a button -->
        <button id="showPopup" type="button" class="btn btn-info btn-lg" style="display: none;" data-toggle="modal" data-target="#myModal">Open Modal</button>
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button id="btnClosePopup" type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Thêm thực đơn</h4>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="udPopup" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label text-xs-right">Tên thực đơn:</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control boxed"> </asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label text-xs-right">Từ khoá:</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtKeywords" runat="server" ClientIDMode="Static" CssClass="form-control boxed"> </asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label text-xs-right">Mô tả ngắn:</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtDescription" runat="server" ClientIDMode="Static" CssClass="form-control boxed"> </asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label text-xs-right">Url thân thiện:</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtLink" runat="server" ClientIDMode="Static" CssClass="form-control boxed"> </asp:TextBox>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="modal-footer">
                        <asp:UpdatePanel ID="udLuu" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

