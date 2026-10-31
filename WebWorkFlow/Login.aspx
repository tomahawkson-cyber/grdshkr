<%@ Page Language="C#" AutoEventWireup="true" Inherits="PW.WorkFlows.Web.Login" CodeBehind="Login.aspx.cs" %>

<%@ Register Src="~/UC/login.ascx" TagName="uc_login" TagPrefix="uc3" %>
<%@ Register Src="~/UC/bottomlogo.ascx" TagName="bottomlogo" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  dir="rtl">
<head runat="server">
    <title>شرکت دنیای پردازش :: ورود کاربران </title>
    <meta http-equiv="x-ua-compatible" content="IE=8" />
    <link href="Style/Css.css" rel="stylesheet" type="text/css" />
    <link href="Style/portal.css" rel="stylesheet" type="text/css" />
    <link href="Style/modern-ui.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Workflow.ico" type="image/x-icon" />
</head>
<body>
    <form id="Form1" runat="server">
    <table align="center" cellpadding="0" cellspacing="0" width="966">
        <tr>
            <td>
                <table class="TBLHeader" align="center">
                    <tr>
                        <td class="TDHeader" valign="middle">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <h3>
                </h3>
                <uc3:uc_login ID="login1" runat="server" />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="100%">
                    <tr>
                        <td align="center">
                            <uc4:bottomlogo ID="bottomlogo1" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
