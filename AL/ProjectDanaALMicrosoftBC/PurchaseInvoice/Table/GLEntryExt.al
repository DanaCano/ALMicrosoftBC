tableextension 50302 "G/L Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50302; "New Column"; Text[50])
        {
            Caption = 'New Column';
            DataClassification = CustomerContent;
            
        }
    }  
}


