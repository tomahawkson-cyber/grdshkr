<%@ Control Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Employee.UC.Substitute"
    CodeBehind="Substitute.ascx.cs" %>
<%@ Register Src="~/UC/DatePicker.ascx" TagName="DatePicker" TagPrefix="uc1" %>
<script type="text/javascript">
    $(window).load(function() {
        CacheItems();
    });
    /*****************************************dropdown search***************************************************/
    var ddlText, ddlValue, ddl;
    function CacheItems() {
        ddlText = new Array();
        ddlValue = new Array();
        ddl = document.getElementById("<%=Edit_SEmp_No.ClientID %>");
        if (ddl == null)
            return;
        for (var i = 0; i < ddl.options.length; i++) {
            ddlText[ddlText.length] = ddl.options[i].text;
            ddlValue[ddlValue.length] = ddl.options[i].value;
        }
    }


    function FilterItems(value) {
        
        value = value.replace('ی', 'ي');
        ddl.options.length = 0;
        for (var i = 0; i < ddlText.length; i++) {
            if (ddlText[i].toLowerCase().indexOf(value) != -1) {
                AddItem(ddlText[i], ddlValue[i]);
            }
        }
        if (ddl.options.length == 0) {
            AddItem("موردی پیدا نشد", "");
        }
    }

    function AddItem(text, value) {
        var opt = document.createElement("option");
        opt.text = text;
        opt.value = value;
        ddl.options.add(opt);
    }
    /********************************************************************************************/


</script>
<table id="TBL_MSG" runat="server" visible="false" border="1" cellpadding="2" cellspacing="0"
    style="font-family: Tahoma; font-size: 9pt; color: #0000FF; background-color: #C0C0C0; position: absolute; left: 30%; top: 40%; width: 300px; cursor: default; z-index: 100; height: 70px"
    dir="rtl">
    <tr>
        <td dir="rtl" align="right" valign="middle" style="border-right-width: 0px; border-bottom-width: 0px;"
            rowspan="2" width="10%">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/msg_icon_1.png" />
            &nbsp;
        </td>
        <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
            <asp:Label ID="lblConfirm" runat="server" Width="100%"></asp:Label>
            <br />
        </td>
    </tr>
    <tr>
        <td dir="rtl" align="center" valign="middle" style="border-left-width: 0px;">
            <asp:Button ID="btn_okMSG" runat="server" Style="border: 1px solid black; font-size: 9pt; color: black; font-family: tahoma; background-color: #ffffff; height: 20px;"
                Text="&nbsp;&#1576;&#1604;&#1740;&nbsp;" UseSubmitBehavior="False" OnClick="btn_okMSG_Click" />
        </td>
    </tr>
</table>
<div style="background-color: LightSteelBlue; width: 100%; height: 100%">
    <table style="background-color: whitesmoke; border: thin solid #000000; text-align: center; vertical-align: top; margin-left: auto; margin-right: auto"
        cellpadding="5" cellspacing="5">
        <caption class="cap">
            معرفی جانشین</caption>
        <tr id="trManager" runat="server">
            <td class="TdLblSty">شماره مدیر :
            </td>
            <td class="TdEditorSty" colspan="3" dir="rtl" align="left">
                <asp:DropDownList ID="Edit_Managers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Edit_Managers_SelectedIndexChanged" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">شماره پرسنلی :
            </td>
            <td class="TdEditorSty" colspan="3" dir="rtl" align="left">
                <asp:TextBox ID="txtSearch" runat="server"
                    onkeyup="FilterItems(this.value)" ToolTip="جستجو" placeholder="جستجوی شماره"></asp:TextBox>
                <br/>
                <asp:DropDownList ID="Edit_SEmp_No" runat="server" Width="200px" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">تاریخ شروع :
            </td>
            <td class="TdEditorSty">
                <uc1:DatePicker ID="Edit_S_FDate" runat="server" />
            </td>
            <td>تاریخ پایان :
            </td>
            <td>
                <uc1:DatePicker ID="Edit_S_TDate" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="TdLblSty">فعال :
            </td>
            <td class="TdEditorSty">
                <asp:CheckBox ID="chbAvtive" runat="server" />
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="TdLblSty" colspan="2">
                <asp:Button ID="BtnAdd" runat="server" Text="جدید" CssClass="btn" OnClick="BtnAdd_Click"
                    CausesValidation="False" />
                &nbsp;<asp:Button ID="BtnOk" runat="server" Text="ثبت" CssClass="btn" OnClick="BtnOk_Click"
                    CausesValidation="true" />
            </td>
            <td class="TdLblSty" colspan="2" align="center">
                <asp:Label ID="lblErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>شماره پرسنلی<br />
                <asp:TextBox ID="EditEmpNo" runat="server"></asp:TextBox>
            </td>
            <td>نام خانوادگی<br />
                <asp:TextBox ID="EditEmFamily" runat="server"></asp:TextBox>
            </td>
            <td>نام<br />
                <asp:TextBox ID="EditEmName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="BtnSearchUnEmp" runat="server" Height="20px" ImageUrl="~/images/icon_find.GIF"
                    OnClick="BtnSearchUnEmp_Click" ToolTip="جستجو" Width="20px" />
            </td>
        </tr>
    </table>
    <PT:GridViewEx ID="GrdSubstitute" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" BorderColor="LightGray" Caption="لیست جانشین ها "
        EnableSortingAndPagingCallbacks="True" OnDataSourceRequested="GrdSubstitute_DataSourceRequested"
        Style="width: 100%" CssClass="RedDatagrid" EnableModelValidation="True" BorderStyle="Solid"
        DataKeyNames="SubstituteID" OnRowCommand="GrdSubstitute_RowCommand">
        <PagerSettings FirstPageText="اول" LastPageText="آخر" NextPageText="بعدی" PreviousPageText="قبلی"
            Mode="NumericFirstLast" PageButtonCount="15" />
        <FooterStyle CssClass="RedDatagridFooter" />
        <Columns>
            <asp:BoundField DataField="SubstituteEmpNo" HeaderText="شماره پرسنلی" SortExpression="SubstituteEmpNo">
                <ItemStyle Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="NAME" HeaderText="نام" SortExpression="NAME" />
            <asp:BoundField DataField="FAMILY" HeaderText="نام خانوادگی" SortExpression="FAMILY" />
            <asp:BoundField DataField="FStartDate" HeaderText="شروع" SortExpression="StartDate">
                <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="FEndDate" HeaderText="پایان" SortExpression="EndDate">
                <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="FActive" HeaderText="وضعیت جاری" SortExpression="IsActive">
                <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="OFIsInsertByAdmin" HeaderText="ثبت کننده" SortExpression="OFIsInsertByAdmin">
                <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="BtnActive" runat="server" CommandName="IsActive" Text='<%# Eval("OFActive") %>' Width="90px"
                        CommandArgument='<%# Eval("SubstituteID")+";"+Eval("SubstituteEmpNo")+";"+Eval("IsActive") %>' />
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#ffecec" ForeColor="White" HorizontalAlign="Center" CssClass="pagination" />
        <HeaderStyle CssClass="RedDatagridHeader" />
        <AlternatingRowStyle CssClass="RedDatagridAlternate" />
        <RowStyle CssClass="RedDatagridItem" />
    </PT:GridViewEx>
</div>
