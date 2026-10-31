<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web.Employee.ShowDateFile" Title="شرکت دنیای پردازش :: نمایش ترددها"
    EnableEventValidation="false" CodeBehind="ShowDateFile.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: نمایش تردد</title>

    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/jquery.jeegoocontext2.0.0.min.js") %>"></script>
    <link href="<%=ResolveUrl("~/Style/cm_default/style.css") %>" rel="stylesheet" />
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/DataFile.js?v=1") %>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Scripts/input.mask.js") %>"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            ddl = document.getElementById('<%=EditEmpNo.ClientID %>');
            lblMesg = document.getElementById('<%=EditEmpNo.ClientID%>');

            CacheItems();

            ShowContextMenu();
            
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <input id="HdnCards" runat="server" type="hidden" />
    <input id="HdnEmpNO" runat="server" type="hidden" />

    <!--  Contextmenu -->


    <table style="background-color: LightSteelBlue; width: 100%" id="tMain" style="background-color: #aed7ff">
        <caption>
            <asp:Label ID="LblReqCaption" runat="server" Text="نمایش ترددها"></asp:Label>
        </caption>
        <tr>
            <td style="width: 20%;">
                <table style="background-color: whitesmoke; border: thin solid #000000;" cellpadding="2" cellspacing="2" id="trManager" runat="server" visible="false">
                    <tr>
                        <td colspan="2" class="cap">پرسنل و بخش های زیر مجموعه</td>
                    </tr>

                    <tr id="trAccessManagers" runat="server">
                        <td>دسترسی مجاز :</td>
                        <td>
                            <asp:DropDownList ID="EditManagers" runat="server" CssClass="Ddl" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditManagers_SelectedIndexChanged" />
                        </td>
                    </tr>

                    <tr>
                        <td>بخش :</td>
                        <td>
                            <asp:DropDownList ID="EditSections" runat="server" CssClass="Ddl" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditSections_SelectedIndexChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td>جستجو :</td>
                        <td>
                            <asp:TextBox ID="txtSearch" runat="server"
                                onkeyup="FilterItems(this.value)"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>پرسنل :</td>
                        <td>
                            <asp:DropDownList ID="EditEmpNo" runat="server" CssClass="Ddl" Width="175px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditEmpNo_SelectedIndexChanged" />
                            <asp:ImageButton ID="btnShowData" runat="server" ImageUrl="~/images/preview.jpg" OnClick="btnShowData_Click" ToolTip="نمایش ترددها" /></td>
                    </tr>

                </table>
            </td>
            <td>
                <table style="background-color: whitesmoke; border: thin solid #000000; min-width: 350px; margin-left: auto; margin-right: auto" cellpadding="2" cellspacing="2">
                    <tr>
                        <td>
                            <asp:ImageButton ID="BtnPreviousMonth" runat="server" ImageUrl="~/images/LeftBtnTop.jpg"
                                OnClick="BtnPreviousMonth_Click" ForeColor="#AED7FF" OnClientClick="ShowContextMenu();" Height="15px" />
                        </td>
                        <td bgcolor="#F3F3F3" style="height: 20px; min-width: 200px">
                            <asp:Label ID="lblMonth" runat="server" Text="فروردین 1390"
                                Font-Bold="True" Font-Names="tahoma" Font-Size="14pt" ForeColor="black"></asp:Label>
                        </td>
                        <td>
                            <asp:ImageButton ID="BtnNextMonth" runat="server" ImageUrl="~/images/RightBtnTop.jpg"
                                OnClick="BtnNextMonth_Click" OnClientClick="ShowContextMenu();" Height="15px"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 20%">
                <table style="background-color: whitesmoke; border: thin solid #000000;" cellpadding="2" cellspacing="2" id="trSupervisor" runat="server" visible="false">
                    <tr>
                        <td colspan="2" class="cap">پرسنل و بخش های (مربوط به کارمند دفتری)</td>
                    </tr>

                    <tr>
                        <td>بخش :</td>
                        <td>
                            <asp:DropDownList ID="EditSectionsSupervisor" runat="server" CssClass="Ddl" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditSectionsSupervisor_SelectedIndexChanged" />
                        </td>
                    </tr>
                    <tr>
                        <td>پرسنل :</td>
                        <td>
                            <asp:DropDownList ID="EditEmpNoSupervisor" runat="server" CssClass="Ddl" Width="200px" AutoPostBack="True"
                                OnSelectedIndexChanged="EditEmpNoSupervisor_SelectedIndexChanged" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" id="tdGrd" colspan="3" style="min-height: 550px" runat="server">
                <PT:GridViewEx ID="GrdShowDataFile" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" BorderColor="LightGray" OnDataSourceRequested="GrdShowDataFile_DataSourceRequested"
                    OnRowDataBound="GrdShowDataFile_RowDataBound" CssClass="RedDatagrid" BorderStyle="Solid"
                    BorderWidth="1px" EnableModelValidation="True" PageSize="31">
                    <PagerSettings FirstPageText="اولین" LastPageText="آخرین" NextPageText="بعدی" PreviousPageText="قبلی" />
                    <FooterStyle CssClass="RedDatagridFooter" />
                    <RowStyle CssClass="DGItem" />

                    <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
                    <HeaderStyle CssClass="RedDatagridHeader" />
                    <AlternatingRowStyle CssClass="DGAlternate" />
                </PT:GridViewEx>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <div style="direction: rtl">
                    <table id="tbl1">
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table id="tbColorhelp" style="background-color: whitesmoke; border: thin solid #000000; text-align: center; vertical-align: top; margin-left: auto; margin-right: auto"
                    cellpadding="5" cellspacing="15">
                    <tr>
                        <td>
                            <select id="chbRowsHelp" onchange="setColorName(this);">
                                <option>راهنمای رنگبندی ردیفها</option>
                                <option style="background-color: Pink">تعطیل</option>
                                <option style="background-color: LemonChiffon">تعطیل شیفت</option>
                                <option style="background-color: #FFC1FF">تعطیل خاص</option>
                            </select></td>
                        <td>
                            <select id="chbColumnHelp" onchange="setColorName(this);">
                                <option>راهنمای رنگبندی ستون تاریخ</option>
                                <option style="background-color: Pink">اضافه کار</option>
                                <option style="background-color: LemonChiffon">تاخيرسرويس</option>
                                <option style="background-color: #AED7FF">ماموريت روزانه</option>
                                <option style="background-color: Red">مرخصي روزانه</option>
                            </select></td>
                        <td>
                            <select id="chbTradodHelp" onchange="setColorName(this);">
                                <option>راهنمای رنگبندی ترددها</option>
                                <option style="background-color: Pink">اضافه کار</option>
                                <option style="background-color: #56FC5A">تاخيرسرويس</option>
                                <option style="background-color: #0806BF; color: #FFFFFF">ماموريت ساعتی</option>
                                <option style="background-color: #E3831F">مرخصي ساعتی</option>
                                <option style="background-color: #7412CC">مرخصي ساعتي بدون حقوق</option>
                                <option style="background-color: #CA1214">مرخصي ساعتي شخصي</option>
                                <option style="background-color: Magenta">ورود و خروج فراموش شده</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: thin solid #808080; border-radius: 5px; direction: ltr">
                            <div id="divRowsHelpColor" style="border: 1px solid #808080; border-radius: 30px; width: 30px; float: left; height: 15px"></div>
                            <div id="divRowsHelp" style="float: right"></div>
                        </td>
                        <td id="tdColumnHelp" style="border: thin solid #808080; border-radius: 5px; direction: ltr">
                            <div id="divColumnHelpColor" style="border: 1px solid #808080; border-radius: 30px; width: 30px; float: left; height: 15px"></div>
                            <div id="divColumnHelp" style="float: right"></div>
                        </td>
                        <td id="tdTradodHelp" style="border: thin solid #808080; border-radius: 5px; direction: ltr">
                            <div id="divTradodHelpColor" style="border: 1px solid #808080; border-radius: 30px; width: 30px; float: left; height: 15px"></div>
                            <div id="divTradodHelp" style="float: right"></div>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: center; border: 1px solid gray; background-color: whitesmoke;">
                <table style="background-color: whitesmoke; border: thin solid #000000; text-align: center; vertical-align: top; margin-left: auto; margin-right: auto"
                    cellpadding="5" cellspacing="15" runat="server" id="tblExternalFunction">
                    <tr>
                        <td runat="server" id="SaveRequestFromShowDataFileHeader" style="background-color: #000099; color: #FFFFFF; font-weight: bold;" >ثبت درخواستها<br />

                        </td>
                        <td runat="server" id="IsExportDataFileActiveHeader" colspan="3" style="background-color: #000099; color: #FFFFFF; font-weight: bold;">خروجی ها</td>
                    </tr>

                    <tr>
                        <td runat="server" id="SaveRequestFromShowDataFileItem">
                            <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="~/images/save.png"  ToolTip="ثبت درخواست" OnClick="BtnSave_Click" OnClientClick="return IsConfirmUser();" Visible="False" />
                            <input id="HdnValues" runat="server" type="hidden" />
                        </td>
                        <td runat="server" id="IsExportDataFileActiveItem1">
                            <asp:ImageButton ID="btnExportToExcel" runat="server" ImageUrl="~/images/excel.png" ToolTip="خروجی Excel" OnClick="btnExportToExcel_Click"
                                PostBackUrl="#" />
                        </td>
                        <td runat="server" id="IsExportDataFileActiveItem2">
                            <asp:ImageButton ID="btnExportToPDF" runat="server" ImageUrl="~/images/pdf.png" ToolTip="خروجی PDF" OnClick="btnExportToPDF_Click" PostBackUrl="#" Visible="False" />
                        </td>
                        <td runat="server" id="IsExportDataFileActiveItem3">
                            <asp:ImageButton ID="btnExportToWord" runat="server" ImageUrl="~/images/ms_word.png" ToolTip="خروجی Word" OnClick="btnExportToWord_Click" PostBackUrl="#" />
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>


</asp:Content>
