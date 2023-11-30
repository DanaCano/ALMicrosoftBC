pageextension 50309 CustomerList extends "Customer List"
{
    layout
     {
         // Add changes to page layout here
     }

     actions
     {
         // Add changes to page actions here

         addafter("&Customer")
         {
             action(ExportToXml)
             {
                 Caption = 'Export to XML';
                 ToolTip = 'Export to XML';
                 ApplicationArea = All;
                 Image = XMLFile;

                 trigger OnAction()
                 var
                     TempBlob: Codeunit "Temp Blob";
                     CustomerXml: XmlPort "Customer XML";
                     OutStr: OutStream;
                     InStr: InStream;
                     FileName: Text;
                 begin
                     TempBlob.CreateOutStream(OutStr);
                     CustomerXml.SetDestination(OutStr);
                     CustomerXml.Export();
                     TempBlob.CreateInStream(InStr);
                     FileName := 'Customers.xml';
                     File.DownloadFromStream(InStr, 'Download', '', '', FileName);
                 end;
             }
         }
     }

     var
         myInt: Integer;
}













// Ouvrez le fichier app.json et redéfinissez le paramètre name sur XML client. Redéfinissez le paramètre publisher sur Cronus International Ltd.
// Ouvrez le fichier launch.json et modifiez le startupObjectId en 22, qui est la Liste des clients.
// Publiez votre extension dans le bac à sable. Sélectionnez Afficher > Palette de commandes... (Ctrl+Shift+P).
// Saisissez AL: Publish dans la zone de recherche (ou appuyez sur la touche de raccourci F5), puis sélectionnez la commande dans la liste.
// Sélectionnez l’action Exporter vers un fichier XML dans le menu si vous souhaitez tester la fonctionnalité XMLport.