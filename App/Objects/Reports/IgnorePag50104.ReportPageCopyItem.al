// report 50104 ReportPageCopyItem
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;

//     dataset
//     {
//         dataitem(SonderPreise; SonderpreiseTable)
//         {
//             trigger OnPreDataItem()
//             var
//                 RecSonderpreis: Record SonderpreiseTable;
//             begin

//                 // RecSonderpreis.SetFilter("Item No", '', );

//                 // if "Item No Copy" = then begin

//                 // end;
//                 selec

//                 SonderPreise.Init();
//                 Validate("Item No", "Item No Copy");
//                 Validate("Item No", "Item No Copy");
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     field(Name; "Item No Copy")
//                     {
//                         ApplicationArea = All;
//                         TableRelation = SonderpreiseTable."Item No";
//                         DrillDown = true;
//                     }
//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }

//     var
//         "Item No Copy": Code[10];

// }