page 50101 SonderpreiseList
{
    Caption = 'Sonderpreise Liste';
    PageType = List;
    SourceTable = SonderpreiseTable;
    UsageCategory = Lists;
    CardPageId = SonderpreiseCardPage;

    layout
    {
        area(content)
        {
            repeater(Controlsdfsd)
            {

                Caption = 'Sonderpreise';
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }

                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = all;

                }

                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = all;

                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;

                }

                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = all;

                }

                field("Currency Code"; REc."Currency Code")
                {
                    ApplicationArea = all;

                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = all;

                }
                field("Special Unit Price"; Rec."Special Unit Price")
                {
                    ApplicationArea = all;

                }

            }


        }
    }

    actions
    {
        area(Reporting)
        {
            action(ReportPage)
            {
                ApplicationArea = All;
                RunObject = report ReportSonderpreise;
                Image = Report;
            }
        }

        area(Processing)
        {
            action("Copy Special Price")
            {
                ApplicationArea = All;
                // RunObject = page CopyItemCardPage;
                Image = Copy;

                trigger OnAction()
                var
                    SDia: page CopyItemStandardDialog;
                    RecSelected: Record SonderpreiseTable;
                    RecTemp: Record SonderpreiseTable;
                    RecMatches: Record SonderpreiseTable;
                begin

                    CurrPage.SetSelectionFilter(RecSelected);
                    RecSelected.FindSet();
                    SDia.SetSpecialPrice(RecSelected."Special Unit Price");

                    if SDia.RunModal() = Action::OK then begin

                        //check if line would be duplicate

                        RecTemp.Init();
                        RecTemp.TransferFields(RecSelected, false);
                        RecTemp.Validate("Item No", SDia.GetItemNoToCopy());
                        RecTemp.Validate("Special Unit Price", SDia.GetNewSpecialPrice());

                        Message('rec.count before setrange: %1', RecMatches.Count);
                        RecMatches.SetRange("Item No", RecTemp."Item No");
                        RecMatches.SetRange("Variant Code", RecTemp."Variant Code");
                        RecMatches.SetRange("Starting Date", RecTemp."Starting Date");
                        RecMatches.SetRange("Ending Date", RecTemp."Ending Date");
                        RecMatches.SetRange("Currency Code", RecTemp."Currency Code");
                        // RecMatches.SetRange("Unit Price", RecTemp."Unit Price");
                        Message('Rec.count after set range: %1', RecMatches.Count);

                        if RecMatches.Count = 0 then begin
                            RecTemp.Insert(true);
                            Message('insert!');
                        end
                        else begin
                            Error('Already exists!');
                        end;
                    end;
                end;

            }

            action(Historise)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemMgmt: Codeunit "Item Management";
                    RecToHistorise: Record SonderpreiseTable;
                begin
                    CurrPage.SetSelectionFilter(RecToHistorise);
                    ItemMgmt.Historise(RecToHistorise);
                end;
            }


            action(TestCode)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    string: Text;
                begin
                    string := 'Hi im a wonderful lushes great string and love to be long cause thats all that counts';
                    // Message(Format(StrPos('hello i am a text', 'am')));
                    Message(DelStr(string, StrPos(string, 'great')));
                end;
            }
        }
    }
}

