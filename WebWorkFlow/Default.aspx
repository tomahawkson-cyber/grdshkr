<%@ Page Language="C#" MasterPageFile="~/MasterPagePW.master" AutoEventWireup="true"
    Inherits="PW.WorkFlows.Web._Default" CodeBehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>شرکت دنیای پردازش :: صفحه اول</title>
    <style type="text/css">
        .col-left {
            float: left;
            padding-left: 1%;
            width: 48%;
        }

        .col-right {
            padding-right: 1%;
            float: right;
            width: 48%;
        }

        .alert {
            padding: 8px 35px 8px 14px;
            margin-bottom: 18px;
            color: #c09853;
            text-shadow: 0 1px 0 rgba(255,255,255,0.5);
            background-color: #fcf8e3;
            border: 1px solid #fbeed5;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        .alert-info {
            color: #3a87ad;
            background-color: #d9edf7;
            border-color: #bce8f1;
            word-wrap: break-word;
        }

        .alert {
            padding: 8px 14px 8px 35px;
            text-align: justify;
        }

        .news-section h4 {
            margin: .5em 0;
            border-bottom: 1px solid #d4d3c6;
            color: #6c9d2a;
        }

        .news-section {
            margin-bottom: 5px;
            border-bottom: 4px solid #cfcdaf;
            background: #e9e8d9 none repeat scroll 0%;
            direction: rtl;
            padding: .5em;
        }

        #page {
            padding: 20px 0;
            background-color: #cfe0d5;
            background-color: #fbfbfb;
            border-radius: 5px;
            direction: rtl;
        }

        .news-section p {
            margin-bottom: .7em;
            position: relative;
        }

        .news-section span {
            color: #9A9A9A;
        }

        h4 {
            font-size: 18px;
            line-height: 27px;
        }

        [class^="icon-"], [class*=" icon-"] {
            display: inline-block;
            width: 14px;
            height: 14px;
            line-height: 14px;
            vertical-align: text-top;
            background-image: url("../images/glyphicons-halflings.png");
            background-position: 14px 14px;
            background-repeat: no-repeat;
        }

        .icon-time {
            background-position: -48px -24px;
            margin-right: 10px;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function ShowNews(news) {
            var result = "<p>" + news.title + "</p>";
            result = result.replace(/\r\n\r\n/g, "</p><p>").replace(/\n\n/g, "</p><p>");
            result = result.replace(/\r\n/g, "<br />").replace(/\n/g, "<br />");
            $("#divNews").hide().html(result).show(500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />
    <div class="col-left" runat="server" id="divLeft">
        <div class="alert alert-info" id="divQuotation" runat="server">
        </div>

        <asp:Repeater ID="newsRepeater" runat="server" OnItemDataBound="newsRepeater_ItemDataBound">
            <HeaderTemplate>
                <div class="news-section">
                    <h4>اطلاعیه ها</h4>
            </HeaderTemplate>
            <ItemTemplate>
                <p>
                    <a href="#" onclick="ShowNews(this);" title='<%#Eval("News") %>'><%#Eval("Lead") %></a>
                    <span><i class="icon-time"></i>در <%#Eval("StartDateFa") %></span>
                </p>
            </ItemTemplate>
            <FooterTemplate>
                </div>
                <div id="divNews" class="alert alert-info">
                </div>
            </FooterTemplate>
        </asp:Repeater>

    </div>
    <img src="images/moarefi.jpg" alt="نرم افزار گردش کار" />
    <br />

</asp:Content>
