pageextension 50305 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        report.Run(Report::LABCustomerList);
        //report.Run(Report::Example_DataItems_Join);
    end;

}

