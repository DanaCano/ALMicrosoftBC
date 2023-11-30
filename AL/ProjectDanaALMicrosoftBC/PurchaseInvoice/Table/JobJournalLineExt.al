tableextension 50306 "Job Journal Line Ext" extends "Job Journal Line"
{
    fields
    {
        field(50400; "New Column"; Text[50])
        {
            Caption = 'New Column';
            DataClassification = CustomerContent;
        }
    }
}
