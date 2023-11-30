pageextension 50400 "Job Ledger Entries Ext" extends "Job Ledger Entries"
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

