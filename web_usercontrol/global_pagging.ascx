<%@ Control Language="C#" AutoEventWireup="true" CodeFile="global_pagging.ascx.cs" Inherits="usercontrol_global_pagging" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type="text/css">
    /*Star ________ - paging - _____________*/
    .pagination {
        display: inline-block;
        border: 1px solid #CDCDCD;
        border-radius: 3px;
    }

        .pagination .btn-paging {
            display: block;
            float: left;
            width: 30px;
            cursor: pointer;
            line-height: 30px;
            height: 30px;
            outline: none;
            border-right: 1px solid #CDCDCD;
            border-left: 1px solid #CDCDCD;
            border-top: 0px solid #CDCDCD;
            border-bottom: 0px solid #CDCDCD;
            color: #555555;
            border-radius: 0;
            vertical-align: middle;
            text-align: center;
            text-decoration: none;
            font-weight: 700;
            font-size: 12px;
            background-color: #f3f3f3;
            background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f3f3f3), color-stop(100%, lightgrey));
            background-image: -webkit-linear-gradient(#f3f3f3, lightgrey);
            background-image: linear-gradient(#f3f3f3, lightgrey);
            padding: 0;
        }

            .pagination .btn-paging:hover, .pagination .btn-paging:focus, .pagination .btn-paging:active {
                background-color: #cecece;
                background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e4e4e4), color-stop(100%, #cecece));
                background-image: -webkit-linear-gradient(#e4e4e4, #cecece);
                background-image: linear-gradient(#e4e4e4, #cecece);
            }

            .pagination .btn-paging.disabled, .pagination .btn-paging.disabled:hover, .pagination .btn-paging.disabled:focus, .pagination .btn-paging.disabled:active {
                background-color: #f3f3f3;
                background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f3f3f3), color-stop(100%, lightgrey));
                background-image: -webkit-linear-gradient(#f3f3f3, lightgrey);
                background-image: linear-gradient(#f3f3f3, lightgrey);
                color: #A8A8A8;
                cursor: default;
            }

            .pagination .btn-paging:first-child {
                border: none;
                border-radius: 2px 0 0 2px;
            }

            .pagination .btn-paging:last-child {
                border: none;
                border-radius: 0 2px 2px 0;
            }

        .pagination .number-paging {
            float: left;
            margin: 0;
            padding: 0;
            width: 120px;
            height: 20px;
            outline: none;
            border: none;
            vertical-align: middle;
            text-align: center;
        }

    .input-paging {
    }

        .input-paging input[type="text"] {
            min-height: inherit;
        }

        .input-paging.dxeTextBox_Moderno td.dxic {
            padding: 0px 2px 0px 2px !important;
        }
    /* gigantic class for demo purposes */
    .gigantic.pagination {
        margin: 15px auto;
    }

    /*table.dxeTextBoxSys.form-control {
        display: inline-block !important;
    }*/

    .number-paging .number-page {
        width: 45px;
        height: 19px;
        margin-top: 3px;
        padding: 0px 5px;
        text-align: center;
        display: inline-block;
    }

    .number-page table {
        width: 35px !important;
        box-shadow: 0 0px 0px #3D3F94;
    }

    .number-page input[type="text"] {
        margin: 0 !important;
        padding: 0 !important;
    }

    .number-page td {
        padding: 0;
    }

    .number-page .input-sm {
        padding: 0;
    }

    .number-page .gigantic.pagination btn-paging {
        height: 30px;
        width: 30px;
        font-size: 25px;
        line-height: 30px;
    }

    #logo-product .owl-pagination {
        display: none;
    }

    .paging-new .center-paging {
        position: absolute;
        left: 50%;
    }

    .gigantic.pagination {
        position: absolute;
        padding: 0;
        left: -151px;
        width: 302px;
    }

        .gigantic.pagination .number-paging {
            width: 180px;
            font-size: 15px;
            line-height: 30px;
        }

    .paging-new {
        height: 62px;
    }
    /*End  ________ - paging - _____________*/
</style>


<div runat="server" id="pagingContainer">
    <div class="paging-new">
        <div class="center-paging">
            <div class="gigantic pagination">
                <asp:Button runat="server" ID="btnFirst" CssClass="btn-paging p-first" OnClick="btnFirst_ServerClick" Text="<<" data-action="first"></asp:Button>
                <asp:Button runat="server" ID="btnPrevious" CssClass="btn-paging p-prev" OnClick="btnPrevious_ServerClick" Text="<" data-action="previous"></asp:Button>

                <div class="number-paging">
                    <span class="text-paging">Page</span>
                    <div class="number-page">
                        <dx:ASPxTextBox Width="40px" Height="25px" Paddings-PaddingLeft="3" Font-Size="14px" runat="server" AutoPostBack="true" HorizontalAlign="Center" OnTextChanged="txtCurentPage_TextChanged" ID="txtCurentPage" ClientInstanceName="txtCurentPage" CssClass="input-paging" DisplayFormatString="###,##0" MaskSettings-IncludeLiterals="DecimalSymbol">
                            <MaskSettings Mask="<0..99>" />
                            <ClientSideEvents KeyPress="function(s,e){if(ASPxClientUtils.GetKeyCode(e.htmlEvent) ===  ASPxKey.Enter)
			return ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);                  
	}" />
                        </dx:ASPxTextBox>
                    </div>
                    <span class="text-paging" runat="server" id="lblMaxPage"></span>
                </div>
                <asp:Button runat="server" ID="btnNext" CssClass="btn-paging p-next" OnClick="btnNext_ServerClick" Text=">" data-action="next"></asp:Button>
                <asp:Button runat="server" ID="btnLast" CssClass="btn-paging p-last" OnClick="btnLast_ServerClick" Text=">>" data-action="last"></asp:Button>
            </div>
        </div>
    </div>
</div>
