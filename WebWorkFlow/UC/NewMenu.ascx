<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewMenu.ascx.cs" Inherits="PW.WorkFlows.Web.UC.NewMenu" %>
<ACT:Accordion ID="MyAccordion" runat="Server" SelectedIndex="0" HeaderCssClass="accordionHeader"
    HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
    AutoSize="None" FadeTransitions="false" TransitionDuration="250" FramesPerSecond="40"
    RequireOpenedPane="false" SuppressHeaderPostbacks="true" Width="100%">
    <Panes>
        <ACT:AccordionPane ID="MenuAdmin_System" runat="server">
            <Header>معرفی اطلاعات سیستم</Header>
            <Content>
                <a id="Menu_SetPermission" runat="server" href="~/Admin/SetPermission.aspx">تنظیمات مجوزها در گردش کار</a>
                <a id="Menu_InsertUsers" runat="server" href="~/Admin/InsertUsers.aspx">معرفی کاربر ADMIN</a>                
                <a id="Menu_ChangeEmployeesPassword" runat="server" href="~/Admin/ChangeEmployeesPassword.aspx">معرفی وتنظیم رمز عبور</a>
                <a id="Menu_SetAccessEmp" runat="server" title="معرفی مجوزهای قابل درخواست" href="~/Admin/SetAccessEmp.aspx">مجوزهای قابل درخواست</a>
                <a id="Menu_SetAccessEmpPerCards" runat="server" title="معرفی دسترسی پرسنل به مجوزها" href="~/Admin/SetAccessEmpPerCards.aspx">دسترسی پرسنل به مجوزها</a>
                <a id="Menu_SetEmpEmgr" runat="server" href="~/Admin/SetEmpEmgr.aspx">تعریف کارتابل خاص</a>
                <a id="Menu_ApproveParallel" runat="server" href="~/Admin/ManageParallelApprove.aspx">معرفی تایید موازی</a>
                <a id="Menu_ManageSignature" runat="server" href="~/Admin/ManageSignature.aspx">معرفی امضاء</a>
                <a id="Menu_BaseInfo" runat="server" href="~/Admin/BaseInfo.aspx">معرفی وسیله تردد</a>
                <a id="Menu_PrintSetting" runat="server" href="~/Admin/PrintSetting.aspx">تنظیمات چاپ درخواست</a>
                <a id="Menu_Settings" runat="server" href="~/Admin/Settings.aspx">تنظیمات سیستم</a>
            </Content>
        </ACT:AccordionPane>

        <ACT:AccordionPane ID="MenuAdmin_Manager" runat="server">
            <Header>مدیران</Header>
            <Content>
                <a id="Menu_InsertManagers" runat="server" href="~/Admin/InsertManagers.aspx">معرفی مدیران بخشها</a>
                <a id="Menu_LimitManager" runat="server" href="~/Admin/LimitManager.aspx">اعمال محدودیت مدیران</a>
                <a id="Menu_Substitute" runat="server" href="~/Employee/Substitute.aspx">معرفی جانشین</a>
                <a id="Menu_Conferment" runat="server" href="~/Employee/Conferment.aspx">تفویض اختیار</a>
                <a id="Menu_SetAccessManager" runat="server" href="~/Admin/SetAccessManager.aspx">نمایش چارت سازمانی</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuAdmin_Supervisor" runat="server">
            <Header>کارمند دفتری</Header>
            <Content>
                <a id="Menu_InsertSupervisor" runat="server" href="~/Admin/InsertSupervisor.aspx">معرفی کارمند دفتری</a>
                <a id="Menu_EmployeeSupervisor" runat="server" href="~/Admin/EmployeeSupervisor.aspx">معرفی پرسنل کارمند دفتری</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuAdmin_PrintViewer" runat="server">
            <Header>مسئول چاپ احکام</Header>
            <Content>
                <a id="Menu_InsertPrintViewer" runat="server" href="~/Admin/InsertPrintViewer.aspx">معرفی مسئول چاپ احکام</a>
                <a id="Menu_EmployeePrintViewer" runat="server" href="~/Admin/EmployeePrintViewer.aspx">تنظیمات مسئول چاپ احکام</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuAdmin_Warden" runat="server">
            <Header>بازرس</Header>
            <Content>
                <a id="Menu_InsertWarden" runat="server" href="~/Admin/InsertWarden.aspx">معرفی بازرسان</a>
                <a id="Menu_SetAccessWarden" runat="server" href="~/Admin/SetAccessWarden.aspx">تنظیمات کارکرد بازرس</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuAdmin_Report" runat="server">
            <Header>گزارش</Header>
            <Content>
                <a id="Menu_RPTTurnoverManager" runat="server" href="~/WFReports/RPTTurnoverManager.aspx">عملکرد مدیران</a>
                <a id="Menu_RPTChartRequestForSections" runat="server" href="~/WFReports/RPTChartRequestForSections.aspx">نمودار تعداد درخواستها</a>
                <a id="Menu_RPTRequest" runat="server" href="~/WFReports/RPTRequest.aspx">گزارش درخواستها</a>
                <a id="Menu_RPTRequestByEmp" runat="server" href="~/WFReports/RPTRequestByEmp.aspx">مجوزهای پرسنل</a>
                <a id="Menu_RPTLog" runat="server" href="~/WFReports/RPTLog.aspx">گزارش اتفاقات</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuAdmin_Setting" runat="server">
            <Header>سایر موارد</Header>
            <Content>
                
                <a id="Menu_AccessTimeGroup" runat="server" href="~/Admin/AccessTimeGroup.aspx">معرفی بازه های دسترسی</a>
                <a id="Menu_UsersAccessTimeGroup" runat="server" href="~/Admin/UsersAccessTimeGroup.aspx">معرفی بازه دسترسی پرسنل</a>
                <a id="Menu_ManageNews" runat="server" href="~/Admin/ManageNews.aspx">مدیریت اطلاعیه ها</a>
                
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_MenuManger" runat="server">
            <Header>کارتابل مدیریت</Header>
            <Content>
                <a id="Menu_RequestsList" runat="server" href="~/Employee/RequestsList.aspx?RS=0">بررسی نشده</a>
                <a id="Menu_RequestsApprove" runat="server" href="~/Employee/RequestsList.aspx?RS=1">تایید شده</a>
                <a id="Menu_RequestsReject" runat="server" href="~/Employee/RequestsList.aspx?RS=2">رد شده</a>
                <a id="Menu_RequestsExpire" runat="server" href="~/Employee/RequestsList.aspx?RS=3">تاریخ گذشته</a>
                <a id="Menu_RequestsMoveUp" runat="server" href="~/Employee/RequestsList.aspx?RS=4">ارجاع شده</a>
                <a id="Menu_RequestsCancel" runat="server" href="~/Employee/RequestsList.aspx?RS=5">درخواست های ابطال</a>
                <a id="Menu_RequestsComments" runat="server" href="~/Employee/RequestsList.aspx?RS=6">اظهار نظر شده</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_MenuParallel" runat="server">
            <Header>کارتابل کارشناسی</Header>
            <Content>
                <a id="Menu_ParallelApproveList" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=0&FS=0">بررسی نشده</a>
                <a id="Menu_ParallelApprove" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=1&FS=0">تایید شده</a>
                <a id="Menu_ParallelReject" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=2&FS=0">رد شده</a>
            </Content>
        </ACT:AccordionPane>
         <ACT:AccordionPane ID="MenuEmployee_MenuParallelSection" runat="server">
            <Header>کارتابل کارشناسی بخش</Header>
            <Content>
                <a id="Menu_SectionParallelApproveList" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=0&FS=1">بررسی نشده</a>
                <a id="Menu_SectionParallelApprove" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=1&FS=1">تایید شده</a>
                <a id="Menu_SectionParallelReject" runat="server" href="~/Employee/ParallelApproveList.aspx?RSP=2&FS=1">رد شده</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_ManageRequest" runat="server">
            <Header>مدیریت درخواستها</Header>
            <Content>
                <a id="Menu_RequestsArchive" runat="server" href="~/Employee/RequestsArchive.aspx">لیست درخواستها</a>
                <a id="Menu_WardenControl" runat="server" href="~/Employee/WardenControl.aspx">بازرسی و مشاهده درخواست</a>
                <a id="Menu_DifrenceRequest" runat="server" href="~/Employee/DifrenceRequest.aspx">مجوز ساعتی غیر مجاز</a>
                <a id="Menu_PrintViewer" runat="server" href="~/Employee/PrintViewer.aspx">چاپ احکام</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_DailyRequest" runat="server">
            <Header>مجوزهای روزانه</Header>
            <Content>
                <a id="Menu_DailyRequest" runat="server" href="~/Employee/DailyRequest.aspx">مرخصی</a>
                <a id="Menu_DailyDuty" runat="server" href="~/Employee/DailyDuty.aspx">ماموریت</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_TimeRequest" runat="server">
            <Header>مجوزهای ساعتی</Header>
            <Content>
                <a id="Menu_TimeLeave" runat="server" href="~/Employee/TimeLeave.aspx">مرخصی</a>
                <a id="Menu_TimeDuty" runat="server" href="~/Employee/TimeDuty.aspx">ماموریت</a>
                <a id="Menu_TimeDutyNoReturn" runat="server" href="~/Employee/TimeDutyNoReturn.aspx">ماموریت بدون بازگشت</a>
                <a id="Menu_LeaveAdditionRequest" runat="server" href="~/Employee/LeaveAdditionRequest.aspx">افزایش و کاهش مرخصی</a>
                <a id="Menu_OvertimeRequest" runat="server" href="~/Employee/OvertimeRequest.aspx">اضافه کاری</a>
            </Content>
        </ACT:AccordionPane>
        <ACT:AccordionPane ID="MenuEmployee_OtherRequest" runat="server">
            <Header>سایر خدمات</Header>
            <Content>
                <a id="Menu_ShowDateFile" runat="server" href="~/Employee/ShowDateFile.aspx">نمایش ترددها</a>
                <a id="Menu_ShiftReplaceRequest" runat="server" href="~/Employee/ShiftReplaceRequest.aspx">جابجایی در شیفت</a>
                <a id="Menu_ForgottenInOutRequest" runat="server" href="~/Employee/ForgottenInOutRequest.aspx">ورود و خروج فراموش شده</a>
                <a id="Menu_InOutCorrectionRequest" runat="server" href="~/Employee/InOutCorrectionRequest.aspx">اصلاح ورود و خروج</a>
                <a id="Menu_InOutTypeCorrectionRequest" runat="server" href="~/Employee/InOutTypeCorrectionRequest.aspx">اضافه کار تردد</a>
                <a id="Menu_ShowDateFilePerEmp" runat="server" href="~/Employee/ShowDateFilePerEmp.aspx">نمایش ترددهای روز خاص</a>
            </Content>
        </ACT:AccordionPane>
    </Panes>
</ACT:Accordion>
