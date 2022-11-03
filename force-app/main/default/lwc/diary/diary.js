/**
 * Created by lukas on 23.08.2022.
 */

import {api,LightningElement} from 'lwc';
import {deleteRecord} from "lightning/uiRecordApi";
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {refreshApex} from "@salesforce/apex";

export default class Diary extends LightningElement {
    @api diaries;
   // @api recordId;

    // handleDiaryDelete(event){
    //     this.diaries.id = event.target.value;
    //     deleteRecord(this.diaries.id)
    //         .then(()=>{
    //             const toastEvent =  new ShowToastEvent({
    //                 title:'Record Deleted',
    //                 message:'Record deleted successfully',
    //                 variant:'success',
    //             })
    //             this.dispatchEvent(toastEvent);
    //
    //             return refreshApex(this.diaries.id);
    //         })
    //         .catch(error =>{
    //             this.dispatchEvent(new ShowToastEvent({
    //                 title: 'Error!!',
    //                 message: JSON.stringify(error),
    //                 variant: 'error'
    //             }),);
    //         });
    // }
}