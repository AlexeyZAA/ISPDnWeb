 <%@ Page Title="Аудит информационных систем персональных данных" Language="C#" MasterPageFile="~/MemberPages/MasterPageAudit.Master" AutoEventWireup="true"
    CodeBehind="WebFormAuditFirst.aspx.cs" Inherits="WebApplicationISPDn._Default" %>

<asp:Content ID="headAudit" runat="server" ContentPlaceHolderID="headAudit">
</asp:Content>
<asp:Content ID="ContentPlaceHolderAudit" runat="server" ContentPlaceHolderID="ContentPlaceHolderAudit">
    <asp:DetailsView ID="DetailsViewOrganization" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="OrgOperatorID" 
        DataSourceID="SqlDataSourceOrganization" Height="50px" 
        onload="DetailsViewOrganization_Load" Width="800px" BackColor="White" 
        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Vertical" HorizontalAlign="Center" 
        onitemdeleting="DetailsViewOrganization_ItemDeleting" 
        onitemupdating="DetailsViewOrganization_ItemUpdating" 
        onunload="DetailsViewOrganization_Unload">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <EditRowStyle Font-Bold="False" CssClass="shabl" />
        <Fields>
            <asp:BoundField DataField="OrgOperatorID" HeaderText="OrgOperatorID" 
                InsertVisible="False" ReadOnly="True" SortExpression="OrgOperatorID" />
            <asp:BoundField DataField="OrgOperatorKratkName" 
                HeaderText="OrgOperatorKratkName" 
                SortExpression="OrgOperatorKratkName" />
            <asp:BoundField DataField="OrgOperatorFullName" 
                HeaderText="OrgOperatorFullName" 
                SortExpression="OrgOperatorFullName" />
            <asp:BoundField DataField="OrgOperatorINN" HeaderText="OrgOperatorINN" 
                SortExpression="OrgOperatorINN" />
            <asp:BoundField DataField="OrgOperatorRukovoditelName" 
                HeaderText="OrgOperatorRukovoditelName" 
                SortExpression="OrgOperatorRukovoditelName" />
            <asp:BoundField DataField="OrgOperatorRukovoditelDolgn" 
                HeaderText="OrgOperatorRukovoditelDolgn" 
                SortExpression="OrgOperatorRukovoditelDolgn" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                SortExpression="UserID" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <InsertRowStyle CssClass="shabl" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceOrganization" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="DELETE FROM [OrgOperator] WHERE [OrgOperatorID] = @original_OrgOperatorID AND (([OrgOperatorKratkName] = @original_OrgOperatorKratkName) OR ([OrgOperatorKratkName] IS NULL AND @original_OrgOperatorKratkName IS NULL)) AND (([OrgOperatorFullName] = @original_OrgOperatorFullName) OR ([OrgOperatorFullName] IS NULL AND @original_OrgOperatorFullName IS NULL)) AND (([OrgOperatorINN] = @original_OrgOperatorINN) OR ([OrgOperatorINN] IS NULL AND @original_OrgOperatorINN IS NULL)) AND (([OrgOperatorRukovoditelName] = @original_OrgOperatorRukovoditelName) OR ([OrgOperatorRukovoditelName] IS NULL AND @original_OrgOperatorRukovoditelName IS NULL)) AND (([OrgOperatorRukovoditelDolgn] = @original_OrgOperatorRukovoditelDolgn) OR ([OrgOperatorRukovoditelDolgn] IS NULL AND @original_OrgOperatorRukovoditelDolgn IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL))" 
        InsertCommand="INSERT INTO [OrgOperator] ([OrgOperatorKratkName], [OrgOperatorFullName], [OrgOperatorINN], [OrgOperatorRukovoditelName], [OrgOperatorRukovoditelDolgn], [UserID]) VALUES (@OrgOperatorKratkName, @OrgOperatorFullName, @OrgOperatorINN, @OrgOperatorRukovoditelName, @OrgOperatorRukovoditelDolgn, @UserID)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT OrgOperatorID, OrgOperatorKratkName, OrgOperatorFullName, OrgOperatorINN, OrgOperatorRukovoditelName, OrgOperatorRukovoditelDolgn, UserID FROM OrgOperator WHERE (UserID = @ParamUserID)" 
        
        UpdateCommand="UPDATE [OrgOperator] SET [OrgOperatorKratkName] = @OrgOperatorKratkName, [OrgOperatorFullName] = @OrgOperatorFullName, [OrgOperatorINN] = @OrgOperatorINN, [OrgOperatorRukovoditelName] = @OrgOperatorRukovoditelName, [OrgOperatorRukovoditelDolgn] = @OrgOperatorRukovoditelDolgn, [UserID] = @UserID WHERE [OrgOperatorID] = @original_OrgOperatorID AND (([OrgOperatorKratkName] = @original_OrgOperatorKratkName) OR ([OrgOperatorKratkName] IS NULL AND @original_OrgOperatorKratkName IS NULL)) AND (([OrgOperatorFullName] = @original_OrgOperatorFullName) OR ([OrgOperatorFullName] IS NULL AND @original_OrgOperatorFullName IS NULL)) AND (([OrgOperatorINN] = @original_OrgOperatorINN) OR ([OrgOperatorINN] IS NULL AND @original_OrgOperatorINN IS NULL)) AND (([OrgOperatorRukovoditelName] = @original_OrgOperatorRukovoditelName) OR ([OrgOperatorRukovoditelName] IS NULL AND @original_OrgOperatorRukovoditelName IS NULL)) AND (([OrgOperatorRukovoditelDolgn] = @original_OrgOperatorRukovoditelDolgn) OR ([OrgOperatorRukovoditelDolgn] IS NULL AND @original_OrgOperatorRukovoditelDolgn IS NULL)) AND (([UserID] = @original_UserID) OR ([UserID] IS NULL AND @original_UserID IS NULL))">
        <SelectParameters>
        <asp:Parameter Name="ParamUserID" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_OrgOperatorID" Type="Int32" />
            <asp:Parameter Name="original_OrgOperatorKratkName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorFullName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorINN" Type="String" />
            <asp:Parameter Name="original_OrgOperatorRukovoditelName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorRukovoditelDolgn" Type="String" />
            <asp:Parameter Name="original_UserID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrgOperatorKratkName" Type="String" />
            <asp:Parameter Name="OrgOperatorFullName" Type="String" />
            <asp:Parameter Name="OrgOperatorINN" Type="String" />
            <asp:Parameter Name="OrgOperatorRukovoditelName" Type="String" />
            <asp:Parameter Name="OrgOperatorRukovoditelDolgn" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="OrgOperatorKratkName" Type="String" />
            <asp:Parameter Name="OrgOperatorFullName" Type="String" />
            <asp:Parameter Name="OrgOperatorINN" Type="String" />
            <asp:Parameter Name="OrgOperatorRukovoditelName" Type="String" />
            <asp:Parameter Name="OrgOperatorRukovoditelDolgn" Type="String" />
            <asp:Parameter Name="UserID" Type="String" />
            <asp:Parameter Name="original_OrgOperatorID" Type="Int32" />
            <asp:Parameter Name="original_OrgOperatorKratkName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorFullName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorINN" Type="String" />
            <asp:Parameter Name="original_OrgOperatorRukovoditelName" Type="String" />
            <asp:Parameter Name="original_OrgOperatorRukovoditelDolgn" Type="String" />
            <asp:Parameter Name="original_UserID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

 </asp:Content>
