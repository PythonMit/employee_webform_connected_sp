<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="displayemp.aspx.cs" Inherits="employee_webform_connected_sp.displayemp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Create Employee</asp:LinkButton><br />
   
    
    <asp:Table Visible="false" CellPadding="15" runat="server" ID="uptable"  Width="50%" HorizontalAlign="Center">
          <asp:TableRow ID="rowid" Visible="false">
            <asp:TableCell>
                <asp:Label ID="Label10" runat="server" Text="Emaployee id" ></asp:Label> </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtid" runat="server" ></asp:TextBox></asp:TableCell>

        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label1" runat="server" Text="Emaployee name"></asp:Label> </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></asp:TableCell>

        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Emaployee email"></asp:Label> </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></asp:TableCell>

        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label3" runat="server" Text="Emaployee salary"></asp:Label> </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtsal" runat="server"></asp:TextBox></asp:TableCell>

        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label4" runat="server" Text="Emaployee birthday"></asp:Label> </asp:TableCell>
            <asp:TableCell>
                  <asp:TextBox ID="txtdob" runat="server" TextMode="Date"  ></asp:TextBox></asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Emaployee Address"></asp:Label> </asp:TableCell>
            <asp:TableCell>
                  <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox></asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label6" runat="server" Text="Emaployee mobile "></asp:Label> </asp:TableCell>
            <asp:TableCell>
                  <asp:TextBox ID="txtmob" runat="server"></asp:TextBox></asp:TableCell>

        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label7" runat="server" Text="Emaployee designation "></asp:Label> </asp:TableCell>
            <asp:TableCell>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>sr devloper</asp:ListItem>
                    <asp:ListItem>Jr devloper</asp:ListItem>
                    <asp:ListItem>designer</asp:ListItem>
                    <asp:ListItem>Trainee</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Labeldeg" runat="server" Text="" Visible="false"></asp:Label>
            </asp:TableCell>
              

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label8" runat="server" Text="Emaployee gender "></asp:Label> </asp:TableCell>
            <asp:TableCell>

                
                <asp:RadioButton ID="radgenm" runat="server" GroupName="gender" Text="Male" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="radgenf" runat="server" GroupName="gender" Text="Female" />
            
                 </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnup" runat="server" Text="update" OnClick="up_click" />  </asp:TableCell>
            <asp:TableCell>
                    <asp:Button ID="btncan" runat="server" Text="cancel" OnClick="can_click"/>  
                </asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>





    <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
onrowdeleting="GridView1_RowDeleting"  OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
         <Columns>
         
             <asp:TemplateField HeaderText="Id" ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText=" Name"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                 </ItemTemplate>
               <%--  <EditItemTemplate>
                     <asp:TextBox ID="txtname" runat="server" Text='<%#Eval("name") %>'>

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
             <asp:TemplateField HeaderText=" Email"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblemail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                 </ItemTemplate>
                <%-- <EditItemTemplate>
                     <asp:TextBox ID="txtemail" runat="server" Text='<%#Eval("email") %>'>

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
              <asp:TemplateField HeaderText=" Mobile Number"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblemob" runat="server" Text='<%#Eval("mob") %>'></asp:Label>
                 </ItemTemplate>
               <%--  <EditItemTemplate>
                     <asp:TextBox ID="txtmob" runat="server" Text='<%#Eval("mob") %>'>

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
             <asp:TemplateField HeaderText=" Designation"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lbldesignation" runat="server" Text='<%#Eval("designation") %>'></asp:Label>
                 </ItemTemplate>
                <%-- <EditItemTemplate>
                      <asp:TextBox ID="DropDownList1" runat="server" Text='<%#Eval("designation") %>'>
                          </asp:TextBox>--%>
                    <%-- <asp:DropDownList ID="DropDownList1" runat="server" Text='<%#Eval("designation") %>'>
                    <asp:ListItem>sr devloper</asp:ListItem>
                    <asp:ListItem>Jr devloper</asp:ListItem>
                    <asp:ListItem>designer</asp:ListItem>
                    <asp:ListItem>Trainee</asp:ListItem>
                </asp:DropDownList>--%>

                    
                <%-- </EditItemTemplate>--%>
             </asp:TemplateField >
             <asp:TemplateField HeaderText="Date of Birthday"  ItemStyle-HorizontalAlign="Center"  >
                 <ItemTemplate  > 
                     <asp:Label ID="lbldob" runat="server" Text='<%#Eval("dob","{0:d}") %>' ></asp:Label>
                 </ItemTemplate>
                <%-- <EditItemTemplate   >
                     <asp:TextBox ID="txtdob" runat="server" Text='<%#Eval("dob")  %>' DataFormatString="{0:d}" >

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
              <asp:TemplateField HeaderText=" salary"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblsalary" runat="server" Text='<%#Eval("salary") %>'></asp:Label>
                 </ItemTemplate>
                <%-- <EditItemTemplate>
                     <asp:TextBox ID="txtsal" runat="server" Text='<%#Eval("salary") %>'>

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
             <asp:TemplateField HeaderText=" Address"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                 </ItemTemplate>
               <%--  <EditItemTemplate>
                     <asp:TextBox ID="txtaddress" runat="server" Text='<%#Eval("address") %>'>

                     </asp:TextBox>
                 </EditItemTemplate>--%>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Employee Gender"  ItemStyle-HorizontalAlign="Center" >
                 <ItemTemplate>
                     <asp:Label ID="lblgender" runat="server" Text='<%#Eval("gender") %>'></asp:Label>
                 </ItemTemplate>
                <%-- <EditItemTemplate>
                   
                      <asp:RadioButton ID="radgenm" runat="server" GroupName="gender" Text="Male"  />
                      <asp:RadioButton id="radgenf" runat="server" GroupName="gender" Text="feMale"/>
                   
                 </EditItemTemplate>--%>
             </asp:TemplateField>
              <asp:TemplateField HeaderText="Action">
                 <ItemTemplate>
                       <asp:LinkButton runat="server" ID="btnEdit" Text="Edit" CommandName="Edit" ToolTip="Click here to Edit the record" />    
                        <asp:LinkButton runat="server" ID="btndel" Text="Delete" CommandName="Delete" ToolTip="Click here to delete the record" OnClientClick="return confirm('Are You Sure You want to Delete the Record?');" />    
                 </ItemTemplate>
                  
                  </asp:TemplateField>
         </Columns>
         </asp:GridView>
    
     <table >
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Enter the employee id "></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="getemp" runat="server"></asp:TextBox></td>
            <td><asp:Button ID="getempdata" runat="server" Text="Get" OnClick="getemp_Click" /> </td>
            
        </tr>
    </table>

  

</asp:Content>
