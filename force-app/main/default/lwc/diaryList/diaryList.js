/**
 * Created by lukas on 23.08.2022.
 */


import {LightningElement, wire,api,track} from 'lwc';
import {refreshApex} from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
import getDiaryByContactId from '@salesforce/apex/DiaryController.getDiaryByContactId';
import addDiary from '@salesforce/apex/DiaryController.addDiary';
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class DiaryList extends LightningElement {
    @api deleteId;
    @api recordId;

    // @wire(getDiaryByContactId,{contactId:'$recordId'})
    // diaries;


    deleteDiary(event){
        event.preventDefault();
        event.stopPropagation();
        const recordIds = event.target.dataset.recordId;
        console.log(recordIds);
        console.log(this.recordId);
        deleteRecord(recordIds)
        .then(()=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted',
                    variant: 'success'
                })
            );
            return refreshApex(this.diaries);
        })
            .catch((error) => {
                            console.log(error);
                        });
    }

    createDiary(){
        addDiary({contactId: this.recordId, note: this.note})
            .then(()=>{
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Record created',
                        variant: 'success'
                    })
                );
                return refreshApex(this.diaries);
            })
            .catch(error => console.log(error))
    }
    handleNoteChange(event){
        this.note = event.target.value;
    }
}