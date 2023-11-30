page 50308 "My Headlines"
{
    PageType = HeadlinePart;


    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                   ApplicationArea = All;

                   
                }
                field(Awesome; BusinessCentralIsAwesomeLbl)
                {
                   ApplicationArea = All;


                   trigger OnDrillDown()
                   begin 
                      Hyperlink('https://go.microsoft.com/fwlink/?linkid=867580');
                   end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId());
    end;

    var
        WelcomeLbl: Label 'Welcome %1';
        BusinessCentralIsAwesomeLbl: Label '<qualifier>Profile Dana - BC</qualifier><payload>Headlines in <emphasize>Business Central</emphasize> are awesome!</payload>';
        Welcome: Text; 

}