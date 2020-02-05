 <%@ Page Title="Аудит информационных систем персональных данных" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true"
    CodeBehind="WebFormStep2ISPDn.aspx.cs" Inherits="WebApplicationISPDn._Default" %>

<asp:Content ID="headAudit" runat="server" ContentPlaceHolderID="headAudit">
    <style type="text/css">
        .style1
        {
            width: 362px;
        }
        .style2
        {
            width: 235px;
        }
        #Button1
        {
        }
    </style>

</asp:Content>

<asp:Content ID="ContentPlaceHolderMenuAudit" runat="server" ContentPlaceHolderID="ContentPlaceHolderMenuAudit">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep2ISPDn.aspx" 
                            Text="Данные ИСПДн"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep2Otdel.aspx" Text="Данные отделов"/>
                        <asp:MenuItem NavigateUrl="" 
                            Text="Дополнительные данные" Value="Дополнительные данные"></asp:MenuItem>
                    </Items>
                </asp:Menu>
</asp:Content>


<asp:Content ID="ContentPlaceHolderAudit" runat="server" ContentPlaceHolderID="ContentPlaceHolderAudit">
    
    <asp:DetailsView ID="DetailsViewISPDn" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        DataKeyNames="ISPDnOperatorID" DataSourceID="SqlDataSourceISPDn" 
        GridLines="Vertical" Height="50px" onload="DetailsViewISPDn_Load" 
        Width="805px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ISPDnOperatorID" />
            <asp:BoundField DataField="ISPDnOperatorName" HeaderText="ISPDnOperatorName" 
                SortExpression="ISPDnOperatorName" />
            <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                SortExpression="OrgOperatorID" />
            <asp:BoundField DataField="ISPDnKategoryID" HeaderText="ISPDnKategoryID" 
                SortExpression="ISPDnKategoryID" />
            <asp:BoundField DataField="ISPDnObemID" HeaderText="ISPDnObemID" 
                SortExpression="ISPDnObemID" />
            <asp:BoundField DataField="ISPDnKlassID" HeaderText="ISPDnKlassID" 
                SortExpression="ISPDnKlassID" />
            <asp:BoundField DataField="ISPDnIshodZashitaID" 
                HeaderText="ISPDnIshodZashitaID" SortExpression="ISPDnIshodZashitaID" />
            <asp:BoundField DataField="ISPDnTipSpecialID" HeaderText="ISPDnTipSpecialID" 
                SortExpression="ISPDnTipSpecialID" />
            <asp:BoundField DataField="ISPDnTipModeli" HeaderText="ISPDnTipModeli" 
                SortExpression="ISPDnTipModeli" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle CssClass="shabl" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceISPDn" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [ISPDnOperator] WHERE [ISPDnOperatorID] = @ISPDnOperatorID" 
        InsertCommand="INSERT INTO [ISPDnOperator] ([ISPDnOperatorName], [OrgOperatorID], [ISPDnKategoryID], [ISPDnObemID], [ISPDnKlassID], [ISPDnIshodZashitaID], [ISPDnTipSpecialID], [ISPDnTipModeli]) VALUES (@ISPDnOperatorName, @OrgOperatorID, @ISPDnKategoryID, @ISPDnObemID, @ISPDnKlassID, @ISPDnIshodZashitaID, @ISPDnTipSpecialID, @ISPDnTipModeli)" 
        SelectCommand="SELECT ISPDnOperatorID, ISPDnOperatorName, OrgOperatorID, ISPDnKategoryID, ISPDnObemID, ISPDnKlassID, ISPDnIshodZashitaID, ISPDnTipSpecialID, ISPDnTipModeli FROM ISPDnOperator WHERE (OrgOperatorID = @OrgOperatorID)" 
        
        UpdateCommand="UPDATE [ISPDnOperator] SET [ISPDnOperatorName] = @ISPDnOperatorName, [OrgOperatorID] = @OrgOperatorID, [ISPDnKategoryID] = @ISPDnKategoryID, [ISPDnObemID] = @ISPDnObemID, [ISPDnKlassID] = @ISPDnKlassID, [ISPDnIshodZashitaID] = @ISPDnIshodZashitaID, [ISPDnTipSpecialID] = @ISPDnTipSpecialID, [ISPDnTipModeli] = @ISPDnTipModeli WHERE [ISPDnOperatorID] = @ISPDnOperatorID">
        <SelectParameters>
            <asp:Parameter Name="OrgOperatorID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
        </DeleteParameters>
        <DeleteParameters>
            <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ISPDnOperatorName" Type="String" />
            <asp:Parameter Name="OrgOperatorID" Type="Int32" />
            <asp:Parameter Name="ISPDnKategoryID" Type="Int32" />
            <asp:Parameter Name="ISPDnObemID" Type="Int32" />
            <asp:Parameter Name="ISPDnKlassID" Type="Int32" />
            <asp:Parameter Name="ISPDnIshodZashitaID" Type="Int32" />
            <asp:Parameter Name="ISPDnTipSpecialID" Type="Int32" />
            <asp:Parameter Name="ISPDnTipModeli" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISPDnOperatorName" Type="String" />
            <asp:Parameter Name="OrgOperatorID" Type="Int32" />
            <asp:Parameter Name="ISPDnKategoryID" Type="Int32" />
            <asp:Parameter Name="ISPDnObemID" Type="Int32" />
            <asp:Parameter Name="ISPDnKlassID" Type="Int32" />
            <asp:Parameter Name="ISPDnIshodZashitaID" Type="Int32" />
            <asp:Parameter Name="ISPDnTipSpecialID" Type="Int32" />
            <asp:Parameter Name="ISPDnTipModeli" Type="Int32" />
            <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <br />
</asp:Content>
 <asp:Content ID="ContentSubject" runat="server" contentplaceholderid="ContentPlaceHolderSubject">
     <asp:Panel ID="PanelSubjectNoYes" runat="server">
     
     <asp:GridView ID="GridViewSubjISPDn" runat="server" AllowPaging="True" 
         AutoGenerateColumns="False" CellPadding="4" 
         DataSourceID="SqlDataSourceSubjISPDn" ForeColor="#333333" GridLines="None" 
         Width="805px" EmptyDataText="У Вас нет субъектов в данной ИСПДн">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="KategorySubjID" HeaderText="KategorySubjID" 
                 InsertVisible="False" ReadOnly="True" SortExpression="KategorySubjID" />
             <asp:BoundField DataField="KategorySubjName" HeaderText="KategorySubjName" 
                 SortExpression="KategorySubjName" />
             <asp:CheckBoxField DataField="KategorySubjSelect" 
                 HeaderText="KategorySubjSelect" SortExpression="KategorySubjSelect" />
             <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                 SortExpression="OrgOperatorID" />
             <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
             <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                 SortExpression="ISPDnOperatorID" />
         </Columns>
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
     </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSourceSubjISPDn" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         
         SelectCommand="SELECT KategorySubj.*, MnogieISPDnSubj.KategorySubjID AS Expr1, MnogieISPDnSubj.ISPDnOperatorID FROM KategorySubj INNER JOIN MnogieISPDnSubj ON KategorySubj.KategorySubjID = MnogieISPDnSubj.KategorySubjID WHERE (MnogieISPDnSubj.ISPDnOperatorID = @ParamIdISPDn)" 
         onload="SqlDataSourceSubjISPDn_Load">
         <SelectParameters>
             <asp:Parameter Name="ParamIdISPDn" />
         </SelectParameters>
     </asp:SqlDataSource>

     <asp:Button ID="ButtonVisibleListSubjAll" runat="server" 
             onclick="ButtonVisibleListSubjAll_Click" Text="отобразить субъектов" 
         Width="198px" />
     &nbsp;&nbsp;
    </asp:Panel>
     <asp:Panel ID="PanelHideSubj" runat="server" Visible="False" Width="810px" 
         BorderStyle="Groove">
     <asp:Button ID="ButtonSubjISPDnUp" runat="server" Text="Добавить" Width="194px" 
         onclick="ButtonSubjISPDnUp_Click" />
     <asp:ListView ID="ListViewSubjAll" runat="server" DataKeyNames="KategorySubjID" 
         DataSourceID="SqlDataSourceSubjAll" InsertItemPosition="LastItem" 
             ClientIDMode="Static" style="margin-right: 91px" 
             onload="ListViewSubjAll_Load">
         <AlternatingItemTemplate>
             <tr style="background-color:#FFF8DC;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjIDLabel" runat="server" 
                         Text='<%# Eval("KategorySubjID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjNameLabel" runat="server" 
                         Text='<%# Eval("KategorySubjName") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="KategorySubjSelectCheckBox" runat="server" 
                        Enabled="true" Checked='<%# Eval("KategorySubjSelect") %>'/>
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </AlternatingItemTemplate>
         <EditItemTemplate>
             <tr style="background-color:#008A8C;color: #FFFFFF;">
                 <td>
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                         Text="Обновить" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Отмена" />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjIDLabel1" runat="server" 
                         Text='<%# Eval("KategorySubjID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="KategorySubjNameTextBox" runat="server" 
                         Text='<%# Bind("KategorySubjName") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="KategorySubjSelectCheckBox" runat="server" 
                         Checked='<%# Bind("KategorySubjSelect") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                         Text='<%# Bind("OrgOperatorID") %>' />
                 </td>
             </tr>
         </EditItemTemplate>
         <EmptyDataTemplate>
             <table runat="server" 
                 
                 style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                 <tr>
                     <td>
                         Нет данных.</td>
                 </tr>
             </table>
         </EmptyDataTemplate>
         <InsertItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                         Text="Вставить" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Очистить" />
                 </td>
                 <td>
                     &nbsp;</td>
                 <td>
                     <asp:TextBox ID="KategorySubjNameTextBox" runat="server" 
                         Text='<%# Bind("KategorySubjName") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="KategorySubjSelectCheckBox" runat="server" 
                         Checked='<%# Bind("KategorySubjSelect") %>' Enabled="false" />
                 </td>
                 <td>
                     <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                         Text='<%# Bind("OrgOperatorID") %>' Enabled="false" />
                 </td>
             </tr>
         </InsertItemTemplate>
         <ItemTemplate>
             <tr style="background-color:#DCDCDC;color: #000000;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjIDLabel" runat="server" 
                         Text='<%# Eval("KategorySubjID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjNameLabel" runat="server" 
                         Text='<%# Eval("KategorySubjName") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="KategorySubjSelectCheckBox" runat="server" 
                         Checked='<%# Eval("KategorySubjSelect") %>' Enabled="true" />
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </ItemTemplate>
         <LayoutTemplate>
             <table runat="server">
                 <tr runat="server">
                     <td runat="server">
                         <table ID="itemPlaceholderContainer" runat="server" border="1" 
                             style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                             <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                 <th runat="server">
                                 </th>
                                 <th runat="server">
                                     KategorySubjID</th>
                                 <th runat="server">
                                     KategorySubjName</th>
                                 <th runat="server">
                                     KategorySubjSelect</th>
                                 <th runat="server">
                                     OrgOperatorID</th>
                             </tr>
                             <tr ID="itemPlaceholder" runat="server">
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr runat="server">
                     <td runat="server" 
                         
                         style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
         <SelectedItemTemplate>
             <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjIDLabel" runat="server" 
                         Text='<%# Eval("KategorySubjID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="KategorySubjNameLabel" runat="server" 
                         Text='<%# Eval("KategorySubjName") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="KategorySubjSelectCheckBox" runat="server" 
                         Checked='<%# Eval("KategorySubjSelect") %>' Enabled="false" />
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </SelectedItemTemplate>
     </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSourceSubjAll" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         DeleteCommand="DELETE FROM [KategorySubj] WHERE [KategorySubjID] = @KategorySubjID" 
         InsertCommand="INSERT INTO [KategorySubj] ([KategorySubjName], [KategorySubjSelect], [OrgOperatorID]) VALUES (@KategorySubjName, @KategorySubjSelect, @OrgOperatorID)" 
         SelectCommand="SELECT * FROM [KategorySubj]" 
         
             
             UpdateCommand="UPDATE [KategorySubj] SET [KategorySubjName] = @KategorySubjName, [KategorySubjSelect] = @KategorySubjSelect, [OrgOperatorID] = @OrgOperatorID WHERE [KategorySubjID] = @KategorySubjID">
         <DeleteParameters>
             <asp:Parameter Name="KategorySubjID" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="KategorySubjName" Type="String" />
             <asp:Parameter Name="KategorySubjSelect" Type="Boolean" />
             <asp:Parameter Name="OrgOperatorID" Type="Int32" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="KategorySubjName" Type="String" />
             <asp:Parameter Name="KategorySubjSelect" Type="Boolean" />
             <asp:Parameter Name="OrgOperatorID" Type="Int32" />
             <asp:Parameter Name="KategorySubjID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
         
     <asp:SqlDataSource ID="SqlDataSourceMnogieSubjISPDn" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             DeleteCommand="DELETE FROM MnogieISPDnSubj WHERE (ISPDnOperatorID = @ISPDnOperatorID)" 
             InsertCommand="INSERT INTO MnogieISPDnSubj(KategorySubjID, ISPDnOperatorID) VALUES (@KategorySubjID, @ISPDnOperatorID)" 
             SelectCommand="SELECT * FROM [MnogieISPDnSubj]">
             <DeleteParameters>
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="KategorySubjID" Type="Int32" />
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
             </InsertParameters>
         </asp:SqlDataSource>
     </asp:Panel>
     </asp:Content>

 <asp:Content ID="ContentPlaceHolderPD" runat="server" contentplaceholderid="ContentPlaceHolderPD">
     <asp:Panel ID="PanelPDNoYes" runat="server">

     <br>
     <asp:GridView ID="GridViewISPDnPD" runat="server" AllowPaging="True" 
         AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourcePD" 
         ForeColor="#333333" GridLines="None" Width="809px" 
         
         EmptyDataText="У вас не выбраны категории ПД, посмотрите их ниже и выбирете">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="KategoryPdDopID" HeaderText="KategoryPdDopID" 
                 InsertVisible="False" ReadOnly="True" SortExpression="KategoryPdDopID" />
             <asp:BoundField DataField="KategoryPdDopName" HeaderText="KategoryPdDopName" 
                 SortExpression="KategoryPdDopName" />
             <asp:CheckBoxField DataField="KategoryPdDopSelect" 
                 HeaderText="KategoryPdDopSelect" SortExpression="KategoryPdDopSelect" />
             <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                 SortExpression="OrgOperatorID" />
             <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                 SortExpression="ISPDnOperatorID" />
         </Columns>
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
     </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSourcePD" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         
         SelectCommand="SELECT KategoryPdDop.KategoryPdDopID, KategoryPdDop.KategoryPdDopName, KategoryPdDop.KategoryPdDopSelect, KategoryPdDop.OrgOperatorID, MnogieKategoryPdDopISPDn.ISPDnOperatorID FROM KategoryPdDop INNER JOIN MnogieKategoryPdDopISPDn ON KategoryPdDop.KategoryPdDopID = MnogieKategoryPdDopISPDn.KategoryPdDopID WHERE (MnogieKategoryPdDopISPDn.ISPDnOperatorID = @ParamISPDnID)" 
         onload="SqlDataSourcePD_Load">
         <SelectParameters>
             <asp:Parameter Name="ParamISPDnID" />
         </SelectParameters>
     </asp:SqlDataSource>

     <table border = "1">
     <tr>
     <td width="300px">
         <br />
         <asp:CheckBoxList ID="CheckBoxListOsnova" runat="server" 
             DataSourceID="SqlDataSourcePdosnova" DataTextField="KategoryPdName" 
             DataValueField="KategoryPdID" onload="CheckBoxListOsnova_Load">
         </asp:CheckBoxList>
         <asp:SqlDataSource ID="SqlDataSourcePdosnova" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT * FROM [KategoryPd]"></asp:SqlDataSource>
         <br />
     </td>
     <td class="style1" width="300px">   
         &nbsp;
         <asp:CheckBoxList ID="CheckBoxListSpecPD" runat="server" 
             DataSourceID="SqlDataSourcePDSpec" DataTextField="KategoryPdSpecName" 
             DataValueField="KategoryPdSpecID">
         </asp:CheckBoxList>
         <asp:SqlDataSource ID="SqlDataSourcePDSpec" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT * FROM [KategoryPdSpec]"></asp:SqlDataSource>
         </td>
     <td class="style2">     
         &nbsp;
         </td>
     </tr>
     </table>
     <br>

<asp:Button ID="ButtonAllPD" runat="server" Text="Показать все ПД" 
         onclick="ButtonAllPD_Click" />
     &nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="ButtonChekPD" runat="server" onclick="ButtonChekPD_Click" 
         Text="Добавить галочные ПД" Width="154px" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="ButtonPDcheckVid" runat="server" 
         onclick="ButtonPDcheckVid_Click" Text="Показать чеки ПД" Width="158px" />
     <br />
     <br />
     
     <asp:Panel ID="PanelISPDnPD" runat="server" BorderStyle="Solid" 
         ScrollBars="Vertical" Visible="False" Width="810px">

         <asp:Button ID="ButtonPdAdd" runat="server" onclick="ButtonPdAdd_Click" 
         Text="Добвить ПД" Width="139px" />
         <br />
         <asp:ListView ID="ListViewISPDnPD" runat="server" 
             DataKeyNames="KategoryPdDopID" DataSourceID="SqlDataSourcePDDopAll" 
             InsertItemPosition="LastItem">
             <AlternatingItemTemplate>
                 <tr style="background-color:#FFF8DC;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopName") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdDopSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="true" />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                 </tr>
             </AlternatingItemTemplate>
             <EditItemTemplate>
                 <tr style="background-color:#008A8C;color: #FFFFFF;">
                     <td>
                         <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                             Text="Обновить" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                             Text="Отмена" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopIDLabel1" runat="server" 
                             Text='<%# Eval("KategoryPdDopID") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="KategoryPdDopNameTextBox" runat="server" 
                             Text='<%# Bind("KategoryPdDopName") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdDopSelectCheckBox" runat="server" 
                             Checked='<%# Bind("KategoryPdDopSelect") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                             Text='<%# Bind("OrgOperatorID") %>' />
                     </td>
                 </tr>
             </EditItemTemplate>
             <EmptyDataTemplate>
                 <table runat="server" 
                     style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                     <tr>
                         <td>
                             Нет данных.</td>
                     </tr>
                 </table>
             </EmptyDataTemplate>
             <InsertItemTemplate>
                 <tr style="">
                     <td>
                         <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Вставить" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                             Text="Очистить" />
                     </td>
                     <td>
                         &nbsp;</td>
                     <td>
                         <asp:TextBox ID="KategoryPdDopNameTextBox" runat="server" 
                             Text='<%# Bind("KategoryPdDopName") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdDopSelectCheckBox" runat="server" 
                             Checked='<%# Bind("KategoryPdDopSelect") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                             Text='<%# Bind("OrgOperatorID") %>' />
                     </td>
                 </tr>
             </InsertItemTemplate>
             <ItemTemplate>
                 <tr style="background-color:#DCDCDC;color: #000000;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopName") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdDopSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="true" />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                 </tr>
             </ItemTemplate>
             <LayoutTemplate>
                 <table runat="server">
                     <tr runat="server">
                         <td runat="server">
                             <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                 style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                 <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                     <th runat="server">
                                     </th>
                                     <th runat="server">
                                         KategoryPdDopID</th>
                                     <th runat="server">
                                         KategoryPdDopName</th>
                                     <th runat="server">
                                         KategoryPdDopSelect</th>
                                     <th runat="server">
                                         OrgOperatorID</th>
                                 </tr>
                                 <tr ID="itemPlaceholder" runat="server">
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr runat="server">
                         <td runat="server" 
                             style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                             <asp:DataPager ID="DataPager1" runat="server">
                                 <Fields>
                                     <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                         ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                     <asp:NumericPagerField />
                                     <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                         ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                 </Fields>
                             </asp:DataPager>
                         </td>
                     </tr>
                 </table>
             </LayoutTemplate>
             <SelectedItemTemplate>
                 <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdDopNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdDopName") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdDopSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="true" />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                 </tr>
             </SelectedItemTemplate>
         </asp:ListView>

         <asp:SqlDataSource ID="SqlDataSourcePDDopAll" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             DeleteCommand="DELETE FROM [KategoryPdDop] WHERE [KategoryPdDopID] = @KategoryPdDopID" 
             InsertCommand="INSERT INTO [KategoryPdDop] ([KategoryPdDopName], [KategoryPdDopSelect], [OrgOperatorID]) VALUES (@KategoryPdDopName, @KategoryPdDopSelect, @OrgOperatorID)" 
             SelectCommand="SELECT * FROM [KategoryPdDop]" 
             UpdateCommand="UPDATE [KategoryPdDop] SET [KategoryPdDopName] = @KategoryPdDopName, [KategoryPdDopSelect] = @KategoryPdDopSelect, [OrgOperatorID] = @OrgOperatorID WHERE [KategoryPdDopID] = @KategoryPdDopID">
             <DeleteParameters>
                 <asp:Parameter Name="KategoryPdDopID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="KategoryPdDopName" Type="String" />
                 <asp:Parameter Name="KategoryPdDopSelect" Type="Boolean" />
                 <asp:Parameter Name="OrgOperatorID" Type="Int32" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="KategoryPdDopName" Type="String" />
                 <asp:Parameter Name="KategoryPdDopSelect" Type="Boolean" />
                 <asp:Parameter Name="OrgOperatorID" Type="Int32" />
                 <asp:Parameter Name="KategoryPdDopID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
      
         <asp:SqlDataSource ID="SqlDataSourceMnogieISPDnPD" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             DeleteCommand="DELETE FROM [MnogieKategoryPdDopISPDn] WHERE [ISPDnOperatorID] = @ISPDnOperatorID" 
             InsertCommand="INSERT INTO [MnogieKategoryPdDopISPDn] ([ISPDnOperatorID], [KategoryPdDopID]) VALUES (@ISPDnOperatorID, @KategoryPdDopID)" 
             SelectCommand="SELECT * FROM [MnogieKategoryPdDopISPDn]">
             <DeleteParameters>
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
                 <asp:Parameter Name="KategoryPdDopID" Type="Int32" />
             </InsertParameters>
         </asp:SqlDataSource>
     <br>
     <br>
         </asp:Panel>

         <%--Биометрические данные--%>

     <asp:GridView ID="GridViewPDBioISPDn" runat="server" AllowPaging="True" 
         AutoGenerateColumns="False" CellPadding="4" 
         DataSourceID="SqlDataSourcePDBioISPD" 
         EmptyDataText="Биометрических персональных данных пока нет" ForeColor="#333333" 
         GridLines="None" Width="392px">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="KategoryPdBioID" HeaderText="KategoryPdBioID" 
                 InsertVisible="False" ReadOnly="True" SortExpression="KategoryPdBioID" />
             <asp:BoundField DataField="KategoryPdBioName" HeaderText="KategoryPdBioName" 
                 SortExpression="KategoryPdBioName" />
             <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                 SortExpression="OrgOperatorID" />
             <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                 SortExpression="ISPDnOperatorID" />
         </Columns>
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
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSourcePDBioISPD" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         
         SelectCommand="SELECT KategoryPdBio.KategoryPdBioID, KategoryPdBio.KategoryPdBioName, KategoryPdBio.OrgOperatorID, MnogieKategoryPdBioISPDn.ISPDnOperatorID FROM KategoryPdBio INNER JOIN MnogieKategoryPdBioISPDn ON KategoryPdBio.KategoryPdBioID = MnogieKategoryPdBioISPDn.KategoryPdBioID WHERE (MnogieKategoryPdBioISPDn.ISPDnOperatorID = @ParamISPDnID)" 
         onload="SqlDataSourcePDBioISPD_Load">
         <SelectParameters>
             <asp:Parameter Name="ParamISPDnID" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
     <asp:Button ID="ButtonPDBioView" runat="server" Height="35px" 
         onclick="ButtonPDBioView_Click" Text="Показать скрыть БиоПД" Width="168px" />
     &nbsp;&nbsp;&nbsp;
     <asp:Button ID="ButtonBioPDAdd" runat="server" Height="33px" 
         onclick="ButtonBioPDAdd_Click" Text="Добавить Био ПД" Width="143px" />
     <br />
     <asp:Panel ID="PanelBioPD" runat="server" BorderStyle="Groove" Visible="False">
         <asp:ListView ID="ListViewBioPD" runat="server" DataKeyNames="KategoryPdBioID" 
             DataSourceID="SqlDataSourcePDBioAll" InsertItemPosition="LastItem">
             <AlternatingItemTemplate>
                 <tr style="background-color:#FFF8DC;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioName") %>' />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdBioSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdBioSelect") %>' Enabled="true" />
                     </td>
                 </tr>
             </AlternatingItemTemplate>
             <EditItemTemplate>
                 <tr style="background-color:#008A8C;color: #FFFFFF;">
                     <td>
                         <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                             Text="Обновить" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                             Text="Отмена" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioIDLabel1" runat="server" 
                             Text='<%# Eval("KategoryPdBioID") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="KategoryPdBioNameTextBox" runat="server" 
                             Text='<%# Bind("KategoryPdBioName") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                             Text='<%# Bind("OrgOperatorID") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdBioSelectCheckBox" runat="server" 
                             Checked='<%# Bind("KategoryPdBioSelect") %>' />
                     </td>
                 </tr>
             </EditItemTemplate>
             <EmptyDataTemplate>
                 <table runat="server" 
                     style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                     <tr>
                         <td>
                             Нет данных.</td>
                     </tr>
                 </table>
             </EmptyDataTemplate>
             <InsertItemTemplate>
                 <tr style="">
                     <td>
                         <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                             Text="Вставить" />
                         <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                             Text="Очистить" />
                     </td>
                     <td>
                         &nbsp;</td>
                     <td>
                         <asp:TextBox ID="KategoryPdBioNameTextBox" runat="server" 
                             Text='<%# Bind("KategoryPdBioName") %>' />
                     </td>
                     <td>
                         <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                             Text='<%# Bind("OrgOperatorID") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdBioSelectCheckBox" runat="server" 
                             Checked='<%# Bind("KategoryPdBioSelect") %>' />
                     </td>
                 </tr>
             </InsertItemTemplate>
             <ItemTemplate>
                 <tr style="background-color:#DCDCDC;color: #000000;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioName") %>' />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdBioSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdBioSelect") %>' Enabled="true" />
                     </td>
                 </tr>
             </ItemTemplate>
             <LayoutTemplate>
                 <table runat="server">
                     <tr runat="server">
                         <td runat="server">
                             <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                 style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                 <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                     <th runat="server">
                                     </th>
                                     <th runat="server">
                                         KategoryPdBioID</th>
                                     <th runat="server">
                                         KategoryPdBioName</th>
                                     <th runat="server">
                                         OrgOperatorID</th>
                                     <th runat="server">
                                         KategoryPdBioSelect</th>
                                 </tr>
                                 <tr ID="itemPlaceholder" runat="server">
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr runat="server">
                         <td runat="server" 
                             style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                             <asp:DataPager ID="DataPager1" runat="server">
                                 <Fields>
                                     <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                         ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                     <asp:NumericPagerField />
                                     <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                         ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                 </Fields>
                             </asp:DataPager>
                         </td>
                     </tr>
                 </table>
             </LayoutTemplate>
             <SelectedItemTemplate>
                 <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                     <td>
                         <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                             Text="Удалить" />
                         <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioIDLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioID") %>' />
                     </td>
                     <td>
                         <asp:Label ID="KategoryPdBioNameLabel" runat="server" 
                             Text='<%# Eval("KategoryPdBioName") %>' />
                     </td>
                     <td>
                         <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                             Text='<%# Eval("OrgOperatorID") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="KategoryPdBioSelectCheckBox" runat="server" 
                             Checked='<%# Eval("KategoryPdBioSelect") %>' Enabled="true" />
                     </td>
                 </tr>
             </SelectedItemTemplate>
         </asp:ListView>
         <asp:SqlDataSource ID="SqlDataSourcePDBioAll" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             DeleteCommand="DELETE FROM [KategoryPdBio] WHERE [KategoryPdBioID] = @KategoryPdBioID" 
             InsertCommand="INSERT INTO [KategoryPdBio] ([KategoryPdBioName], [OrgOperatorID], [KategoryPdBioSelect]) VALUES (@KategoryPdBioName, @OrgOperatorID, @KategoryPdBioSelect)" 
             SelectCommand="SELECT * FROM [KategoryPdBio]" 
             UpdateCommand="UPDATE [KategoryPdBio] SET [KategoryPdBioName] = @KategoryPdBioName, [OrgOperatorID] = @OrgOperatorID, [KategoryPdBioSelect] = @KategoryPdBioSelect WHERE [KategoryPdBioID] = @KategoryPdBioID">
             <DeleteParameters>
                 <asp:Parameter Name="KategoryPdBioID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="KategoryPdBioName" Type="String" />
                 <asp:Parameter Name="OrgOperatorID" Type="Int32" />
                 <asp:Parameter Name="KategoryPdBioSelect" Type="Boolean" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="KategoryPdBioName" Type="String" />
                 <asp:Parameter Name="OrgOperatorID" Type="Int32" />
                 <asp:Parameter Name="KategoryPdBioSelect" Type="Boolean" />
                 <asp:Parameter Name="KategoryPdBioID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceMnogieBioPD" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             DeleteCommand="DELETE FROM [MnogieKategoryPdBioISPDn] WHERE [ISPDnOperatorID] = @ISPDnOperatorID" 
             InsertCommand="INSERT INTO [MnogieKategoryPdBioISPDn] ([ISPDnOperatorID], [KategoryPdBioID]) VALUES (@ISPDnOperatorID, @KategoryPdBioID)" 
             SelectCommand="SELECT * FROM [MnogieKategoryPdBioISPDn]">
             <DeleteParameters>
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
                 <asp:Parameter Name="KategoryPdBioID" Type="Int32" />
             </InsertParameters>
         </asp:SqlDataSource>
         <br />
     </asp:Panel>
     <br />
     <asp:GridView ID="GridViewRabotnikiISPDn" runat="server" AllowPaging="True" 
         AutoGenerateColumns="False" CellPadding="4" 
         DataSourceID="SqlDataSourceRabotnikiISPDn" 
         EmptyDataText="Не указаны работники которые имеют доступ к ИСПДн" 
         ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="RabotnikiOrgID" HeaderText="RabotnikiOrgID" 
                 InsertVisible="False" ReadOnly="True" SortExpression="RabotnikiOrgID" />
             <asp:BoundField DataField="RabotnikiOrgFio" HeaderText="RabotnikiOrgFio" 
                 SortExpression="RabotnikiOrgFio" />
             <asp:BoundField DataField="RabotnikiOrgDolgn" HeaderText="RabotnikiOrgDolgn" 
                 SortExpression="RabotnikiOrgDolgn" />
             <asp:CheckBoxField DataField="RabotnikiOrgSelect" 
                 HeaderText="RabotnikiOrgSelect" SortExpression="RabotnikiOrgSelect" />
             <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                 SortExpression="OrgOperatorID" />
             <asp:BoundField DataField="ISPDnOperatorID" HeaderText="ISPDnOperatorID" 
                 SortExpression="ISPDnOperatorID" />
         </Columns>
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
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSourceRabotnikiISPDn" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         
         SelectCommand="SELECT RabotnikiOrg.*, MnogieISPDnRabotniki.ISPDnOperatorID FROM RabotnikiOrg INNER JOIN MnogieISPDnRabotniki ON RabotnikiOrg.RabotnikiOrgID = MnogieISPDnRabotniki.RabotnikiOrgID WHERE (MnogieISPDnRabotniki.ISPDnOperatorID = @ParamISPDnID)" 
         onload="SqlDataSourceRabotnikiISPDn_Load">
         <SelectParameters>
             <asp:Parameter Name="ParamISPDnID" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
     <asp:Button ID="ButtonRabotnikiView" runat="server" Height="30px" 
         onclick="ButtonRabotnikiView_Click" Text="Показать работников" Width="161px" />
     &nbsp;&nbsp;
     <asp:Button ID="ButtonRabotnikiAdd" runat="server" Height="32px" 
         onclick="ButtonRabotnikiAdd_Click" Text="Добавить Работников" Width="169px" />
     <br />
     <asp:ListView ID="ListViewRabotnikiISPDn" runat="server" DataKeyNames="RabotnikiOrgID" 
         DataSourceID="SqlDataSourceRabotnikiISPDnAll" 
         InsertItemPosition="LastItem" Visible="False">
         <AlternatingItemTemplate>
             <tr style="background-color:#FFF8DC;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgIDLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgFioLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgFio") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgDolgnLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgDolgn") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="RabotnikiOrgSelectCheckBox" runat="server" 
                         Checked='<%# Eval("RabotnikiOrgSelect") %>' Enabled="true" />
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </AlternatingItemTemplate>
         <EditItemTemplate>
             <tr style="background-color:#008A8C;color: #FFFFFF;">
                 <td>
                     <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                         Text="Обновить" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Отмена" />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgIDLabel1" runat="server" 
                         Text='<%# Eval("RabotnikiOrgID") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="RabotnikiOrgFioTextBox" runat="server" 
                         Text='<%# Bind("RabotnikiOrgFio") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="RabotnikiOrgDolgnTextBox" runat="server" 
                         Text='<%# Bind("RabotnikiOrgDolgn") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="RabotnikiOrgSelectCheckBox" runat="server" 
                         Checked='<%# Bind("RabotnikiOrgSelect") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                         Text='<%# Bind("OrgOperatorID") %>' />
                 </td>
             </tr>
         </EditItemTemplate>
         <EmptyDataTemplate>
             <table runat="server" 
                 style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                 <tr>
                     <td>
                         Нет данных.</td>
                 </tr>
             </table>
         </EmptyDataTemplate>
         <InsertItemTemplate>
             <tr style="">
                 <td>
                     <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                         Text="Вставить" />
                     <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                         Text="Очистить" />
                 </td>
                 <td>
                     &nbsp;</td>
                 <td>
                     <asp:TextBox ID="RabotnikiOrgFioTextBox" runat="server" 
                         Text='<%# Bind("RabotnikiOrgFio") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="RabotnikiOrgDolgnTextBox" runat="server" 
                         Text='<%# Bind("RabotnikiOrgDolgn") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="RabotnikiOrgSelectCheckBox" runat="server" 
                         Checked='<%# Bind("RabotnikiOrgSelect") %>' />
                 </td>
                 <td>
                     <asp:TextBox ID="OrgOperatorIDTextBox" runat="server" 
                         Text='<%# Bind("OrgOperatorID") %>' />
                 </td>
             </tr>
         </InsertItemTemplate>
         <ItemTemplate>
             <tr style="background-color:#DCDCDC;color: #000000;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgIDLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgFioLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgFio") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgDolgnLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgDolgn") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="RabotnikiOrgSelectCheckBox" runat="server" 
                         Checked='<%# Eval("RabotnikiOrgSelect") %>' Enabled="true" />
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </ItemTemplate>
         <LayoutTemplate>
             <table runat="server">
                 <tr runat="server">
                     <td runat="server">
                         <table ID="itemPlaceholderContainer" runat="server" border="1" 
                             style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                             <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                 <th runat="server">
                                 </th>
                                 <th runat="server">
                                     RabotnikiOrgID</th>
                                 <th runat="server">
                                     RabotnikiOrgFio</th>
                                 <th runat="server">
                                     RabotnikiOrgDolgn</th>
                                 <th runat="server">
                                     RabotnikiOrgSelect</th>
                                 <th runat="server">
                                     OrgOperatorID</th>
                             </tr>
                             <tr ID="itemPlaceholder" runat="server">
                             </tr>
                         </table>
                     </td>
                 </tr>
                 <tr runat="server">
                     <td runat="server" 
                         style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                         <asp:DataPager ID="DataPager1" runat="server">
                             <Fields>
                                 <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                     ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                 <asp:NumericPagerField />
                                 <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                     ShowNextPageButton="False" ShowPreviousPageButton="False" />
                             </Fields>
                         </asp:DataPager>
                     </td>
                 </tr>
             </table>
         </LayoutTemplate>
         <SelectedItemTemplate>
             <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                 <td>
                     <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                         Text="Удалить" />
                     <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Изменить" />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgIDLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgID") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgFioLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgFio") %>' />
                 </td>
                 <td>
                     <asp:Label ID="RabotnikiOrgDolgnLabel" runat="server" 
                         Text='<%# Eval("RabotnikiOrgDolgn") %>' />
                 </td>
                 <td>
                     <asp:CheckBox ID="RabotnikiOrgSelectCheckBox" runat="server" 
                         Checked='<%# Eval("RabotnikiOrgSelect") %>' Enabled="true" />
                 </td>
                 <td>
                     <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                         Text='<%# Eval("OrgOperatorID") %>' />
                 </td>
             </tr>
         </SelectedItemTemplate>
     </asp:ListView>
     <asp:SqlDataSource ID="SqlDataSourceRabotnikiISPDnAll" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         DeleteCommand="DELETE FROM [RabotnikiOrg] WHERE [RabotnikiOrgID] = @RabotnikiOrgID" 
         InsertCommand="INSERT INTO [RabotnikiOrg] ([RabotnikiOrgFio], [RabotnikiOrgDolgn], [RabotnikiOrgSelect], [OrgOperatorID]) VALUES (@RabotnikiOrgFio, @RabotnikiOrgDolgn, @RabotnikiOrgSelect, @OrgOperatorID)" 
         SelectCommand="SELECT * FROM [RabotnikiOrg]" 
         UpdateCommand="UPDATE [RabotnikiOrg] SET [RabotnikiOrgFio] = @RabotnikiOrgFio, [RabotnikiOrgDolgn] = @RabotnikiOrgDolgn, [RabotnikiOrgSelect] = @RabotnikiOrgSelect, [OrgOperatorID] = @OrgOperatorID WHERE [RabotnikiOrgID] = @RabotnikiOrgID">
         <DeleteParameters>
             <asp:Parameter Name="RabotnikiOrgID" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="RabotnikiOrgFio" Type="String" />
             <asp:Parameter Name="RabotnikiOrgDolgn" Type="String" />
             <asp:Parameter Name="RabotnikiOrgSelect" Type="Boolean" />
             <asp:Parameter Name="OrgOperatorID" Type="Int32" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="RabotnikiOrgFio" Type="String" />
             <asp:Parameter Name="RabotnikiOrgDolgn" Type="String" />
             <asp:Parameter Name="RabotnikiOrgSelect" Type="Boolean" />
             <asp:Parameter Name="OrgOperatorID" Type="Int32" />
             <asp:Parameter Name="RabotnikiOrgID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceMnogieRabotnikiISPDn" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
         DeleteCommand="DELETE FROM [MnogieISPDnRabotniki] WHERE [ISPDnOperatorID] = @ISPDnOperatorID" 
         InsertCommand="INSERT INTO [MnogieISPDnRabotniki] ([ISPDnOperatorID], [RabotnikiOrgID]) VALUES (@ISPDnOperatorID, @RabotnikiOrgID)" 
         SelectCommand="SELECT * FROM [MnogieISPDnRabotniki]">
         <DeleteParameters>
             <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="ISPDnOperatorID" Type="Int32" />
             <asp:Parameter Name="RabotnikiOrgID" Type="Int32" />
         </InsertParameters>
     </asp:SqlDataSource>
     <br />
         <table border="1" style="width:100%;">
             <tr>
                 <td style="text-align: center">
                     Характеристики классификации данной ИСПДн</td>
             </tr>
             <tr>
                 <td>
                     <asp:RadioButtonList ID="RadioButtonListKategoryPD" runat="server">
                         <asp:ListItem>категория 1 - персональные данные, касающиеся расовой, национальной принадлежности, политических взглядов, религиозных и философских убеждений, состояния здоровья, интимной жизни</asp:ListItem>
                         <asp:ListItem>категория 2 - персональные данные, позволяющие идентифицировать субъекта персональных данных и получить о нем дополнительную информацию, за исключением персональных данных, относящихся к категории 1</asp:ListItem>
                         <asp:ListItem>категория 3 - персональные данные, позволяющие идентифицировать субъекта персональных данных</asp:ListItem>
                         <asp:ListItem>категория 4 - обезличенные и (или) общедоступные персональные данные</asp:ListItem>
                     </asp:RadioButtonList>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:RadioButtonList ID="RadioButtonListObiemPD" runat="server">
                         <asp:ListItem>1 - в информационной системе одновременно обрабатываются персональные данные более чем 100 000 субъектов персональных данных или персональные данные субъектов персональных данных в пределах субъекта Российской Федерации или Российской Федерации в целом</asp:ListItem>
                         <asp:ListItem>2 - в информационной системе одновременно обрабатываются персональные данные от 1000 до 100 000 субъектов персональных данных или персональные данные субъектов персональных данных, работающих в отрасли экономики Российской Федерации, в органе государственной власти, проживающих в пределах муниципального образования</asp:ListItem>
                         <asp:ListItem>3 - в информационной системе одновременно обрабатываются данные менее чем 1000 субъектов персональных данных или персональные данные субъектов персональных данных в пределах конкретной организации</asp:ListItem>
                     </asp:RadioButtonList>
                 </td>
             </tr>
             <tr>
                 <td>
                     &nbsp;
                     <br />
                     <asp:Label ID="LabelErrorKlass" runat="server" Font-Size="Larger" 
                         ForeColor="Red"></asp:Label>
                     <br />
                     <asp:Button ID="ButtonKlassISPDn" runat="server" Height="30px" 
                         onclick="ButtonKlassISPDn_Click" Text="Классифицировать" Width="190px" />
                     <br />
                 </td>
             </tr>
         </table>
         <asp:RadioButtonList ID="RadioButtonListTipModeli" runat="server" Height="253px" 
             Width="764px">
             <asp:ListItem>автоматизированное рабочее место, не имеющее подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
             <asp:ListItem>автоматизированное рабочее место, имеющее подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
             <asp:ListItem>локальная ИСПДн, не имеющая подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
             <asp:ListItem>локальная ИСПДн, имеющия подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
             <asp:ListItem>распределенная ИСПДн, не имеющая подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
             <asp:ListItem>распределенная ИСПДн, имеющия подключение к сетям связи общего пользования и (или) сетям международного информационного обмена</asp:ListItem>
         </asp:RadioButtonList>
<p>
    <asp:Label ID="LabelErrorTipISPDn" runat="server" ForeColor="Red"></asp:Label>
    <br>
     <asp:Button ID="ButtonTipModeli" runat="server" Text="Тип Модели ИСПДн" 
        Width="179px" onclick="ButtonTipModeli_Click" />
     <p>
         &nbsp;<p>
             &nbsp;</p>
         <p>
         </p>
     </p>
     </asp:Panel>


 </asp:Content>



