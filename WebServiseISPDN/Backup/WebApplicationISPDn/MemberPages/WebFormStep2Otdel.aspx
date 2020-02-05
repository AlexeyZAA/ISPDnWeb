<%@ Page Title="" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true" CodeBehind="WebFormStep2Otdel.aspx.cs" Inherits="WebApplicationISPDn.MemberPages.WebFormStep2Otdel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headAudit" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMenuAudit" runat="server">
                <asp:Menu ID="NavigationMenuOtdel" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep2ISPDn.aspx" 
                            Text="Данные ИСПДн"/>
                        <asp:MenuItem NavigateUrl="~/MemberPages/WebFormStep2Otdel.aspx" Text="Данные отделов"/>
                        <asp:MenuItem NavigateUrl="" 
                            Text="Дополнительные данные" Value="Дополнительные данные"></asp:MenuItem>
                    </Items>
                </asp:Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderAudit" runat="server">

    <asp:DetailsView ID="DetailsViewOtdel" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="OtdelOrgID" 
        DataSourceID="SqlDataSourceOtdel" GridLines="Vertical" Height="50px" 
        onload="DetailsViewOtdel_Load" Width="681px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="OtdelOrgID" HeaderText="OtdelOrgID" 
                InsertVisible="False" ReadOnly="True" SortExpression="OtdelOrgID" />
            <asp:BoundField DataField="OtdelOrgName" HeaderText="OtdelOrgName" 
                SortExpression="OtdelOrgName" />
            <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                SortExpression="OrgOperatorID" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle CssClass="shabl" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [OtdelOrg] WHERE [OtdelOrgID] = @OtdelOrgID" 
        InsertCommand="INSERT INTO [OtdelOrg] ([OtdelOrgName], [OrgOperatorID]) VALUES (@OtdelOrgName, @OrgOperatorID)" 
        SelectCommand="SELECT OtdelOrgID, OtdelOrgName, OrgOperatorID FROM OtdelOrg WHERE (OrgOperatorID = @ParamOrgID)" 
        UpdateCommand="UPDATE [OtdelOrg] SET [OtdelOrgName] = @OtdelOrgName, [OrgOperatorID] = @OrgOperatorID WHERE [OtdelOrgID] = @OtdelOrgID">
        <SelectParameters>
            <asp:Parameter Name="ParamOrgID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="OtdelOrgID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OtdelOrgName" Type="String" />
            <asp:Parameter Name="OrgOperatorID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="OtdelOrgName" Type="String" />
            <asp:Parameter Name="OrgOperatorID" Type="Int32" />
            <asp:Parameter Name="OtdelOrgID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSubject" runat="server">
    <asp:Panel ID="PanelSubjYesNoOtdel" runat="server">
        <asp:GridView ID="GridViewSubjOtdel" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSourceSubjOtdel" ForeColor="#333333" 
            GridLines="None" Width="681px">
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
                <asp:BoundField DataField="OtdelOrgID" HeaderText="OtdelOrgID" 
                    SortExpression="OtdelOrgID" />
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
    
        <asp:SqlDataSource ID="SqlDataSourceSubjOtdel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            onload="SqlDataSourceSubjOtdel_Load" 
            SelectCommand="SELECT KategorySubj.KategorySubjID, KategorySubj.KategorySubjName, KategorySubj.KategorySubjSelect, KategorySubj.OrgOperatorID, MnogieOtdelSubj.OtdelOrgID FROM KategorySubj INNER JOIN MnogieOtdelSubj ON KategorySubj.KategorySubjID = MnogieOtdelSubj.KategorySubjID WHERE (MnogieOtdelSubj.OtdelOrgID = @ParamOtdelID)">
            <SelectParameters>
                <asp:Parameter Name="ParamOtdelID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="ButtonSubjAllOtdel" runat="server" 
            onclick="ButtonSubjAllOtdel_Click" Text="Отобразить всех субъектов" 
            Width="215px" />
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelHideSubjOtdel" runat="server" BorderWidth="1px">
        <asp:Button ID="ButtonSubjAdd" runat="server" Text="Добавить субъектов " 
            Width="216px" onclick="ButtonSubjAdd_Click" />
        <asp:ListView ID="ListViewSubjOtdelAll" runat="server" 
            DataKeyNames="KategorySubjID" DataSourceID="SqlDataSourceSubjOtdelAll" 
            style="margin-right: 166px" Visible="False">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
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
                            Checked='<%# Bind("KategorySubjSelect") %>' />
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
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourceSubjOtdelAll" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT * FROM [KategorySubj]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceMnogieSubjOtdel" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [MnogieOtdelSubj] WHERE [OtdelOrgID] = @OtdelOrgID" 
            InsertCommand="INSERT INTO [MnogieOtdelSubj] ([KategorySubjID], [OtdelOrgID]) VALUES (@KategorySubjID, @OtdelOrgID)" 
            SelectCommand="SELECT [KategorySubjID], [OtdelOrgID] FROM [MnogieOtdelSubj]">
            <DeleteParameters>
                <asp:Parameter Name="OtdelOrgID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KategorySubjID" Type="Int32" />
                <asp:Parameter Name="OtdelOrgID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelOtdelPDNoYes" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceOtdelPD" 
            ForeColor="#333333" GridLines="None">
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
                <asp:BoundField DataField="OtdelOrgID" HeaderText="OtdelOrgID" 
                    SortExpression="OtdelOrgID" />
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
        <asp:SqlDataSource ID="SqlDataSourceOtdelPD" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT KategoryPdDop.KategoryPdDopID, KategoryPdDop.KategoryPdDopName, KategoryPdDop.KategoryPdDopSelect, KategoryPdDop.OrgOperatorID, MnogieKategoryDopOtdel.OtdelOrgID FROM KategoryPdDop INNER JOIN MnogieKategoryDopOtdel ON KategoryPdDop.KategoryPdDopID = MnogieKategoryDopOtdel.KategoryPdDopID WHERE (MnogieKategoryDopOtdel.OtdelOrgID = @ParamOtdelID)">
            <SelectParameters>
                <asp:Parameter Name="ParamOtdelID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <table border="1" style="width:100%;">
            <tr>
                <td>
                    <asp:CheckBoxList ID="CheckBoxListOtdelOsnova" runat="server" 
                        DataSourceID="SqlDataSourceOtdelOsnovaPD" DataTextField="KategoryPdName" 
                        DataValueField="KategoryPdID">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSourceOtdelOsnovaPD" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        SelectCommand="SELECT * FROM [KategoryPd]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:CheckBoxList ID="CheckBoxListOtdelSpecPD" runat="server" 
                        DataSourceID="SqlDataSourceOtdelPDSpec" DataTextField="KategoryPdSpecName" 
                        DataValueField="KategoryPdSpecID">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSourceOtdelPDSpec" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                        SelectCommand="SELECT * FROM [KategoryPdSpec]"></asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:Button ID="ButtonPDOtdelAll" runat="server" 
            onclick="ButtonPDOtdelAll_Click" Text="Показать все ПД" Width="204px" />
        &nbsp;&nbsp;
        <asp:Button ID="ButtonChekOtdelPD" runat="server" 
            onclick="ButtonChekOtdelPD_Click" Text="Добавить галочные ПД" Width="179px" />
        &nbsp;
        <asp:Button ID="ButtonOtdelPDcheckVid" runat="server" 
            onclick="ButtonOtdelPDcheckVid_Click" Text="Показать чеки ПД" Width="190px" />
        <br />
        <br />
        <asp:Panel ID="PanelOtdel" runat="server" Visible="False">
            <asp:Button ID="ButtonOtdelPDAdd" runat="server" Text="Добавить ПД" 
                Width="202px" />
            &nbsp;&nbsp;
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="KategoryPdDopID" 
                DataSourceID="SqlDataSourceOtdelPDDopAll" InsertItemPosition="LastItem">
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
                                Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="false" />
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
                                Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="false" />
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
                                Checked='<%# Eval("KategoryPdDopSelect") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="OrgOperatorIDLabel" runat="server" 
                                Text='<%# Eval("OrgOperatorID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceOtdelPDDopAll" runat="server" 
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
            <asp:SqlDataSource ID="SqlDataSourceMnogieOtdelBioPD" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                DeleteCommand="DELETE FROM [MnogieKategoryDopOtdel] WHERE [OtdelOrgID] = @OtdelOrgID AND [KategoryPdDopID] = @KategoryPdDopID" 
                InsertCommand="INSERT INTO [MnogieKategoryDopOtdel] ([OtdelOrgID], [KategoryPdDopID]) VALUES (@OtdelOrgID, @KategoryPdDopID)" 
                SelectCommand="SELECT * FROM [MnogieKategoryDopOtdel]">
                <DeleteParameters>
                    <asp:Parameter Name="OtdelOrgID" Type="Int32" />
                    <asp:Parameter Name="KategoryPdDopID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OtdelOrgID" Type="Int32" />
                    <asp:Parameter Name="KategoryPdDopID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <br />
        <asp:GridView ID="GridViewOtdelBioPD" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSourceOtdelBioPD" ForeColor="#333333" GridLines="None" 
            Width="731px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="KategoryPdBioID" HeaderText="KategoryPdBioID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="KategoryPdBioID" />
                <asp:BoundField DataField="KategoryPdBioName" HeaderText="KategoryPdBioName" 
                    SortExpression="KategoryPdBioName" />
                <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                    SortExpression="OrgOperatorID" />
                <asp:CheckBoxField DataField="KategoryPdBioSelect" 
                    HeaderText="KategoryPdBioSelect" SortExpression="KategoryPdBioSelect" />
                <asp:BoundField DataField="OtdelOrgID" HeaderText="OtdelOrgID" 
                    SortExpression="OtdelOrgID" />
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
        <asp:SqlDataSource ID="SqlDataSourceOtdelBioPD" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            
            SelectCommand="SELECT KategoryPdBio.KategoryPdBioID, KategoryPdBio.KategoryPdBioName, KategoryPdBio.OrgOperatorID, KategoryPdBio.KategoryPdBioSelect, MnogieKategoryBioOtdel.OtdelOrgID FROM KategoryPdBio INNER JOIN MnogieKategoryBioOtdel ON KategoryPdBio.KategoryPdBioID = MnogieKategoryBioOtdel.KategoryPdBioID WHERE (MnogieKategoryBioOtdel.OtdelOrgID = @ParamOtdelID)" 
            onload="SqlDataSourceOtdelBioPD_Load">
            <SelectParameters>
                <asp:Parameter Name="ParamOtdelID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="ButtonOtdelPDBioView" runat="server" 
            onclick="ButtonOtdelPDBioView_Click" Text="Показать скрыть БиоПД" 
            Width="155px" />
        <asp:Button ID="ButtonOtdelBioPDAdd" runat="server" 
            onclick="ButtonOtdelBioPDAdd_Click" style="margin-left: 22px" 
            Text="Добавить Био ПД" Width="145px" />
        <br />
        <br />
        <asp:Panel ID="PanelOtdelBioPD" runat="server" BorderWidth="1px" 
            Visible="False">
            <asp:ListView ID="ListViewOtdelBioPD" runat="server" 
                DataKeyNames="KategoryPdBioID" DataSourceID="SqlDataSourceOtdelBioPDAll" 
                InsertItemPosition="LastItem" style="margin-right: 17px">
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
            <asp:SqlDataSource ID="SqlDataSourceOtdelBioPDAll" runat="server" 
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
            <asp:SqlDataSource ID="SqlDataSourceMnogieBioOtdelPD" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                DeleteCommand="DELETE FROM MnogieKategoryBioOtdel WHERE (OtdelOrgID = @OtdelOrgID)" 
                InsertCommand="INSERT INTO [MnogieKategoryBioOtdel] ([OtdelOrgID], [KategoryPdBioID]) VALUES (@OtdelOrgID, @KategoryPdBioID)" 
                SelectCommand="SELECT * FROM [MnogieKategoryBioOtdel]">
                <DeleteParameters>
                    <asp:Parameter Name="OtdelOrgID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OtdelOrgID" Type="Int32" />
                    <asp:Parameter Name="KategoryPdBioID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <br />
        <asp:GridView ID="GridViewRabotnikiOtdel" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSourceOtdelRabotniki" ForeColor="#333333" GridLines="None" 
            Width="714px" Visible="False">
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
                <asp:BoundField DataField="OtdelOrgID" HeaderText="OtdelOrgID" 
                    SortExpression="OtdelOrgID" />
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
        <asp:SqlDataSource ID="SqlDataSourceOtdelRabotniki" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            
            SelectCommand="SELECT RabotnikiOrg.RabotnikiOrgID, RabotnikiOrg.RabotnikiOrgFio, RabotnikiOrg.RabotnikiOrgDolgn, RabotnikiOrg.RabotnikiOrgSelect, RabotnikiOrg.OrgOperatorID, MnogieRabotnikiOtdel.OtdelOrgID FROM RabotnikiOrg INNER JOIN MnogieRabotnikiOtdel ON RabotnikiOrg.RabotnikiOrgID = MnogieRabotnikiOtdel.RabotnikiOrgID WHERE (MnogieRabotnikiOtdel.OtdelOrgID = @ParamOtdelID)" 
            onload="SqlDataSourceOtdelRabotniki_Load">
            <SelectParameters>
                <asp:Parameter Name="ParamOtdelID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="ButtonOtdelRabotnikiView" runat="server" 
            Text="Показать работников" Width="180px" 
            onclick="ButtonOtdelRabotnikiView_Click" />
        <asp:Button ID="ButtonOtdelRabotnikiAdd" runat="server" 
            style="margin-left: 31px" Text="Добавить работников" Width="171px" 
            onclick="ButtonOtdelRabotnikiAdd_Click" />
        <br />
        <br />
        <asp:ListView ID="ListViewRabotnikiOtdel" runat="server" DataKeyNames="RabotnikiOrgID" 
            DataSourceID="SqlDataSourceOtdelRabotnikiAll" 
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
        <asp:SqlDataSource ID="SqlDataSourceOtdelRabotnikiAll" runat="server" 
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
        <asp:SqlDataSource ID="SqlDataSourceMnogieOtdelRabotniki" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [MnogieRabotnikiOtdel] WHERE [OtdelOrgID] = @OtdelOrgID" 
            InsertCommand="INSERT INTO [MnogieRabotnikiOtdel] ([OtdelOrgID], [RabotnikiOrgID]) VALUES (@OtdelOrgID, @RabotnikiOrgID)" 
            SelectCommand="SELECT * FROM [MnogieRabotnikiOtdel]">
            <DeleteParameters>
                <asp:Parameter Name="OtdelOrgID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OtdelOrgID" Type="Int32" />
                <asp:Parameter Name="RabotnikiOrgID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br>

    </asp:Panel>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderPD" runat="server">
    <asp:Panel ID="PanelPDNoYesOtdel" runat="server">
    </asp:Panel>
</asp:Content>
