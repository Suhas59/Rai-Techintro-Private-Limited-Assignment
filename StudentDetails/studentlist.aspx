<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentlist.aspx.cs" Inherits="StudentDetails.studentlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
     <form id="form1" runat="server">
         <h2>&nbsp;&nbsp; Student List</h2>
   <div class="col-md-12">
       <div class="form-horizontal">
           <asp:GridView ID="grdStudent" runat="server" AutoGenerateColumns="false" AllowPaging="true"
    PageSize="10">
    <Columns>
       <%-- <asp:BoundField ItemStyle-Width="150px" DataField="FirstName" HeaderText="Name" />--%>

        <asp:TemplateField HeaderText="Name">
<ItemTemplate>
    <asp:Label ID="Label1" runat="server" Text='<%#Eval("FirstName")+ " " + Eval("MiddleName") + " "+Eval("LastName")%>' ></asp:Label>
</ItemTemplate>
            </asp:TemplateField>

        <asp:BoundField ItemStyle-Width="150px" DataField="Collage" HeaderText="Collage" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Degree" HeaderText="Degree" />
        <asp:BoundField ItemStyle-Width="150px" DataField="Specialisation" HeaderText="Specialisation" />
        <asp:BoundField ItemStyle-Width="150px" DataField="PassingDate" HeaderText="PassingDate" />
        <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City" />
        <asp:BoundField ItemStyle-Width="150px" DataField="DateOfBirth" HeaderText="DateOfBirth"  DataFormatString="{0:MM/dd/yyyy}"  />
    </Columns>
</asp:GridView>
       </div>
   </div>
         <div style="margin-left: 40px">
             <br />
             <br />
             <asp:Button ID="Button1" runat="server" Text="BackToEnter" OnClick="Button1_Click" />
         </div>
        
         </form>
</body>
</html>
