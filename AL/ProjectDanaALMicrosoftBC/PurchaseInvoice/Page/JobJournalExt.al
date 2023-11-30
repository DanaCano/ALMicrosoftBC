pageextension 50306 "Job Journal Ext" extends "Job Journal"
{
    layout
    {
        addlast("Control1") // Remplace "GroupeControl" par le groupe de fields approprié
        {
            field("New Column"; Rec."New Column")
            {
                ApplicationArea = All;
            }
        }
    }
}