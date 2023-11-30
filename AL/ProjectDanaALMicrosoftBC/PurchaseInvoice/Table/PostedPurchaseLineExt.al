tableextension 50301 "Posted Purchase Line Ext" extends "Purch. Inv. Line"
{  
    fields
    {
        field(50301; "New Column"; Text[50])
        {
            Caption = 'New Column';
            //DataClassification = CustomerContent;
            DataClassification = ToBeClassified;
        }
    }
}
