pageextension 50302 "G/L Entry Page Ext" extends "General Ledger Entries"
{
    
    layout
    {
        addlast(Control1) // addlast(Control1) c'est le nom du group des fields la partie "LINES" de la page "General Ledger Entries".
        {
            field("New Column"; Rec."New Column")
            {
                ApplicationArea = All;
            }
        }
    }
}
