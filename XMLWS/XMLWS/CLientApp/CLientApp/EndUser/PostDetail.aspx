<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostDetail.aspx.cs" Inherits="XMLWSAssg.EndUser.PostDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body style="width:600px; height:100%; margin: 0 auto;  background-color:transparent; background-image: url('../bg4.jpg'); background-attachment:fixed;">
    <nav class="nav nav-pills nav-justified nav-fills">
  <a class="nav-link active" href="Home.aspx">MyBlog</a>
                    <a class="nav-link active" href="http://localhost:56455/Home/CurrentWeather">Current Weather</a>
        <a class="nav-link active" href="http://localhost:56455/Currency/GetCurrency">Currency</a>
                <a class="nav-link active" href="http://localhost:56455/News/GetNews">News</a>
</nav><br />
    <form id="form1" runat="server">
<!-- Header -->
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
                        <ItemTemplate>
                          <div class="jumbotron">
                            <a href="#" onclick="DoNav('<%#XPath("@id")%>')">
                                <h2><b><u><%#XPath("Title")%></u></b></h2>
                            </a>
                        <p>Posted On: <%#XPath("Date")%> by <%#XPath("Author")%></p>
                        <p>Location: <%#XPath("Location")%></p>
                        <p>
                            Tags:
                            <asp:Repeater ID="Repeater2" runat="server" 
                                DataSource='<%#XPathSelect("Hashtag/Tag")%>'>
                                <ItemTemplate>
                                    <%#Container.ItemIndex>0?", ":"" %>
                                    <%#XPath(".") %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </p>
                        </div><br /><br />
                    </ItemTemplate>
                    </asp:Repeater>
            </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="jumbotron">
                                    <h2><b>
                                    <asp:Label ID="lblTitle" runat="server" 
                                        Text="Title"></asp:Label></b></h2>
                                    <asp:Label ID="lblDatePost" runat="server" 
                                        Text="DatePost"></asp:Label><br />
                                    <asp:Label ID="lblAuthor" runat="server" 
                                        Text="Author"></asp:Label><br />
                                    <asp:Label ID="lblDesc" runat="server" 
                                        Text="Description"></asp:Label><br />
                        <asp:Image ID="Image1" runat="server"/>
                    </div><br /><br />
                    <div class="card">
                        <div class="card-body">
                                    <asp:Label ID="lblFeedback" runat="server" 
                                        Text="Visitor Feedbacks"></asp:Label><br />
                                    <%
                                        System.Xml.XmlDocument doc = XmlDataSource2.GetXmlDocument();
                                        System.Xml.XmlNodeList nodelist = doc.SelectNodes
                                            ("//Response[@PostId='" + Request.QueryString["P"] + "']");
                                        for (int i = 0; i < nodelist.Count; i++)  
                                        {
                                        %>
                                        <b><% Response.Write(nodelist[i].ChildNodes[0].InnerText);  %></b>
                                        <br />
                                        <% Response.Write(nodelist[i].ChildNodes[1].InnerText);%>
                                        <br />
                                        <br />
                                        <%
                                        } %>
                      </div>
                    </div><br /><br />
                                    <asp:Label ID="lblPostFeedback" runat="server" 
                                        Text="Post a Feedback"></asp:Label>
                                    <table>
                                        <tr style="border: none;">
                                            <td style="border-style: none; border-color: inherit;" 
                                                class="auto-style15">
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="txtNameFeedback" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:TextBox ID="txtMessageFeedback" CssClass="form-control" runat="server"  placeholder="Message"
                                                    Rows="5" TextMode="MultiLine" Width="600"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:Button ID="CommentBtn" runat="server" CssClass="btn btn-primary" Text="Add Comment"
                                        OnClick="CommentBtn_Click" />
                </asp:View>
            </asp:MultiView>
          <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
              DataFile="~/App_Data/AdminPost.xml"></asp:XmlDataSource>
          <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
              DataFile="~/App_Data/Feedback.xml"></asp:XmlDataSource>    
        </div>
    </form>
</body>
</html>
