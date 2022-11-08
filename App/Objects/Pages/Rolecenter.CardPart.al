/// <summary>
/// Page CardPartForRolecenter (ID 50103).
/// </summary>
page 50103 CardPartForRolecenter
{
    Caption = 'My Cue Groups';
    PageType = CardPart;
    SourceTable = SonderpreiseTable;
    // RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            cuegroup("Special Prices")
            {
                // Editable = true;
                // Enabled = true;
                field("Entry No Field"; rec.Count)
                {
                    // Style = Attention;
                    // AccessByPermission = page SonderpreiseList = x;
                    Caption = 'Special Prices Count';
                    // Image = Checklist;
                    ToolTip = 'Number of Special Prices in Table Sonderpreise';
                    ApplicationArea = all;
                    //Drilldown Page Id effects if the list is opened in "windowed mode" or "embedded" basically (with id ddpid set it opens embedded)
                    DrillDownPageId = SonderpreiseList;
                    //this trigger is necessary for the page to be clickable and have color rather than be gray
                    trigger OnDrillDown()
                    var
                        PageSonder: page SonderpreiseList;
                    begin
                        PageSonder.Run();
                    end;
                }
            }
        }
    }
}
