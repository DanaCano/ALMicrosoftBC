pageextension 50303 GeneralJournalExt extends "General Journal"
{
    layout
    {
        addlast(Control1) // "PurchDetailLine" c'est le nom du group des fields la partie "LINES" de la page "Purch. Invoice Subform".
        {
            field("New Column"; Rec."New Column")
            {
                ApplicationArea = All;
            }
        }
    }
}
