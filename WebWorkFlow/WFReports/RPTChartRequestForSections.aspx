<%@ Page Language="C#" MasterPageFile="~/ReportMasterPagePW.Master" AutoEventWireup="true"
    CodeBehind="RPTChartRequestForSections.aspx.cs" Inherits="PW.WorkFlows.Web.WFReports.RPTChartRequestForSections" %>

<%@ Register Assembly="Stimulsoft.Report.Web" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function SetVisibleMonthDate(sender) {
            if (sender.checked) {
                divMonth.style.display = 'inline';
                divWeek.style.display = 'none';
            } else {
                divMonth.style.display = 'none';
                divWeek.style.display = 'inline';
            }
        }

        function SetVisibleWeekDate(sender) {
            if (sender.checked) {
                divWeek.style.display = 'inline';
                divMonth.style.display = 'none';
            } else {
                divWeek.style.display = 'none';
                divMonth.style.display = 'inline';
            }
        }
        function SetDisplay(containerName) {
            var container = document.getElementById(containerName);
            if (container.style.display == "inline")
                container.style.display = "none";
            else
                container.style.display = "inline";
        }
    </script>
    <style type="text/css">
        .slide
        {
            margin: 0;
            padding: 0;
            text-align: center;
            border-top: solid 4px #422410;
            background: url(../images/btn-slide.gif) no-repeat center top;
        }
        .btn-slide
        {
            background: url(../images/white-arrow.gif) no-repeat right -50px;
            text-align: center;
            width: 144px;
            height: 31px;
            padding: 10px 10px 0 0;
            margin: 0 auto;
            display: block;
            font: bold 120%/100% Arial, Helvetica, sans-serif;
            color: #fff;
            text-decoration: none;
            cursor: hand;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="panel" style="display: inline">
        <table id="t1" width="100%">
            <tr>
                <td valign="top">
                    <div style="text-align: center" class="cap">
                        .::نمودار تعداد درخواست::.
                    </div>
                    <table id="tblsearch" dir="rtl" width="100%">
                        <tr>
                            <td align="right" valign="top">
                                <div>
                                    <asp:RadioButton ID="Rb_ShowMonth" runat="server" Checked="True" GroupName="ShowType"
                                        Text="نمایش به تفکیک ماه" onclick="SetVisibleMonthDate(this)" />
                                    <div id="divMonth" style="display: inline">
                                        <br />
                                        از :&nbsp;<asp:DropDownList ID="EditYearMonthFrom" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:DropDownList ID="EditMonthFrom" runat="server">
                                        </asp:DropDownList>
                                        &nbsp; تا :&nbsp;<asp:DropDownList ID="EditYearMonthTo" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;
                                        <asp:DropDownList ID="EditMonthTo" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <br />
                                <div>
                                    <asp:RadioButton ID="Rb_ShowWeek" runat="server" GroupName="ShowType" Text="نمایش به تفکیک هفته"
                                        onclick="SetVisibleWeekDate(this)" />
                                    <div id="divWeek" style="display: none">
                                        <br />
                                        سال :<asp:DropDownList ID="EditYearWeek" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp; ماه :<asp:DropDownList ID="EditMonthWeek" runat="server">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp; از هفته :&nbsp;<asp:DropDownList ID="EditFromWeek" runat="server">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp; &nbsp; به مدت :&nbsp;<asp:DropDownList ID="EditToWeek" runat="server">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;هفته
                                    </div>
                                </div>
                                <br />
                                <div>
                                    بخش :&nbsp;&nbsp;
                                    <asp:DropDownList ID="EditSections" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td align="right" valign="top" width="400px">
                                انتخاب نوع مجوز :
                                <asp:CheckBoxList ID="EditCards" runat="server" RepeatColumns="2" Width="100%">
                                </asp:CheckBoxList>
                            </td>
                            <td align="center">
                                <asp:ImageButton ID="BtnShowReport" runat="server" ImageUrl="~/images/report_picture.png"
                                    OnClick="BtnShowReport_Click" ToolTip="نمایش نمودار تعداد درخواست" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div style="direction: ltr">
        <cc1:StiWebViewer ID="StiWebViewer1" runat="server" Width="100%" />
    </div>  
</asp:Content>
