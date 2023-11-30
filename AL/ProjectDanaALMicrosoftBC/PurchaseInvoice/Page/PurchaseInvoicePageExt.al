pageextension 50300 "Purchase Invoice Page Ext" extends "Purch. Invoice Subform"
{
    layout
    {
        addlast(PurchDetailLine) // "PurchDetailLine" c'est le nom du group des fields la partie "LINES" de la page "Purch. Invoice Subform".
        {
            field("New Column"; Rec."New Column")
            {
                ApplicationArea = All;
            }
        }
    }
}