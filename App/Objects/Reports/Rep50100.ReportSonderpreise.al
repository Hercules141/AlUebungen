report 50100 ReportSonderpreise
{
    Caption = 'Report Page Sonderpreise';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItemSonderpreise; SonderpreiseTable)
        {
            /*
            This Error check should be whitin the on query close page trigger
            */
            //? difference On Pre on Post
            trigger OnPreDataItem()
            begin
                // case true of
                //     ("Item No Var" = ''):
                //         Error('No Item No specified');
                //     // ("Variant Code Var" = ''):
                //     //     Error('No  specified');
                //     ("Starting Date Var" = 0D):
                //         Error('No Starting Date specified');
                //     ("Ending Date Var" = 0D):
                //         Error('No Ending Date specified');
                //     ("Special Unit Price Var" = 0):
                //         Error('No Special Price specified');
                //     //Date Range invalid
                //     ("Ending Date Var" - "Starting Date Var" < 0):
                //         Error('Date Range invalid');
                //     else
                //         Message('All good! Data inserted sucessfully!');
                // end;

                DataItemSonderpreise.Init();
                Validate("Item No", "Item No Var");
                Validate("Variant Code", "Variant Code Var");
                Validate("Starting Date", "Starting Date Var");
                Validate("Ending Date", "Ending Date Var");
                Validate("Currency Code", "Currency Code Var");
                // Validate("Unit Price", "Unit Price Var");
                Validate("Special Unit Price", "Special Unit Price Var");
                DataItemSonderpreise.Insert(true);
            end;


        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Item No.Field"; "Item No Var")
                    {
                        ApplicationArea = All;
                        TableRelation = Item."No.";
                        DrillDown = true;


                        /*
                        Trigger Prüfung
                        */
                        // trigger OnValidate()
                        // begin
                        //     if "Item No Var" = '' then begin
                        //         Error('Keine Artikelnummer angegeben');
                        //     end;
                        // end;
                    }
                    field("Variant Code Field"; "Variant Code Var")
                    {
                        ApplicationArea = All;
                        TableRelation = "Item Variant";
                        DrillDown = true;

                        // trigger OnValidate()
                        // begin
                        //     if ("Variant Code Var" = '' then
                        // end;
                    }
                    field("Starting Date Field"; "Starting Date Var")
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            if "Starting Date Var" = 0D then begin
                                Error('Cannot be empty');
                            end;
                        end;
                    }
                    field("Ending Date Field"; "Ending Date Var")
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            if "Ending Date Var" = 0D then begin
                                Error('Cannot be empty');
                            end;
                        end;
                    }
                    field("Currency Code Field"; "Currency Code Var")
                    {
                        ApplicationArea = All;
                        TableRelation = Currency;
                    }
                    // field("Unit Price Field"; "Unit Price")
                    // {
                    //     ApplicationArea = All;
                    // }

                    field("Special Unit Price Field"; "Special Unit Price Var")
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                            if "Special Unit Price Var" = 0 then begin
                                Error('Must Specify Special Price');
                            end;
                        end;
                    }

                }
            }
        }

        actions
        {
            area(processing)
            {
            }
        }

        /*
        //request page/ andere pages wird aus geführt wenn geschlossen
        //sicher fertig willst schließen beispiel?
        //report interessant um Einträge zu prüfen
        */
        trigger OnQueryClosePage(ClosAction: Action) retValue: Boolean
        var
            myInt: Integer;
        begin
            case true of
                ("Item No Var" = ''):
                    Error('No Item No specified');
                // ("Variant Code Var" = ''):
                //     Error('No  specified');
                ("Starting Date Var" = 0D):
                    Error('No Starting Date specified');
                ("Ending Date Var" = 0D):
                    Error('No Ending Date specified');
                ("Special Unit Price Var" = 0):
                    Error('No Special Price specified');
                //Date Range invalid
                ("Ending Date Var" - "Starting Date Var" < 0):
                    Error('Date Range invalid');
                else
                    Message('All good! Data inserted sucessfully!');
            end;
        end;
    }

    var
        "Item No Var": Code[20];
        "Variant Code Var": Code[10];
        "Starting Date Var": Date;
        "Ending Date Var": Date;
        "Currency Code Var": Code[10];
        // "Unit Price Var": Decimal;
        "Special Unit Price Var": Decimal;
}
