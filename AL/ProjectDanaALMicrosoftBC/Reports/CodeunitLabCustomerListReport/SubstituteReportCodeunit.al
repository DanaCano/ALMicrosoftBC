codeunit 50305 "Substitute Report"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Customer - List" then
            NewReportId := Report::"LABCustomerList";
    end;
}

/*
Pour remplacer un état, vous pouvez créer une méthode et l’abonner à l’événement OnAfterSubstituteReport, comme indiqué dans le code suivant. 
L’événement OnSubstituteReport remplace l’état spécifié par le ReportId avec celui donné par le paramètre NewReportId.
Dans l’exemple suivant, l’état Customer - List sera remplacé par l’état LABCustomerList – Liste.
*/