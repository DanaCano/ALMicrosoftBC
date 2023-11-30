pageextension 50301 "Posted Purch. Invoice Page Ext" extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addlast(Control1) // Section similaire à celle de la page d'origine ("Posted Purch. Invoice Subform": Sous-formulaire  d'achat posté. Facture)
        {
            field("New Column"; Rec."New Column")
            {
                ApplicationArea = All;
            }
        }
        
    }
    
}