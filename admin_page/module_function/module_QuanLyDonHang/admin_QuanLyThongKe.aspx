<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="admin_QuanLyThongKe.aspx.cs" Inherits="admin_page_module_function_module_QuanLyDonHang_admin_QuanLyThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <div class="container" height="200">
        <canvas id="chatTheoNam"></canvas>
    </div>
    <div class="container" height="200">
        <canvas id="chatTheoThang"></canvas>
    </div>
    <script>
        var listDataYear = "<%=dataYear%>".split(',');
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chatTheoNam").getContext("2d");
            var data = {
                labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                datasets: [
                    {
                        label: "Doanh thu tháng "+<%=_year%>,
                        backgroundColor: "rgba(75,192,192,0.4)",
                        borderColor: "rgba(75,192,192,1)",
                        borderWidth: 1,
                        data: listDataYear,
                    },
                ],
            };

            var options = {
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            };

            var myChart = new Chart(ctx, {
                type: "bar",
                data: data,
                options: options,
            });
        });
    </script>
    <script>
        const str = "<%=dataMonth%>";
        var listDataMonth = str.split(',');
        document.addEventListener("DOMContentLoaded", function () {
            var ctx = document.getElementById("chatTheoThang").getContext("2d");
            var data = {
                labels: ["Ngày 1", "Ngày 2", "Ngày 3", "Ngày 4", "Ngày 5", "Ngày 6", "Ngày 7", "Ngày 8", "Ngày 9", "Ngày 10", "Ngày 11", "Ngày 12", "Ngày 13", "Ngày 14", "Ngày 15", "Ngày 16", "Ngày 17", "Ngày 18", "Ngày 19", "Ngày 20", "Ngày 21", "Ngày 22", "Ngày 23", "Ngày 24", "Ngày 25", "Ngày 26", "Ngày 27", "Ngày 28", "Ngày 29", "Ngày 30", "Ngày 31"],
                datasets: [
                    {
                        label: "Doanh thu ngày "+<%=_month%>,
                        borderColor: "rgba(75,192,192,1)",
                        borderWidth: 2,
                        fill: false,
                        data: listDataMonth,
                    },
                ],
            };

            var options = {
                scales: {
                    y: {
                        beginAtZero: true,
                    },
                },
            };

            var myChart = new Chart(ctx, {
                type: "line",
                data: data,
                options: options,
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

