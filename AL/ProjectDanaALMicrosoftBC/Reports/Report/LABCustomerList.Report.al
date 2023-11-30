
report 50305 LABCustomerList
{

Caption = 'LAB CustomerList';
ApplicationArea = All;
UsageCategory = ReportsAndAnalysis;
PreviewMode = Normal;
DefaultRenderingLayout = Example_RDLCLayout;

    
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting(Name);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            column(No; "No.")
            { 
                IncludeCaption = true;
            }
            column(Name; Name)
            { 
                IncludeCaption = true;
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
                
            
        dataitem(CustomerLedgers; "Cust. Ledger Entry")
        {
            DataItemLinkReference = Customer;
            DataItemLink = "Customer No." = field("No.");
            DataItemTableView = sorting("Customer No.");
            column(CustomerLedgersCustomerNo; "Customer No.")
            {
            }
            column(CustomerLedgersAmountLCY; "Amount (LCY)")
            {
            }
        }
        trigger OnPreDataItem()
        begin
            if HideBlockedCustomers then
                Customer.SetRange(Blocked, Blocked::" ");
        end;
    }
}
    

      requestpage   // Lorsque vous créez un état, une page de requête est créée automatiquement pour l’état. En outre, vous pouvez créer des options personnalisées sur la page Requête. Vous le faites en ajoutant une section requestpage.
      {
        SaveValues = true; //Dans cette section, vous pouvez définir la propriété SaveValues sur true pour enregistrer les valeurs saisies par l’utilisateur final sur la page de requête. Lorsque l’état est réexécuté, l’utilisateur final peut utiliser des filtres préalablement définis.
      layout
      {
           area(Content)
           {
              group(Options) //Lorsque l’utilisateur sélectionne l’option Masquer les clients bloqués ?, seuls les clients qui ne sont pas bloqués sont ajoutés au jeu de données.
                
	      {
                   field(HideBlockedCustomers; HideBlockedCustomers)
                   {
                       ApplicationArea = All;
                       Caption = 'Hide Blocked Customers?';
                   }
              }
           }
      }
}

    rendering
    {
        layout(Example_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Reports/LABS/layouts/LABCustomerList.rdl';
            Caption = 'LABCustomerListRDLC';
            Summary = 'An example of an RDLC Layout.';
        }

     }

    var
        HideBlockedCustomers: Boolean;
}


// Ici pour afficher une façon simple les 3 : RDLC, WORD et EXCELL.
/*report 50305 LABCustomerList
{
Caption = 'LAB CustomerList';
ApplicationArea = All;
UsageCategory = ReportsAndAnalysis;
PreviewMode = Normal;
DefaultRenderingLayout = Example_EXCELLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = sorting(Name);

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
        }
    }

    rendering
    {
        layout(Example_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Reports/LABS/layouts/LABCustomerList.rdl';
            Caption = 'LABCustomerListRDLC';
            Summary = 'An example of an RDLC Layout.';
        }
        layout(Example_WORDLayout)
        {
            Type = Word;
            LayoutFile = './src/Reports/LABS/layouts/Example_WORDLayout.docx';
            Caption = 'LABCustomerListWord';
            Summary = 'An example of an WORD Layout.';
        }
        layout(Example_EXCELLayout)
        {
            Type = Excel;
            LayoutFile = './src/Reports/LABS/layouts/Example_EXCELLayout.xlsx';
            Caption = 'LABCustomerListExcel';
            Summary = 'An example of an Excel Layout.';
        }
    } 

}*/
